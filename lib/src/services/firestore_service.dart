import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:upcars/src/data_models/car_data_model.dart';

class FirestoreService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> addACar(CarDataModel car) async {
    await _firebaseFirestore.collection('cars').add(car.toMap());
  }

  // Stream of cars
  Stream<List<CarDataModel>> fetchCarsData() {
    return _firebaseFirestore.collection('cars').snapshots().map((event) {
      debugPrint('docs length =======>' + event.docs.length.toString());

      return event.docs
          .map(
            (doc) => CarDataModel.fromMap(
              doc.data(),
            ),
          )
          .toList();
    });
  }

  Future<List<CarDataModel>> fetchCarsUsingFuture() async {
    return await _firebaseFirestore.collection('cars').get().then(
          (snapshot) => snapshot.docs
              .map(
                (e) => CarDataModel.fromMap(
                  e.data(),
                ),
              )
              .toList(),
        );
  }

  Future<CarDataModel> getASpecificCar(carId) async {
    return await _firebaseFirestore.collection('cars').doc(carId).get().then(
        (doc) => CarDataModel.fromMap(doc.data() as Map<String, dynamic>));
  }

  Future<CarDataModel> getCarWithPlateNumber(String plateNumber) async {
    return await _firebaseFirestore
        .collection('cars')
        .where('plateNumber', isEqualTo: plateNumber)
        .get()
        .then((snapshot) => snapshot.docs
            .map(
              (e) => CarDataModel.fromMap(
                e.data(),
              ),
            )
            .toList()
            .first);
  }
}
