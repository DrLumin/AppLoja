import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';
import '../models/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;

  const CartItemWidget(this.cartItem, {super.key});

  @override
  Widget build(BuildContext context) {
    //Widget de deletar o item passando pro lado

    return Dismissible(
      //direction diz a direção que pode funcionar o elelemnto
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      //exclusao do valor alocado no carro
      onDismissed: (_) {
        //Provider e Controller do Projeto
        Provider.of<Cart>(context, listen: false)
            .removeItem(cartItem.productId);
      },
      key: ValueKey(cartItem.id),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            title: Text(cartItem.name),
            subtitle:
                Text("Valor total R\$ ${cartItem.price * cartItem.quantity}"),
            trailing: Text("${cartItem.quantity}x"),
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: FittedBox(
                  child: Text("${cartItem.price}"),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
