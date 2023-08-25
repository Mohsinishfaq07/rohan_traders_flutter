class Category {
  final String name;
  final String image;
  final List<Map<String, dynamic>> items;

  Category({
    required this.name,
    required this.image,
    required this.items,
  });

  static List<Category> allCategories = [
    Category(
      name: "Bikes",
      image: "assets/images/bike.png",
      items: [
        {
          "name": "Suzuki",
          "price": "360000",
          "image": "assets/images/bike.png"
        },
        {"name": "Honda", "price": "215000", "image": "assets/images/bike.png"},
        {
          "name": "Yamaha",
          "price": "360000",
          "image": "assets/images/bike.png"
        },
        {"name": "Replica", "price": "600000", "image": "assets/images/bike.png"
        },
      ],
    ),
    Category(
      name: "Cars",
      image: "assets/images/car.png",
      items: [
        {"name": "Honda", "price": "500", "image": "assets/images/car.png"},
        {"name": "Suzuki", "price": "500", "image": "assets/images/car.png"},
        {"name": "Porsche", "price": "500", "image": "assets/images/car.png"},
        {"name": "corolla", "price": "500", "image": "assets/images/car.png"
        },
      ],
    ),
    Category(
      name: "Threads",
      image: "assets/images/thread1.png",
      items: [
        {"name": "Red", "price": "500", "image": 'assets/images/thread1.png'},
        {"name": "skin", "price": "500", "image": 'assets/images/thread1.png'},
        {"name": "purple", "price": "500", "image": 'assets/images/thread1.png'},
        {"name": "blue", "price": "500", "image": 'assets/images/thread1.png'},
      ],
    ),
    Category(
      name: "Property",
      image: "assets/images/property.png",
      items: [
        {"name": "Blue World city", "price": "500", "image": 'assets/images/perfume2.png'},
        {"name": "Soan Garden", "price": "500", "image": 'assets/images/perfume2.png'},
        {"name": "DHA", "price": "500", "image": 'assets/images/perfume2.png'},
        {"name": "Gulberg green", "price": "500", "image": 'assets/images/perfume2.png'},
      ],
    ),
    Category(
      name: "Websites",
      image: "assets/images/website.png",
      items: [
        {"name": "Ecommerce", "price": "500", "image": 'assets/images/perfume2.png'},
        {"name": "Business", "price": "1500", "image": 'assets/images/perfume2.png'},
        {"name": "Social media", "price": "3500", "image": 'assets/images/perfume2.png'},
        {"name": "Banking site ", "price": "6500", "image": 'assets/images/perfume2.png'},
      ],
    ),
    Category(
      name: "Apps",
      image: "assets/images/app.png",
      items: [
        {"name": "banking", "price": "500", "image": 'assets/images/thread1.png'},
        {"name": "Gaming", "price": "500", "image": 'assets/images/thread1.png'},
      ],)



  ];

}