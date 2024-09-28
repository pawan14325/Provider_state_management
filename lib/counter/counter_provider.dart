import 'dart:developer';

import 'package:flutter/material.dart';


class CounterProvider extends ChangeNotifier{
  int count =0;
  void incrementCount(){
    count++;
    log("Count changed to : $count");
    notifyListeners();

  }
  void decrementCount(){
    count--;
    log("Count changed to : $count");
    notifyListeners();

  }
}