import 'package:dro_health_app/utils/color.dart';
import 'package:dro_health_app/viewmodels/cartViewmodels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutItem extends StatelessWidget {
  final String image;
  final String amount;
  final String name;
  final String sub;
  final Function delete;
  Cart _cart;

  CheckoutItem({this.image, this.amount,this.delete,this.name,this.sub});
  @override
  Widget build(BuildContext context) {
    _cart = Provider.of<Cart>(context, listen: false);
    bool visible = true;
    return Theme(
      data: ThemeData(dividerColor: Colors.transparent),
      child: ExpansionTile(
        trailing: visible ? Icon(
          Icons.keyboard_arrow_down,
          color:DroColor.DarkPurple,
          size: 20,
        ) : Icon(
          Icons.keyboard_arrow_up,
          color: DroColor.DarkPurple,
          size: 20,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20,top: 10,bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: delete,
                    child: Image.asset("assets/images/delete.png",color: Colors.grey,height: 25,width: 25,)),
                Row(
                  children: [
                    GestureDetector(
                        onTap: (){
                          _cart.decreaseValue();
                        },
                        child: Image.asset("assets/images/minus.png",color: Colors.white,height: 25,width: 25,)),
                    SizedBox(width: 5,),
                    Text("${_cart.counter}",style:TextStyle(
                        fontSize: 15,
                        color: Colors.white
                    )),
                    SizedBox(width: 5,),
                    GestureDetector(
                        onTap: (){
                          _cart.increaseValue();
                        },
                        child: Image.asset("assets/images/add.png",color: Colors.white,height: 25,width: 25,)),
                  ],
                )
              ],
            ),
          )
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              CircleAvatar(
                radius: 20.0,
                child: ClipRRect(
                  child: Image.asset(image),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
              SizedBox(width: 10,),
              Text("1x",style: TextStyle(
                  color: Colors.white,
                  fontSize: 10
              ),),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400
                  ),),
                  Text(sub,style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.w400
                  ),)
                ],
              )
            ],),
            Text(amount,style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500
            ),)
          ],
        ),
      ),
    );
  }
}