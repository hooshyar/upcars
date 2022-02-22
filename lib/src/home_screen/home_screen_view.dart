import 'package:flutter/material.dart';
import 'package:upcars/src/cars_screen/cars_screen_view.dart';
import 'package:upcars/src/home_screen/add_car_form_widget.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Expanded(child: AddCarFormWidget()),
          SafeArea(
            child: Container(
              height: 80,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CarListScreenView()));
                },
                child: Text('see all cars'),
              ),
            ),
          )
        ],
      )),
    );
  }
}
