import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusablecard.dart';
import 'package:bmi_calculator/screens/bottom_button.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Center(
                child: Text('Your Results', style: kTitleTextStyle),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kactivecardcolor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'NORMAL',
                    style: kResultTextStyle,
                  ),
                  Text(
                    '22.1',
                    style: kBMITextStyle,
                  ),
                  Text(
                    'You have a normal body weight. Good job!',
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
              onPress: () {},
            ),
          ),
          BottomButton(
            title: 'RE-CALCULATE',
            onTap: () {
              
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
