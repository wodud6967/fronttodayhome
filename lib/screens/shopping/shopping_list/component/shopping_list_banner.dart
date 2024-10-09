import 'package:flutter/material.dart';

class ShoppingListBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Locate(),
        mImage(),
        BannerButtons(),
        Container(height: 15, color: Colors.black12),
      ],
    );
  }
}

class BannerButtons extends StatelessWidget {
  const BannerButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BannerButton("침대프레임"),
            Container(
                height: 40, child: VerticalDivider(color: Colors.black12)),
            BannerButton("침대+매트리스"),
            Container(
                height: 40, child: VerticalDivider(color: Colors.black12)),
            BannerButton("침대부속가구"),
          ],
        ),
      ),
    );
  }
}

class BannerButton extends StatelessWidget {
  final name;

  const BannerButton(this.name);

  @override
  Widget build(BuildContext context) {
    return Text(
      "$name",
      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
    );
  }
}

class mImage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: AspectRatio(
          aspectRatio: 7 / 2,
          child: Image.network(
            "https://picsum.photos/id/200/1000/200",
            fit: BoxFit.cover,
          )),
    );
  }
}

class Locate extends StatelessWidget {
  const Locate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("가구", style: TextStyle(fontSize: 12)),
          const SizedBox(width: 5),
          Icon(Icons.arrow_forward_ios_sharp, size: 11, color: Colors.black38),
          const SizedBox(width: 5),
          Text("침대", style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
