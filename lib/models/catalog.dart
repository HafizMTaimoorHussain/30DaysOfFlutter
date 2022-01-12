// ignore_for_file: camel_case_types

class item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});

  final products = [
    item(
      id: 1,
      name: "Iphone 12 pro max",
      desc: "Iphone 12 pro max description",
      price: 150000,
      color: "#33505a",
      image:
          "https://gravatar.com/avatar/2d84be965f636b9e553deb8cdb566e41?s=400&d=robohash&r=x",
    )
  ];
}
