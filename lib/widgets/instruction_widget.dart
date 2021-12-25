
import 'package:flutter/material.dart';
class Instruction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
        child: Text("Tap on an item for add, remove , delete options",style: TextStyle(
            color: Colors.black,
            fontSize: 10,
            fontWeight: FontWeight.w400
        ),),
      ),
    );
  }
}

