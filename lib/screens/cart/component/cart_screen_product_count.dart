import 'package:flutter/material.dart';
import 'package:fronttodayhome/screens/cart/cart_vm.dart';

class CartScreenProductCount extends StatefulWidget {
  final ShoppingCartItem product;

  CartScreenProductCount(this.product);

  @override
  State<CartScreenProductCount> createState() => _CartScreenProductCountState();
}

class _CartScreenProductCountState extends State<CartScreenProductCount> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black12))),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              width: 340,
              decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("수량  ", style: TextStyle(color: Colors.black)),
                                  Text(
                                    '${widget.product.count}',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Text(
                                "${widget.product.count * widget.product.price}", // Use price from the model
                                style: TextStyle(color: Colors.black),
                              ),
                              Text("원", style: TextStyle(color: Colors.black)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("옵션변경"),
                  Container(
                    height: 13,
                    child: VerticalDivider(
                      color: Colors.black26,
                      thickness: 1,
                    ),
                  ),
                  Text("바로구매"),
                  Spacer(),
                  Text(
                    "${widget.product.count * widget.product.price}", // Use price from the model
                    style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text("원", style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;

  _Button(this.name, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 20,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(7)),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          child: Center(child: Text("$name")),
        ),
      ),
    );
  }
}
