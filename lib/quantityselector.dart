import 'package:flutter/material.dart';

class QuantitySelector extends StatefulWidget {
  final int price;
  final Function(int, int)? onCartUpdate;

  const QuantitySelector({super.key, required this.price, this.onCartUpdate});

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              quantity += 1;
              widget.onCartUpdate!(1, widget.price);
              print('quantity: $quantity');
              print('ราคาต่อชิ้น: ${widget.price}');
              print('ราคารวม: ${widget.price * quantity}');

              // Use a logging framework in production if needed
            });
          },
          child: Text('+', style: TextStyle(fontSize: 20, color: Colors.grey)),
        ),

        Center(
          child: Text(
            'x$quantity',
            style: TextStyle(
              fontSize: 15,
              color: const Color.fromARGB(255, 133, 133, 133),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (quantity > 0) {
              setState(() {
                quantity -= 1;
                widget.onCartUpdate!(-1, -widget.price);
                print('quantity: $quantity');
                print('ราคาต่อชิ้น: ${widget.price}');
                print('ราคารวม: ${widget.price * quantity}');
              });
            }
          },
          child: Opacity(
            opacity: quantity > 0 ? 1.0 : 0.3,
            child: Text(
              '-',
              style: TextStyle(fontSize: 30, color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
