import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/icon_widget.dart';
import 'package:bmi_calculator/components/reusablecard.dart';
import 'package:bmi_calculator/components/rounded_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0, // Optional: removes shadow
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.bodyMedium?.color,
          ),
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // ------------------ GENDER ------------------
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? kactivecardcolor
                        : kinactivecardcolor,
                    cardChild: IconWidget(
                      icon: FontAwesomeIcons.mars,
                      label: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? kactivecardcolor
                        : kinactivecardcolor,
                    cardChild: IconWidget(
                      icon: FontAwesomeIcons.venus,
                      label: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ------------------ HEIGHT ------------------
          Expanded(
            child: ReusableCard(
              color: kactivecardcolor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT', style: klabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(), style: knumberTextStyle),
                      Text('cm', style: klabelTextStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      max: 220,
                      min: 120,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
              onPress: () {},
            ),
          ),

          // ------------------ WEIGHT & AGE ------------------
          Expanded(
            child: Row(
              children: <Widget>[
                // ------- WEIGHT -------
                Expanded(
                  child: ReusableCard(
                    color: kactivecardcolor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT', style: klabelTextStyle),
                        Text(weight.toString(), style: knumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),

                            SizedBox(width: 10.0),

                            RoundedIconButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    onPress: () {},
                  ),
                ),

                // ------- AGE -------
                Expanded(
                  child: ReusableCard(
                    color: kactivecardcolor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE', style: klabelTextStyle),
                        Text(age.toString(), style: knumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),

                            SizedBox(width: 10.0),

                            RoundedIconButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    onPress: () {},
                  ),
                ),
              ],
            ),
          ),

          // ------------------ CALCULATE BUTTON ------------------
          BottomButton(onTap: (){
            Navigator.pushNamed(context, '/results');
          }, buttonTitle: 'CALCULATE',),
        ],
      ),
    );
  }
}
