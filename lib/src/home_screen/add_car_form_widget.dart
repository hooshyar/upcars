import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:upcars/src/data_models/car_data_model.dart';
import 'package:upcars/src/services/firestore_service.dart';

class AddCarFormWidget extends StatefulWidget {
  const AddCarFormWidget({Key? key}) : super(key: key);

  @override
  _AddCarFormWidgetState createState() => _AddCarFormWidgetState();
}

class _AddCarFormWidgetState extends State<AddCarFormWidget> {
  FirestoreService _firestoreService = FirestoreService();

  TextEditingController _plateNumberController = TextEditingController();
  TextEditingController _passengerCountController =
      TextEditingController(); //TODO: cast to int
  TextEditingController _manufactureYearController =
      TextEditingController(); //TODO: cast to integer

  bool? gearType = false;
  TextEditingController _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Form(
          child: ListView(
        children: [
          TextFormField(
              controller: _plateNumberController,
              decoration: const InputDecoration(label: Text('plate number'))),
          TextFormField(
              controller: _passengerCountController,
              decoration:
                  const InputDecoration(label: Text('passenger count'))),
          TextFormField(
              controller: _manufactureYearController,
              decoration:
                  const InputDecoration(label: Text('Manufacture year'))),
          TextFormField(
              controller: _priceController,
              decoration: const InputDecoration(label: Text('price'))),
          ElevatedButton(
              onPressed: () {
                _firestoreService.addACar(
                  CarDataModel(
                      plateNumber: _plateNumberController.value.text,
                      passengersCount:
                          int.parse(_passengerCountController.value.text),
                      manufactureYear:
                          int.parse(_manufactureYearController.value.text),
                      isSold: false,
                      price: double.parse(_priceController.value.text),
                      currency: 'USD'),
                );
              },
              child: Text('Submit'))
        ],
      )),
    );
  }
}
