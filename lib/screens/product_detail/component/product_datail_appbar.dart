import 'package:flutter/material.dart';

class ProductDetailAppbar extends StatelessWidget {
  final name;

  const ProductDetailAppbar(this.name);

  @override
  Widget build(BuildContext context) {
    return _detailappbar(name: name);
  }
}

class _detailappbar extends StatelessWidget {
  const _detailappbar({
    super.key,
    required this.name,
  });

  final dynamic name;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black12))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: double.infinity,
          height: 45,
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 25,
                  )),
              const SizedBox(width: 8),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.home_outlined,
                    size: 25,
                  )),
              const Spacer(),
              Center(
                  child: Text(
                    "$name",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  )),
              const Spacer(),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.search_rounded,
                    size: 25,
                  )),
              const SizedBox(width: 8),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/cart");
                  },
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    size: 25,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
