import 'package:dro_health_app/models/drug_model.dart';
import 'package:dro_health_app/screens/home.dart';
import 'package:dro_health_app/utils/color.dart';
import 'package:dro_health_app/viewmodels/cartViewmodels.dart';
import 'package:dro_health_app/widgets/buttons.dart';
import 'package:dro_health_app/widgets/modal_buttom_sheet.dart';
import 'package:dro_health_app/widgets/product_details.dart';
import 'package:dro_health_app/widgets/sold_by.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  Drug drug;

  DetailScreen({this.drug});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<Cart>(
          builder: (context, vm, child) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 70, left: 25, right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                              );
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                              size: 25,
                            )),
                        Container(
                          height: 35,
                          decoration: BoxDecoration(
                              color: DroColor.DROPurple,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/shopping-bag.png",
                                  color: Colors.white,
                                  height: 15,
                                  width: 15,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "${vm.cartItems.length}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Image.asset("${widget.drug.image}"),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      widget.drug.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Tablet-${widget.drug.tablet}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SoldBy(),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 35,
                          width: 90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.black38)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "-",
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 30,
                                  ),
                                ),
                                Text(
                                  "1",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "+",
                                  style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          "₦${widget.drug.price.toString()}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "PRODUCT DETAILS",
                      style: TextStyle(
                          color: DroColor.Grey,
                          fontSize: 10,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ProductDetails(
                      title: widget.drug.name,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "1 pack of ${widget.drug.name} contains 3 units of Tablet(s)",
                          style: TextStyle(
                              color: DroColor.Grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Button(
                      onTap: () {
                        vm.add(widget.drug);
                        showDialog(context: context, builder: (BuildContext context) => CustomDialog(name: widget.drug.name));
                      },
                      title: "Add to bag",
                      image: "assets/images/add_bag.png",
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}


class CustomDialog extends StatelessWidget {
  final String name;


  CustomDialog({this.name});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 0.0,right: 0.0),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: 18.0,
            ),
            margin: EdgeInsets.only(top: 13.0,right: 8.0),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 0.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5,right: 5,top: 5),
                      child: new Text("Successful", style:TextStyle(fontSize: 12.0,color: Colors.black,fontWeight: FontWeight.w500)),
                    )//
                ),
                SizedBox(height: 10,),
                Center(
                    child: new Text("${name} has been add to your bag", style:TextStyle(fontSize: 12.0,color: Colors.black,fontWeight: FontWeight.w500))//
                ),
                SizedBox(height: 24.0),
               _button(
                 title: "View Bag",
                 ontap: (){
                   Navigator.of(context).pop();
                   modalBottomSheet(context);

                 }
               ),
                _button(
                  title: "Done",
                  ontap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage()),
                    );
                  },
                )
              ],
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Align(
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.check_circle, color:DroColor.DROTurquoise,size: 60),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _button extends StatelessWidget {
  final String title;
  final Function ontap;

  _button({this.title, this.ontap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: DroColor.DROTurquoise
          ),
          child: Center(
            child: Text(title,style: TextStyle(
              color: Colors.white
            ),),
          ),
        ),
      ),
    );
  }
}

