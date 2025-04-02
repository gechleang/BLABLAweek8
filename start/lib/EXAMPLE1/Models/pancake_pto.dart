

class Pancake {
  final String id;
  final String color;
  final double price;

  Pancake({required this.id, required this.color, required this.price});

  copyWith({required String color, required double price}) {}
}

class PancakeDto {
 static Pancake fromJson(String id, Map<String, dynamic> json) {
  return Pancake(id: id, color: json['color'], price: json['price']);
 

  }
 
  static Map<String, dynamic> toJson(Pancake pancake) {
 

    return {'name': pancake.color, 'price': pancake.price};
 

  }
 

}