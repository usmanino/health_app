import 'package:dro_health_app/models/drug_model.dart';
import 'package:flutter/material.dart';

/// The [Drug] class holds a list of favorite items saved by the user.
class Cart extends ChangeNotifier {

  final List<Drug> cartItems = [];

  List<Drug> get items => cartItems;

  List<Drug> get drug => drugList;

  int counter = 1;


  void add(Drug drug){
    cartItems.add(drug);
    notifyListeners();
  }

  void remove(Drug drug) {
    cartItems.remove(drug);
    notifyListeners();
  }

  void increaseValue(){
    counter++;
    notifyListeners();
  }

  void decreaseValue(){
    counter--;
    notifyListeners();
  }
}