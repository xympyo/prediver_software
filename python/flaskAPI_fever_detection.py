import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score
from sklearn.impute import SimpleImputer
from flask import Flask, request, jsonify
from flask_cors import CORS

# Initialize Flask app
app = Flask(__name__)
CORS(app)

# Load and preprocess data
df = pd.read_csv("fever_medicine_data.csv")
df = df.drop(
    [
        "Humidity",
        "AQI",
        "Physical_Activity",
        "Diet_Type",
        "Previous_Medication",
        "Recommended_Medication",
    ],
    axis=1,
)
df["Gender"] = df["Gender"].map({"Male": 0, "Female": 1})
df["Headache"] = df["Headache"].map({"No": 0, "Yes": 1})
df["Body_Ache"] = df["Body_Ache"].map({"No": 0, "Yes": 1})
df["Fatigue"] = df["Fatigue"].map({"No": 0, "Yes": 1})
df["Chronic_Conditions"] = df["Chronic_Conditions"].map({"No": 0, "Yes": 1})
df["Allergies"] = df["Allergies"].map({"No": 0, "Yes": 1})
df["Smoking_History"] = df["Smoking_History"].map({"No": 0, "Yes": 1})
numeric_columns = df.select_dtypes(include=[np.number]).columns
df[numeric_columns] = df[numeric_columns].fillna(df[numeric_columns].median())

X = df[
    [
        "Age",
        "Temperature",
        "Gender",
        "BMI",
        "Headache",
        "Body_Ache",
        "Fatigue",
        "Chronic_Conditions",
        "Allergies",
        "Smoking_History",
    ]
].values
y = df["Fever_Severity"].values

scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

X_train, X_test, y_train, y_test = train_test_split(
    X_scaled, y, test_size=0.2, random_state=42
)
model = RandomForestClassifier(random_state=42)
model.fit(X_train, y_train)
y_pred = model.predict(X_test)
accuracy = accuracy_score(y_test, y_pred)

print(f"Model accuracy: {accuracy * 100:.2f}%")

# Store user data (thread-safe alternative)
user_data = {}


@app.route("/endpoint", methods=["POST"])
def handle_data():
    global user_data
    data = request.get_json()
    if not data:
        return jsonify({"error": "No data provided."}), 400

    user_data = {
        "age": data.get("age"),
        "temperature": data.get("temperature"),
        "gender": data.get("gender"),
        "bmi": data.get("bmi"),
        "headache": data.get("headache"),
        "body_ache": data.get("body_ache"),
        "fatigue": data.get("fatigue"),
        "chronic": data.get("chronic"),
        "allergies": data.get("allergies"),
        "smoking": data.get("smoking"),
    }
    print("Received data:", user_data)
    return jsonify({"message": "Data received successfully!"})


@app.route("/compute-data", methods=["GET"])
def compute_data():
    global user_data
    if not user_data:
        return jsonify({"error": "No data available"}), 400

    input_data = np.array(
        [
            [
                user_data["age"],
                user_data["temperature"],
                user_data["gender"],
                user_data["bmi"],
                user_data["headache"],
                user_data["body_ache"],
                user_data["fatigue"],
                user_data["chronic"],
                user_data["allergies"],
                user_data["smoking"],
            ]
        ]
    )

    input_data_scaled = scaler.transform(input_data)
    probabilities = model.predict_proba(input_data_scaled)

    fever_probability = probabilities[0][1]
    no_fever_probability = probabilities[0][0]

    return jsonify(
        {
            "fever_probability": round(fever_probability * 100, 2),
            "no_fever_probability": round(no_fever_probability * 100, 2),
        }
    )


if __name__ == "__main__":
    app.run(debug=True)
