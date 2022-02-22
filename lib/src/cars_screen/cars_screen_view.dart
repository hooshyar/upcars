import 'package:flutter/material.dart';
import 'package:upcars/src/cars_screen/list_cars_widget.dart';

class CarListScreenView extends StatelessWidget {
  const CarListScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: ListOfCarsWidget());
  }
}
