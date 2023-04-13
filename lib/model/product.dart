class Product {
  final String productID;
  final String uid;
  final String name;
  final String brand;
  final String category;
  final int quantity;
  final String productUrl;
  final String price;

  Product({
    required this.productID,
    required this.uid,
    required this.name,
    required this.brand,
    required this.category,
    required this.quantity,
    required this.productUrl,
    required this.price,
  });

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "productID": productID,
        "name": name,
        "brand": brand,
        "category": category,
        "quantity": quantity,
        "productUrl": productUrl,
        "price": price,
      };
}
