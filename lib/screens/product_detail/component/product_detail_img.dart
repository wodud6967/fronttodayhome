import 'package:flutter/material.dart';

class ProductDetailImg extends StatelessWidget {
  final List<String> imageUrls = [
    'https://picsum.photos/600/400?image=1',
    'https://picsum.photos/600/400?image=2',
    'https://picsum.photos/600/400?image=3',
    'https://picsum.photos/600/400?image=4',
  ];

  @override
  Widget build(BuildContext context) {
    return _productImg(imageUrls: imageUrls);
  }
}

class _productImg extends StatelessWidget {
  const _productImg({
    super.key,
    required this.imageUrls,
  });

  final List<String> imageUrls;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          child: PageView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageUrls[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        Row(
          children: [
            const SizedBox(width: 10),
            Text(
              "가구 > 침대 > 침대프레임 > 일반침대",
              style: TextStyle(
                fontSize: 13,
              ),
            )
          ],
        ),
      ],
    );
  }
}
