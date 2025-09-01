import 'dart:math';
import 'package:bmi/Result.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void _toggleLanguage() {
    if (context.locale.languageCode == 'en') {
      context.setLocale(const Locale('ar', 'EG'));
    } else {
      context.setLocale(const Locale('en', 'US'));
    }
    setState(() {});
  }

  double sliderValue = 110.0;
  int valueWeight = 4;
  int ageValue = 1;
  bool isMale = false;
  double resultBmi = 0;

  void selectGender(bool male) {
    isMale = male;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () {
              _toggleLanguage();
            },
            icon: Icon(Icons.language),
          ),
        ],
        centerTitle: true,
        backgroundColor: Color(0XFF1A1F38),
        title: Text(
          "title_appbar".tr(),
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 35,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0XFF0A0E21),
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AnimatedContainer(
                    duration: Duration(seconds: 2),
                    width: 136,
                    height: 159,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0XFF1A1F38),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                selectGender(false);
                              });
                            },
                            icon: Icon(
                              Icons.female,
                              color: isMale ? Colors.white : Colors.orange,
                              size: isMale ? 45 : 55,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "female".tr(),
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(seconds: 2),
                    width: 136,
                    height: 159,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0XFF1A1F38),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                selectGender(true);
                              });
                            },
                            icon: Icon(
                              Icons.male,
                              color: isMale ? Colors.orange : Colors.white,
                              size: isMale ? 55 : 45,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "male".tr(),
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: 343,
                  height: 189,
                  decoration: BoxDecoration(
                    color: Color(0XFF1A1F38),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "height".tr(),
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          Slider(
                            divisions: 120,
                            thumbColor: Colors.orange,

                            label: sliderValue.round().toString(),
                            value: sliderValue,
                            onChanged: (val) {
                              setState(() {
                                sliderValue = val;
                              });
                            },
                            min: 100,
                            max: 220,
                            activeColor: Color(0XFF6200EE),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 136,
                      height: 159,
                      decoration: BoxDecoration(
                        color: Color(0XFF1A1F38),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text(
                              "weight".tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "$valueWeight",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      valueWeight++;
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Icon(Icons.add, color: Colors.black),
                                  ),
                                ),
                                SizedBox(width: 25),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (valueWeight > 3) {
                                        valueWeight--;
                                      }
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      width: 136,
                      height: 159,
                      decoration: BoxDecoration(
                        color: Color(0XFF1A1F38),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text(
                              "age".tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "$ageValue",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      ageValue++;
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Icon(Icons.add, color: Colors.black),
                                  ),
                                ),
                                SizedBox(width: 25),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (ageValue > 1) {
                                        ageValue--;
                                      }
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        color: Color(0XFFF10606),
        child: MaterialButton(
          onPressed: () {
            double heightInMeter = sliderValue / 100;
            resultBmi = valueWeight / pow(heightInMeter, 2);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Result(finalResult: resultBmi),
              ),
            );
          },
          child: Center(
            child: Text(
              "calculate".tr(),
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
