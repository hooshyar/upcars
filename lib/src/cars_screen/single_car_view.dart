import 'package:flutter/material.dart';
import 'package:upcars/src/data_models/car_data_model.dart';

class SingleCarView extends StatefulWidget {
  const SingleCarView({Key? key, required this.car}) : super(key: key);

  final CarDataModel car;

  @override
  _SingleCarViewState createState() => _SingleCarViewState();
}

class _SingleCarViewState extends State<SingleCarView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.car.plateNumber.toString()),
            Text(widget.car.price.toString())
          ],
        ),
      ),
    );
  }
}
