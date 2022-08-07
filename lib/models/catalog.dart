// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CatalogModel{
  
  Item getById(int id) =>
  items.firstWhere((element) => element.id==id,orElse: null);
  static List<Item> items = [
  Item(id: 1,
   name: "iPhonr 13 pro",
   desc: "Apple iPhone 15th gen",
   color: "Blue",
   image: "https://m.media-amazon.com/images/I/31Cf2vBY4cL._SX38_SY50_CR,0,0,38,50_.jpg",
   price: 999,)
];
}
class Item {
  final int id;
  final String name;
  final String desc;
  final String color;
  final String image;
  final num price;

  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.color,
    required this.image,
    required this.price,
  });
  
  

  Item copyWith({
    int? id,
    String? name,
    String? desc,
    String? color,
    String? image,
    num? price,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      color: color ?? this.color,
      image: image ?? this.image,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'desc': desc,
      'color': color,
      'image': image,
      'price': price,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as int,
      name: map['name'] as String,
      desc: map['desc'] as String,
      color: map['color'] as String,
      image: map['image'] as String,
      price: map['price'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, color: $color, image: $image, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Item &&
      other.id == id &&
      other.name == name &&
      other.desc == desc &&
      other.color == color &&
      other.image == image &&
      other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      desc.hashCode ^
      color.hashCode ^
      image.hashCode ^
      price.hashCode;
  }
}
