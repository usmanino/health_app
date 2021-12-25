import 'package:dro_health_app/utils/color.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final String title;

  ProductDetails({this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Items(
                image: "assets/images/2_pills.jpg",
                title: "PACK SIZE",
                sub: "3x10"),
            SizedBox(width: 100,),
            Items(
                image: "assets/images/qr-code.png",
                title: "PRODUCT ID",
                sub: "PRPRPRPRPRRP"),
          ],
        ),
        SizedBox(height: 20,),
        Items(
            image: "assets/images/pill.png",
            title: "CONSTITUENT",
            sub: "${title}"),
        SizedBox(height: 20,),
        Items(
            image: "assets/images/water-dispenser.png",
            title: "DISPENSED IN",
            sub: "PACKS"),
      ],
    );
  }
}

class Items extends StatelessWidget {
  final String image;
  final String title;
  final String sub;

  Items({@required this.image, @required this.title,@required this.sub});

  @override
  Widget build(BuildContext context) {
    return Container(

        child: Row(
            children: [
              Image.asset(
                image,
                color: DroColor.DROPurple,
                height: 20,
                width: 20,
                fit: BoxFit.contain,
              ),
              SizedBox(width: 5,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: DroColor.Grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    sub,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ]));
  }
}