
import 'package:dro_health_app/utils/color.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget{
  final String title;
  final String image;
  final Function onTap;
  final Color color;
  final IconData icon;
  final Color textColor;
  final Color iconColor;

  Button({this.title, this.onTap, this.color, this.icon , this.textColor, this.iconColor,this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: color ?? DroColor.DROPurple,
          borderRadius: BorderRadius.circular(6)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image,color: iconColor ?? Colors.white,height: 35,width:20,),
            SizedBox(width: 10,),
            Text(title,style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 13
            ),)
          ],
        ),
      ),
    );
  }
}