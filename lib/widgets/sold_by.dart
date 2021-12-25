import 'package:dro_health_app/utils/color.dart';
import 'package:flutter/material.dart';

class SoldBy extends StatelessWidget {
  const SoldBy({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: DroColor.Grey,
        ),
        SizedBox(width: 5,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("SOLD BY",style: TextStyle(
              color: DroColor.Grey,
              fontSize: 10,
            ),),
            Text("Emzor Pharmaceuticals",style: TextStyle(
              color: DroColor.Grey,
              fontSize: 10,
            ),),
          ],
        )
      ],
    );
  }
}