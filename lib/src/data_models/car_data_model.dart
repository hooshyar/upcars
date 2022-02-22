import 'dart:convert';

import 'package:flutter/foundation.dart';

class CarDataModel {
  String? carId;
  String? plateNumber;
  int? passengersCount; //uint
  int? manufactureYear; //2012 > Filteration
  bool? gearType;
  List<dynamic>? extraOptions;
  bool? isSold;
  double? price;
  String? currency;
  CarDataModel({
    this.carId,
    this.plateNumber,
    this.passengersCount,
    this.manufactureYear,
    this.gearType,
    this.extraOptions,
    this.isSold,
    this.price,
    this.currency,
  });

  CarDataModel copyWith({
    String? carId,
    String? plateNumber,
    int? passengersCount,
    int? manufactureYear,
    bool? gearType,
    List<String>? extraOptions,
    bool? isSold,
    double? price,
    String? currency,
  }) {
    return CarDataModel(
      carId: carId ?? this.carId,
      plateNumber: plateNumber ?? this.plateNumber,
      passengersCount: passengersCount ?? this.passengersCount,
      manufactureYear: manufactureYear ?? this.manufactureYear,
      gearType: gearType ?? this.gearType,
      extraOptions: extraOptions ?? this.extraOptions,
      isSold: isSold ?? this.isSold,
      price: price ?? this.price,
      currency: currency ?? this.currency,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'carId': carId,
      'plateNumber': plateNumber,
      'passengersCount': passengersCount,
      'manufactureYear': manufactureYear,
      'gearType': gearType,
      'extraOptions': extraOptions,
      'isSold': isSold,
      'price': price,
      'currency': currency,
    };
  }

  factory CarDataModel.fromMap(Map<String, dynamic> map) {
    return CarDataModel(
      carId: map['carId'],
      plateNumber: map['plateNumber'],
      passengersCount: map['passengersCount']?.toInt(),
      manufactureYear: map['manufactureYear']?.toInt(),
      gearType: map['gearType'],
      extraOptions: map['extraOptions'],
      isSold: map['isSold'],
      price: map['price']?.toDouble(),
      currency: map['currency'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CarDataModel.fromJson(String source) =>
      CarDataModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CarDataModel(carId: $carId, plateNumber: $plateNumber, passengersCount: $passengersCount, manufactureYear: $manufactureYear, gearType: $gearType, extraOptions: $extraOptions, isSold: $isSold, price: $price, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CarDataModel &&
        other.carId == carId &&
        other.plateNumber == plateNumber &&
        other.passengersCount == passengersCount &&
        other.manufactureYear == manufactureYear &&
        other.gearType == gearType &&
        listEquals(other.extraOptions, extraOptions) &&
        other.isSold == isSold &&
        other.price == price &&
        other.currency == currency;
  }

  @override
  int get hashCode {
    return carId.hashCode ^
        plateNumber.hashCode ^
        passengersCount.hashCode ^
        manufactureYear.hashCode ^
        gearType.hashCode ^
        extraOptions.hashCode ^
        isSold.hashCode ^
        price.hashCode ^
        currency.hashCode;
  }
}
