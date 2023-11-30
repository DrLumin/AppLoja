import 'cart_item.dart';

class Order {
  late final String id;
  late final double total;
  late final List<CartItem> product;
  late final DateTime date;

  Order(
      {required this.id,
      required this.total,
      required this.product,
      required this.date});
}


//Pedidos