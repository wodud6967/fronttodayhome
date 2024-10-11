import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProductDetailReview extends StatelessWidget {
  const ProductDetailReview({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> reviewImages1 = [
      'https://picsum.photos/100/100',
      'https://picsum.photos/101/101',
      'https://picsum.photos/102/102',
      'https://picsum.photos/103/103',
    ];

    final List<String> reviewImages2 = [
      'https://picsum.photos/104/104',
      'https://picsum.photos/105/105',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ReviewTitle(),
          const SizedBox(height: 10),
          ReviewSection(
            rating: "4.7",
            reviewCount: "(2,236)",
            reviewText:
            "아직 열심히 하고있는 신혼집 꾸미기.. 👫👫\n처음 써보는 프레임때문에 엄청 고민하고 고민하고 고오오민하다가 주문한 프레임 일단 기사님이 너무 친절하게 설치해주시고 너무 예뻐서 맘에 들었던 프레임ㅠㅠ",
            reviewDate: "2024.09.17 · 오늘의집 구매",
            reviewImages: reviewImages1.sublist(0, 1),
          ),
          const Divider(thickness: 1, color: Colors.grey),
          ReviewSection(
            rating: "5.0",
            reviewCount: "(1,145)",
            reviewText:
            "신혼집 침대 프레임으로 선택했는데 매트리스에는 투자를 해서 프레임에서는 조금 아껴보자 하고 고른 제품이었어요.\n정말 괜찮은 가격에 요즘 유행하는 패브릭과 감성 조명까지 달려있어서 너무 마음에 들었던 침대입니다!",
            reviewDate: "2024.08.05 · 오늘의집 구매",
            reviewImages: reviewImages2.sublist(0, 1),
          ),
        ],
      ),
    );
  }
}

class ReviewTitle extends StatelessWidget {
  const ReviewTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "리뷰",
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}

class ReviewSection extends StatelessWidget {
  final String rating;
  final String reviewCount;
  final String reviewText;
  final String reviewDate;
  final List<String> reviewImages;

  const ReviewSection({
    super.key,
    required this.rating,
    required this.reviewCount,
    required this.reviewText,
    required this.reviewDate,
    required this.reviewImages,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RatingRow(rating: rating, reviewCount: reviewCount),
        const SizedBox(height: 10),
        ReviewImages(reviewImages: reviewImages),
        const SizedBox(height: 10),
        Text(
          reviewText,
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
        const SizedBox(height: 10),
        Text(
          reviewDate,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class RatingRow extends StatelessWidget {
  final String rating;
  final String reviewCount;

  const RatingRow({super.key, required this.rating, required this.reviewCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          rating,
          style: const TextStyle(fontSize: 20, color: Colors.black),
        ),
        const SizedBox(width: 5),
        Row(
          children: const [
            Icon(Icons.star, size: 20, color: Colors.lightBlue),
            Icon(Icons.star, size: 20, color: Colors.lightBlue),
            Icon(Icons.star, size: 20, color: Colors.lightBlue),
            Icon(Icons.star, size: 20, color: Colors.lightBlue),
            Icon(Icons.star_half, size: 20, color: Colors.lightBlue),
          ],
        ),
        const SizedBox(width: 10),
        Text(
          reviewCount,
          style: const TextStyle(color: Colors.grey),
        ),
        const Spacer(),
        const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      ],
    );
  }
}

class ReviewImages extends StatelessWidget {
  final List<String> reviewImages;

  const ReviewImages({super.key, required this.reviewImages});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: reviewImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                reviewImages[index],
                fit: BoxFit.cover,
                width: 150,
                height: 150,
              ),
            ),
          );
        },
      ),
    );
  }
}