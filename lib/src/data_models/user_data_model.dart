import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:upcars/src/data_models/car_data_model.dart';

class GeneralUser {
  String? name;
  String? uid;
  String? family;
  String? fatherName;
  String? email;
  String? phoneNumber;
  List<CarDataModel>? favoritesCars;
  List<CarDataModel>? readyToSellCars;
  List<CarDataModel>? soldCars;
  GeneralUser({
    this.name,
    this.uid,
    this.family,
    this.fatherName,
    this.email,
    this.phoneNumber,
    this.favoritesCars,
    this.readyToSellCars,
    this.soldCars,
  });
  // List<Order>? orders;

  GeneralUser copyWith({
    String? name,
    String? uid,
    String? family,
    String? fatherName,
    String? email,
    String? phoneNumber,
    List<CarDataModel>? favoritesCars,
    List<CarDataModel>? readyToSellCars,
    List<CarDataModel>? soldCars,
  }) {
    return GeneralUser(
      name: name ?? this.name,
      uid: uid ?? this.uid,
      family: family ?? this.family,
      fatherName: fatherName ?? this.fatherName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      favoritesCars: favoritesCars ?? this.favoritesCars,
      readyToSellCars: readyToSellCars ?? this.readyToSellCars,
      soldCars: soldCars ?? this.soldCars,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uid': uid,
      'family': family,
      'fatherName': fatherName,
      'email': email,
      'phoneNumber': phoneNumber,
      'favoritesCars': favoritesCars?.map((x) => x?.toMap())?.toList(),
      'readyToSellCars': readyToSellCars?.map((x) => x?.toMap())?.toList(),
      'soldCars': soldCars?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory GeneralUser.fromMap(Map<String, dynamic> map) {
    return GeneralUser(
      name: map['name'],
      uid: map['uid'],
      family: map['family'],
      fatherName: map['fatherName'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      favoritesCars: map['favoritesCars'] != null
          ? List<CarDataModel>.from(
              map['favoritesCars']?.map((x) => CarDataModel.fromMap(x)))
          : null,
      readyToSellCars: map['readyToSellCars'] != null
          ? List<CarDataModel>.from(
              map['readyToSellCars']?.map((x) => CarDataModel.fromMap(x)))
          : null,
      soldCars: map['soldCars'] != null
          ? List<CarDataModel>.from(
              map['soldCars']?.map((x) => CarDataModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GeneralUser.fromJson(String source) =>
      GeneralUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GeneralUser(name: $name, uid: $uid, family: $family, fatherName: $fatherName, email: $email, phoneNumber: $phoneNumber, favoritesCars: $favoritesCars, readyToSellCars: $readyToSellCars, soldCars: $soldCars)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GeneralUser &&
        other.name == name &&
        other.uid == uid &&
        other.family == family &&
        other.fatherName == fatherName &&
        other.email == email &&
        other.phoneNumber == phoneNumber &&
        listEquals(other.favoritesCars, favoritesCars) &&
        listEquals(other.readyToSellCars, readyToSellCars) &&
        listEquals(other.soldCars, soldCars);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        uid.hashCode ^
        family.hashCode ^
        fatherName.hashCode ^
        email.hashCode ^
        phoneNumber.hashCode ^
        favoritesCars.hashCode ^
        readyToSellCars.hashCode ^
        soldCars.hashCode;
  }
}
