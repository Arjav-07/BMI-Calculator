import 'package:bmi_calculator/icon_widget.dart';
import 'package:bmi_calculator/reusablecard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
  Color activecardcolor = Color(0xFF1D1E33);
  Color inactivecardcolor = Color(0xFF111328);

enum Gender {
  male,female,
}
class _InputPageState extends State<InputPage> {

  Color maleCardColor = inactivecardcolor;
  Color femaleCardColor = inactivecardcolor;

  void updateColor(Gender selectedGender) {
    if (selectedGender == Gender.male) {
      if (maleCardColor == inactivecardcolor) {
        maleCardColor = activecardcolor;
        femaleCardColor = inactivecardcolor;
      } else {
        maleCardColor = inactivecardcolor;
      }
    }
    if (selectedGender == Gender.female) {
      if (femaleCardColor == inactivecardcolor) {
        femaleCardColor = activecardcolor;
        maleCardColor = inactivecardcolor;
      } else {
        femaleCardColor = inactivecardcolor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyMedium?.color,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(

                  child: GestureDetector(onTap: () {
                    setState(() {
                      updateColor(Gender.male);
                    });
                  },
                    child: ReusableCard(color: maleCardColor,cardChild: IconWidget(icon: FontAwesomeIcons.mars, label: "MALE"),)),

                ),
                Expanded(
                  child: GestureDetector(onTap: () {
                    setState(() {
                      updateColor(Gender.female);
                    });
                  },
                    child: ReusableCard(color: femaleCardColor,cardChild: 
                    IconWidget(icon: FontAwesomeIcons.venus, label: "FEMALE"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: ReusableCard( color: activecardcolor, cardChild: SizedBox(),),),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(color: activecardcolor, cardChild: SizedBox(),)
              ),
              Expanded(
                child: ReusableCard(color: activecardcolor, cardChild: SizedBox(),),
              ),
            ],
          ),),
          Container(
            color: Color(0xFFEB1555),
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: 80.0,
          )
        ],
      ),
    );
  }
}



