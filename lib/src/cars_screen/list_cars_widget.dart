import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:upcars/src/cars_screen/single_car_view.dart';
import 'package:upcars/src/data_models/car_data_model.dart';
import 'package:upcars/src/services/firestore_service.dart';

class ListOfCarsWidget extends StatelessWidget {
  ListOfCarsWidget({Key? key}) : super(key: key);

  FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('cars').snapshots(),
          builder: (context, snapshot) {
            // debugPrint("==>  ${snapshot.data!.length}");
            if (!snapshot.hasData || snapshot.data == null) {
              return LinearProgressIndicator();
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            var docs = snapshot.data!.docs
                .map((e) =>
                    CarDataModel.fromMap(e.data() as Map<String, dynamic>))
                .toList();

            return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    child: TextButton(
                      child: Text(
                        docs[index].plateNumber.toString(),
                      ),
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  SingleCarView(car: docs[index]))),
                    ),
                  );
                });
          }),
    );
  }
}
