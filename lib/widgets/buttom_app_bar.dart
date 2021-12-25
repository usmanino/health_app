import 'package:dro_health_app/utils/color.dart';
import 'package:flutter/material.dart';

class ButtomAppBar extends StatelessWidget {
  final String cartTotal;
  final Function onTap;

  ButtomAppBar({this.cartTotal, this.onTap});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          color: DroColor.DarkPurple,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft:  Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 3,),
            Container(
              padding: EdgeInsets.all(0),
              height: 5,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: Colors.white
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5,left: 25),
                  child: Row(
                    children: [
                      Image.asset("assets/images/shopping-bag.png",color: Colors.white,height: 20,width: 20 ,),
                      SizedBox(width: 5,),
                      Text("Bag",style: TextStyle(
                          color: Colors.white
                      ),)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25,top: 5,bottom: 5),
                  child: CircleAvatar(
                    radius: 17,
                    backgroundColor: Colors.white,
                    child: Text(cartTotal,style: TextStyle(
                        color: Colors.black,
                        fontSize: 12
                    ),),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
