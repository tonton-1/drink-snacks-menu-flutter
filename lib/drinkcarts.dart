import 'package:flutter/material.dart';

class DrinksCart extends StatefulWidget {
  final int totalQuantity;
  final int totalPrice;
  const DrinksCart({super.key, this.totalQuantity = 0, this.totalPrice = 0});

  @override
  State<DrinksCart> createState() => _DrinksCartState();
}

class _DrinksCartState extends State<DrinksCart> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color.fromARGB(255, 109, 185, 46),
        ),
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
        width: double.infinity,

        child: Container(
          child: Row(
            children: [
              SizedBox(width: 20),
              Text(
                'Total ',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 4),
                child: Text(
                  '฿ ',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Text(
                  '${widget.totalPrice}',
                  style: TextStyle(
                    fontSize: 28,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 19,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
