import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.color, required this.cardChild});

  final Color color;
  final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      alignment: Alignment.center,  
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color,
      ),
    );
  }
}