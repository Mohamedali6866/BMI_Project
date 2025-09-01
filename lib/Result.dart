import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
class Result extends StatefulWidget {
  double finalResult;
  String? hintText;

  Result({super.key, required this.finalResult});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  String getAdvice(double bmi) {
    if (bmi < 18.5) {
      return "You are underweight. Try to eat more balanced meals.";
    } else if (bmi >= 18.5 && bmi < 25) {
      return "Great! Your weight is normal. Keep it up!";
    } else if (bmi >= 25 && bmi < 30) {
      return "You are overweight. Consider exercising more and eating healthy.";
    } else {
      return "Obese level. Please consult a doctor and follow a healthy lifestyle.";
    }
  }

  Color getBmiColor(double bmi) {
    if (bmi < 18.5) {
      return Colors.blue;
    } else if (bmi >= 18.5 && bmi < 25) {
      return Colors.green;
    } else if (bmi >= 25 && bmi < 30) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  String getBmiCategory(double bmi) {
    if (bmi < 18.5) {
      return "Underweight".tr();
    } else if (bmi >= 18.5 && bmi < 25) {
      return "Normal".tr();
    } else if (bmi >= 25 && bmi < 30) {
      return "Overweight".tr();
    } else {
      return "Obese".tr();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        color: Color(0XFF0A0E21),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Expanded(
          flex: 1,
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "result".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 36,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              width: 383,
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color(0XFF1A1F38),
              ),
              child: Column(
                  children: [
              Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                getBmiCategory(widget.finalResult).tr(),
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                  color: getBmiColor(widget.finalResult),
                ),
              ),
            ),
            Text(
              widget.finalResult.toStringAsFixed(2),
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 80,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                  textAlign: TextAlign.center,
                  getAdvice(widget.finalResult).tr(),
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          ],
        ),
      ),
    ),
    ),
    Expanded(flex: 1, child: Container()),
    ],
    ),
    ),
    );
  }
}
