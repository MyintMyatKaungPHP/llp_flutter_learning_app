class Phone {
  final String brand;
  final String model;
  final double price;
  final int quantity;

  Phone({
    required this.brand,
    required this.model,
    required this.price,
    required this.quantity,
  });

  @override
  String toString() {
    return 'Phone(brand: $brand, model: $model, price: $price, quantity: $quantity)';
  }
}

List<Phone> phoneData(){
  return [
    Phone(
      brand: 'Apple',
      model: 'iPhone 14',
      price: 999.99,
      quantity: 10,
    ),
    Phone(
      brand: 'Samsung',
      model: 'Galaxy S23',
      price: 899.99,
      quantity: 15,
    ),
    Phone(
      brand: 'Google',
      model: 'Pixel 7',
      price: 599.99,
      quantity: 8,
    ),
    Phone(
      brand: 'OnePlus',
      model: 'OnePlus 11',
      price: 749.99,
      quantity: 12,
    ),
    Phone(
      brand: 'Xiaomi',
      model: 'Mi 12',
      price: 649.99,
      quantity: 20,
    ),
    Phone(
      brand: 'Sony',
      model: 'Xperia 5 IV',
      price: 1099.99,
      quantity: 5,
    ),
    Phone(
      brand: 'Oppo',
      model: 'Find X5 Pro',
      price: 1199.99,
      quantity: 7,
    ),
    Phone(
      brand: 'Huawei',
      model: 'P50 Pro',
      price: 1099.99,
      quantity: 6,
    ),
    Phone(
      brand: 'Nokia',
      model: 'G21',
      price: 299.99,
      quantity: 25,
    ),
    Phone(
      brand: 'Motorola',
      model: 'Moto G Stylus 2022',
      price: 349.99,
      quantity: 18,
    ),
    Phone(
      brand: 'Asus',
      model: 'ROG Phone 6',
      price: 999.99,
      quantity: 9,
    ),
    Phone(
      brand: 'Realme',
      model: 'GT 2 Pro',
      price: 699.99,
      quantity: 13,
    ),
    Phone(
      brand: 'Vivo',
      model: 'X80 Pro',
      price: 849.99,
      quantity: 11,
    ),
    Phone(
      brand: 'ZTE',
      model: 'Axon 40 Ultra',
      price: 799.99,
      quantity: 14,
    ),
    Phone(
      brand: 'TCL',
      model: '10 Pro',
      price: 499.99,
      quantity: 22,
    ),
    Phone(
      brand: 'Alcatel',
      model: '1S 2021',
      price: 229.99,
      quantity: 30,
    ),
    Phone(
      brand: 'LG',
      model: 'V60 ThinQ',
      price: 899.99,
      quantity: 8,
    ),
    Phone(
      brand: 'Infinix',
      model: 'Zero 5G',
      price: 399.99,
      quantity: 17,
    ),
    Phone(
      brand: 'Honor',
      model: 'V40 Lite',
      price: 549.99,
      quantity: 10,
    ),
    Phone(
      brand: 'Microsoft',
      model: 'Surface Duo 2',
      price: 1499.99,
      quantity: 4,
    ),
  ];
}