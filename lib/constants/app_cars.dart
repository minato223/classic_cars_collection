import 'package:classic_cars_collection/models/car.dart';
import 'package:flutter_lorem/flutter_lorem.dart' as lorem;

class AppCars {
  int count = 5;
  List<Car> getCars() {
    List<Car> cars = [];
    for (var i = 1; i <= count; i++) {
      cars.add(Car(
        id: i,
        title: lorem.lorem(words: 2),
        description: "Car $i description",
        image_path: "assets/images/car-$i.png",
        score: i,
      ));
    }
    return cars;
  }
}