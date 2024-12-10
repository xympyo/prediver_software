import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:prediver/shared/theme.dart';
import 'package:prediver/shared/global.dart' as globals;

import 'package:http/http.dart' as http;

class InputPage extends StatefulWidget {
  InputPage({
    super.key,
  });

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late String _errorMessage = '';

  void handleSubmit(String input) {
    if (input.isEmpty) {
      _errorMessage = "Please fill in the field!";
    } else {
      print("User has entered $input");
    }
  }

// send data to flask python
  Future<void> sendDataToFlask() async {
    const String flaskUrl = "http://10.0.2.2:5000/endpoint";
    final Map<String, dynamic> data = {
      "age": globals.age,
      "temperature": globals.temp,
      "gender": globals.gender,
      "bmi": globals.bmi,
      "headache": globals.headache,
      "body_ache": globals.bodyache,
      "fatigue": globals.fatigueness,
      "chronic": globals.chronic,
      "allergies": globals.allergies,
      "smoking": globals.smoke,
    };

    try {
      final response = await http.post(
        Uri.parse(flaskUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        print("Data sent successfully");
      } else {
        print("Failed to sent data");
      }
    } catch (e) {
      print("Error sending data");
    }
  }

  Future<void> computeData() async {
    const String flaskUrl = "http://10.0.2.2:5000/compute-data";
    try {
      final response = await http.get(Uri.parse(flaskUrl));
      if (response.statusCode == 200) {
        // Parse the JSON response
        final Map<String, dynamic> data = json.decode(response.body);
        globals.fever_probability = '${data['fever_probability']}%';
        globals.no_fever_probability = '${data['no_fever_probability']}%';
        print(globals.fever_probability);
        print(globals.no_fever_probability);
      } else {
        print("Failed to fetch data: ${response.statusCode}");
      }
    } catch (e) {
      print("Error $e");
    }
  }

// temp
  final TextEditingController _tempController = TextEditingController();

  void checkTemp() {
    final tempText = _tempController.text.trim();
    final tempValue = int.tryParse(tempText);

    if (tempValue == null || tempValue == 0) {
      _errorMessage = "Temperature must be a valid number and cannot be zero!";
      print(_errorMessage);
    } else {
      globals.temp = tempValue;
    }
  }

// bmi
  final TextEditingController _bmiController = TextEditingController();

  void checkBmi() {
    final bmiText = _bmiController.text.trim();
    final bmiValue = double.tryParse(bmiText);

    if (bmiValue == null || bmiValue == 0) {
      _errorMessage = "BMI can't be null, or empty!";
      print(_errorMessage);
    } else {
      globals.bmi = bmiValue;
      print(globals.bmi);
    }
  }

// age
  final TextEditingController _ageController = TextEditingController();

  void checkAge() {
    final ageText = _ageController.text.trim();
    final ageValue = int.tryParse(ageText);

    if (ageValue == null || ageValue == 0) {
      _errorMessage = "Age must be a valid number and cannot be zero!";
      print(_errorMessage);
    } else {
      globals.age = ageValue;
    }
  }

// name controller
  final TextEditingController _nameController = TextEditingController();

  void checkName() {
    if (_nameController.text.isEmpty) {
      _errorMessage = "It can't be empty!";
      print(_errorMessage);
    } else if (!(_nameController.text == "Male" ||
        _nameController.text == "Female" ||
        _nameController.text == "male" ||
        _nameController.text == "female")) {
      _errorMessage = "You only can put Male or Female!";
      print(_errorMessage);
    } else {
      if (_nameController.text == "Male" || _nameController.text == "male") {
        globals.gender = 0;
        print(globals.gender);
      } else if (_nameController.text == "Female" ||
          _nameController.text == "female") {
        globals.gender = 1;
        print(globals.gender);
      }
    }
  }

// headache controller
  final TextEditingController _headacheController = TextEditingController();

  void checkHeadache() {
    if (_headacheController.text.isEmpty) {
      _errorMessage = "It can't be empty!";
    } else if (_headacheController.text != "Yes" &&
        _headacheController.text != "No" &&
        _headacheController.text != "yes" &&
        _headacheController.text != "no") {
      _errorMessage = "You only can put Yes or No!";
      print(_errorMessage);
    } else {
      if (_headacheController.text == "Yes" ||
          _headacheController.text == "yes") {
        globals.headache = 1;
        print(globals.headache);
      } else if (_headacheController.text == "No" ||
          _headacheController.text == "no") {
        globals.headache = 0;
        print(globals.headache);
      }
    }
  }

// body controller
  final TextEditingController _bodyController = TextEditingController();

  void checkBodyache() {
    if (_bodyController.text.isEmpty) {
      _errorMessage = "It can't be empty!";
    } else if (_bodyController.text != "Yes" &&
        _bodyController.text != "No" &&
        _bodyController.text != "yes" &&
        _bodyController.text != "no") {
      _errorMessage = "You only can put Yes or No!";
      print(_errorMessage);
    } else {
      if (_bodyController.text == "Yes" || _bodyController.text == "yes") {
        globals.bodyache = 1;
        print(globals.bodyache);
      } else if (_bodyController.text == "No" || _bodyController.text == "no") {
        globals.bodyache = 0;
        print(globals.bodyache);
      }
    }
  }

// fatigue controller
  final TextEditingController _fatigueController = TextEditingController();

  void checkFatigue() {
    if (_fatigueController.text.isEmpty) {
      _errorMessage = "It can't be empty!";
    } else if (_fatigueController.text != "Yes" &&
        _fatigueController.text != "No" &&
        _fatigueController.text != "yes" &&
        _fatigueController.text != "no") {
      _errorMessage = "You only can put Yes or No!";
      print(_errorMessage);
    } else {
      if (_fatigueController.text == "Yes" ||
          _fatigueController.text == "yes") {
        globals.fatigueness = 1;
        print(globals.fatigueness);
      } else if (_fatigueController.text == "No" ||
          _fatigueController.text == "no") {
        globals.fatigueness = 0;
        print(globals.fatigueness);
      }
    }
  }

// chronicConditions controller
  final TextEditingController _chronicController = TextEditingController();

  void checkChronic() {
    if (_chronicController.text.isEmpty) {
      _errorMessage = "It can't be empty!";
    } else if (_chronicController.text != "Yes" &&
        _chronicController.text != "No" &&
        _chronicController.text != "yes" &&
        _chronicController.text != "no") {
      _errorMessage = "You only can put Yes or No!";
      print(_errorMessage);
    } else {
      if (_chronicController.text == "Yes" ||
          _chronicController.text == "yes") {
        globals.chronic = 1;
        print(globals.chronic);
      } else if (_chronicController.text == "No" ||
          _chronicController.text == "no") {
        globals.chronic = 0;
        print(globals.chronic);
      }
    }
  }

// allergies controller
  final TextEditingController _allergiesController = TextEditingController();

  void checkAllergies() {
    if (_allergiesController.text.isEmpty) {
      _errorMessage = "It can't be empty!";
    } else if (_allergiesController.text != "Yes" &&
        _allergiesController.text != "No" &&
        _allergiesController.text != "yes" &&
        _allergiesController.text != "no") {
      _errorMessage = "You only can put Yes or No!";
      print(_errorMessage);
    } else {
      if (_allergiesController.text == "Yes" ||
          _allergiesController.text == "yes") {
        globals.allergies = 1;
        print(globals.allergies);
      } else if (_allergiesController.text == "No" ||
          _allergiesController.text == "no") {
        globals.allergies = 0;
        print(globals.allergies);
      }
    }
  }

// smoking controller
  final TextEditingController _smokingController = TextEditingController();

  void checkSmoking() {
    if (_smokingController.text.isEmpty) {
      _errorMessage = "It can't be empty!";
    } else if (_smokingController.text != "Yes" &&
        _smokingController.text != "No" &&
        _smokingController.text != "yes" &&
        _smokingController.text != "no") {
      _errorMessage = "You only can put Yes or No!";
      print(_errorMessage);
    } else {
      if (_smokingController.text == "Yes" ||
          _smokingController.text == "yes") {
        globals.smoke = 1;
        print(globals.smoke);
      } else if (_smokingController.text == "No" ||
          _smokingController.text == "no") {
        globals.smoke = 0;
        print(globals.smoke);
      }
    }
  }

// submit function
  Future<void> submitData() async {
    _errorMessage = '';
    checkAge();
    checkTemp();
    checkName();
    checkBmi();
    checkHeadache();
    checkBodyache();
    checkFatigue();
    checkChronic();
    checkSmoking();

    if (_errorMessage.isEmpty) {
      await sendDataToFlask();
      await computeData();
    } else {
      print("Validation failed: $_errorMessage");
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget goBackButton() {
      return Container(
        margin: EdgeInsets.only(
          top: 52,
          bottom: 12,
          left: defaultMargin,
        ),
        child: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 24,
                height: 20,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/icon_go_back.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                'Go Back',
                style: whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: regular,
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget header() {
      return Column(
        children: [
          Container(
            width: 124,
            height: 168,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/doc2.png',
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 88,
              right: 88,
              top: 20,
            ),
            child: Text(
              'Please kindly fill text field below, with honesty, of course..',
              style: whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: regular,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible,
            ),
          )
        ],
      );
    }

    Widget whiteBackground() {
      return Container(
        width: double.infinity,
        height: 620,
        margin: const EdgeInsets.only(
          top: 40,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              defaultRadius,
            ),
            topRight: Radius.circular(
              defaultRadius,
            ),
          ),
        ),
      );
    }

    Widget textFieldString(
      String title,
      String label,
      String desc,
      TextEditingController controller,
    ) {
      return Column(
        children: [
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: greenTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: regular,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: controller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: label,
                    labelStyle: greenTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: light,
                    ),
                    hintText: desc,
                    hintStyle: greenTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: light,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        defaultRadius,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget textField(
      String title,
      String label,
      String desc,
      bool isFloat,
      TextEditingController controller,
    ) {
      return Column(
        children: [
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: greenTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: regular,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: controller,
                  keyboardType: isFloat
                      ? const TextInputType.numberWithOptions(
                          decimal: true,
                        )
                      : TextInputType.number,
                  maxLength: isFloat ? 4 : 2,
                  decoration: InputDecoration(
                    labelText: label,
                    labelStyle: greenTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: light,
                    ),
                    hintText: desc,
                    hintStyle: greenTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: light,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        defaultRadius,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget textFieldContainer() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 32,
          bottom: 140,
        ),
        child: Column(
          children: [
            textField(
              "Please enter your age",
              "Age",
              "Your age here...",
              false,
              _ageController,
            ),
            const SizedBox(
              height: 16,
            ),
            textField(
              "Your latest temperature",
              "Temperature in Celcius",
              "Normal human temperature is 36°...",
              false,
              _tempController,
            ),
            const SizedBox(
              height: 16,
            ),
            textField(
              "Your BMI?",
              "(weight / height²)",
              "Its your weight, divided by your height²",
              true,
              _bmiController,
            ),
            const SizedBox(
              height: 16,
            ),
            textFieldString(
              "Your gender?",
              "Please answer in Male / Female",
              "Male / Female",
              _nameController,
            ),
            const SizedBox(
              height: 16,
            ),
            textFieldString(
              "Do you feel any headache?",
              "Slight discomfort on your head?",
              "Yes or No?",
              _headacheController,
            ),
            const SizedBox(
              height: 16,
            ),
            textFieldString(
              "Do you feel any body ache?",
              "Slight discomfort on your body?",
              "Yes or No?",
              _bodyController,
            ),
            const SizedBox(
              height: 16,
            ),
            textFieldString(
              "Do you feel any fatigueness?",
              "Any sign of tireness?",
              "Yes or No?",
              _fatigueController,
            ),
            const SizedBox(
              height: 16,
            ),
            textFieldString(
              "Do you have any chronic conditions?",
              "Diabety, Cancer, Pneumonia?",
              "Yes or No?",
              _chronicController,
            ),
            const SizedBox(
              height: 16,
            ),
            textFieldString(
              "Do you have any allergies?",
              "Allergy to animal does not count.",
              "Yes or No?",
              _allergiesController,
            ),
            const SizedBox(
              height: 16,
            ),
            textFieldString(
              "Do you have any smoking history?",
              "Were you an active smoker, that takes at least 3 cigarretes a week?",
              "Yes or No?",
              _smokingController,
            ),
          ],
        ),
      );
    }

    Widget button() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(
            top: 40,
            left: defaultMargin,
            right: defaultMargin,
            bottom: 40,
          ),
          width: double.infinity,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: kDarkGreenColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  defaultRadius,
                ),
              ),
            ),
            onPressed: () {
              submitData();
            },
            child: Text(
              'Submit Data',
              style: whiteTextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kDarkGreenColor,
      body: Column(
        children: [
          Row(
            children: [
              goBackButton(),
            ],
          ),
          header(),
          Expanded(
            child: Stack(
              children: [
                whiteBackground(),
                ListView(
                  children: [
                    textFieldContainer(),
                  ],
                ),
                button(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
