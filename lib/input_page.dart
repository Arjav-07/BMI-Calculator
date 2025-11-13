import 'package:bmi_calculator/icon_widget.dart';
import 'package:bmi_calculator/reusablecard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
  Color cardcolor = Color(0xFF1D1E33);

class _InputPageState extends State<InputPage> {
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

                  child: ReusableCard(color: cardcolor,cardChild: IconWidget(icon: FontAwesomeIcons.mars, label: "MALE"),),

                ),
                Expanded(
                  child: ReusableCard(color: cardcolor,cardChild: 
                  IconWidget(icon: FontAwesomeIcons.venus, label: "FEMALE"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: ReusableCard( color: cardcolor, cardChild: null,),),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(color: cardcolor, cardChild: null,)
              ),
              Expanded(
                child: ReusableCard(color: cardcolor, cardChild: null,),
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



