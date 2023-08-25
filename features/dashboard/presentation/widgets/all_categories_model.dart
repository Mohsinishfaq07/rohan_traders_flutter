
import 'dart:ffi';

final List<Map<String, dynamic>> allCategories = [
  {
    "Bikes": [
      {"name": "Suzuki", "price": "360000", "image": "assets/images/bike.png"},
      {"name": "Honda", "price": "215000", "image": "assets/images/bike.png"},
      {"name": "Yamaha", "price": "360000", "image": "assets/images/bike.png"},
      {"name": "Replica", "price": "600000", "image": "assets/images/bike.png"},
    ],
    "Image": "assets/images/bike.png",
  },
  {
    "Cars": [
      {"name": "Honda", "price": "500", "image": "assets/images/car.png"},
      {"name": "Suzuki", "price": "500", "image": "assets/images/car.png"},
      {"name": "Porshe", "price": "500", "image": "assets/images/car.png"},
      {"name": "corolla", "price": "500", "image": "assets/images/car.png"},
    ],
    "Image": "assets/images/car.png",
  },
  {
    "Threads": [
      {"name": "Red", "price": "500", "image": 'assets/images/thread1.png'},
      {"name": "skin", "price": "500", "image": 'assets/images/thread1.png'},
      {"name": "purple", "price": "500", "image": 'assets/images/thread1.png'},
      {"name": "blue", "price": "500", "image": 'assets/images/thread1.png'},
    ],
    "Image": "assets/images/thread1.png",
  },
  {
    "Property": [
      {
        "name": "Blue World city",
        "price": "500",
        "image": 'assets/images/perfume2.png'
      },
      {
        "name": "Soan Garden",
        "price": "500",
        "image": 'assets/images/perfume2.png'
      },
      {"name": "DHA", "price": "500", "image": 'assets/images/perfume2.png'},
      {
        "name": "Gulberg green",
        "price": "500",
        "image": 'assets/images/perfume2.png'
      },
    ],
    "Image": "assets/images/property.png",
  },
  {
    "Websites": [
      {
        "name": "Ecommerce",
        "price": "500",
        "image": 'assets/images/perfume2.png'
      },
      {
        "name": "Business",
        "price": "500",
        "image": 'assets/images/perfume2.png'
      },
      {
        "name": "Social meadia",
        "price": "500",
        "image": 'assets/images/perfume2.png'
      },
      {
        "name": "Banking site ",
        "price": "500",
        "image": 'assets/images/perfume2.png'
      },
    ],
    "Image": "assets/images/website.png",
  },
  {
    "Apps": [
      {"name": "banking", "price": "500", "image": 'assets/images/thread1.png'},
      {"name": "Gaming", "price": "500", "image": 'assets/images/thread1.png'},
      {"name": "shop", "price": "500", "image": 'assets/images/thread1.png'},
      {"name": "stock", "price": "500", "image": 'assets/images/thread1.png'},
    ],
    "Image": "assets/images/app.png",
  },
  {
    "Perfumes": [
      {
        "name": "Charlie RED",
        "price": "1000",
        "image": 'assets/images/thread1.png'
      },
      {
        "name": "Charlie Silver ",
        "price": "1000",
        "image": 'assets/images/thread1.png'
      },
      {
        "name": "Marjan",
        "price": "1000",
        "image": "assets/images/marjan.jpeg",
      },
      {"name": "Pearl", "price": "1000", "image": 'assets/images/thread1.png'},
      {
        "name": "Royal Black",
        "price": "1000",
        "image": 'assets/images/thread1.png'
      },
      {
        "name": "Azzaro Wanted ",
        "price": "1000",
        "image": 'assets/images/thread1.png'
      },
      {
        "name": "Blueted Lepidus",
        "price": "1000",
        "image": 'assets/images/thread1.png'
      },
      {"name": "Dunhil", "price": "1000", "image": 'assets/images/thread1.png'},
      {"name": "Open", "price": "1000", "image": 'assets/images/thread1.png'},
      {
        "name": "Cool water ",
        "price": "1000",
        "image": 'assets/images/thread1.png'
      },
      {
        "name": "Everyone",
        "price": "1000",
        "image": 'assets/images/thread1.png'
      },
      {
        "name": "BlueLady",
        "price": "1000",
        "image": 'assets/images/thread1.png'
      },
      {"name": "Havoc", "price": "1000", "image": 'assets/images/thread1.png'},
    ],
    "Image": "assets/images/marjan.jpeg",
  },
];

enum PerfumeSize { small, medium, large }

class Vehicle {
  final String price;
  final String model;
  final String name;
  final bool registered;
  final String image;
  Vehicle(this.price, this.model, this.name, this.registered, this.image);
}
class Bike extends Vehicle {
  Bike(String price, String model, String name, bool registered, String image)
      : super(price, model, name, registered, image);
}
class Car extends Vehicle {
  Car(String price, String model, String name, bool registered, String image)
      : super(price, model, name, registered, image);
}
List<Vehicle> vehicleList = [
  Bike(
    "10",
    "2012",
    "Honda",
    true,
    "assets/images/marjan.jpeg",
  ),
  Bike(
    "20",
    "2012",
    "Honda",
    true,
    "assets/images/marjan.jpeg",
  ),
  Bike(
    "30",
    "2012",
    "Honda",
    true,
    "assets/images/marjan.jpeg",
  ),
  Bike(
    "40",
    "2012",
    "Honda",
    true,
    "assets/images/marjan.jpeg",
  ),
  Bike(
    "50",
    "2012",
    "Honda",
    true,
    "assets/images/marjan.jpeg",
  ),
  Car(
    "200",
    "2012",
    "Honda",
    true,
    "assets/images/marjan.jpeg",
  ),
  Car(
    "210",
    "2012",
    "Honda",
    true,
    "assets/images/marjan.jpeg",
  ),
  Car(
    "220",
    "2012",
    "Honda",
    true,
    "assets/images/marjan.jpeg",
  ),
  Car(
    "230",
    "2012",
    "Honda",
    true,
    "assets/images/marjan.jpeg",
  ),
  Car(
    "240",
    "2012",
    "Honda",
    true,
    "assets/images/marjan.jpeg",
  ),
  Car(
    "250",
    "2012",
    "Honda",
    true,
    "assets/images/marjan.jpeg",
  ),
];

class Threads {
  String color;
  Int weight;
  Int length;
  Threads(this.color, this.length, this.weight);
}

class MotiThread extends Threads {


  MotiThread(String color, Int length, Int weight)
      : super(color, length, weight);
  // String color ;

}

class OnlineBusiness {
  String shopping;
  String banking;
  String shop;
  OnlineBusiness(this.banking, this.shopping, this.shop);
}

class MobileApps extends OnlineBusiness {
  MobileApps(String banking, String shopping, String shop)
      : super(banking, shopping, shop);
}

class WebApps extends OnlineBusiness {
  WebApps(String banking, String shopping, String shop) : super(banking, shopping, shop);
}

class Property {
  String city;
  String town;
  double area;
  Property(this.area, this.city, this.town);
}

class BlueWorldCity extends Property {
  BlueWorldCity(double area, String city, String town)
      : super(area, city, town);
}
