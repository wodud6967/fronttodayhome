import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fronttodayhome/components/image_container.dart';
import 'package:fronttodayhome/models/Feed.dart';
import 'package:fronttodayhome/theme.dart';

class LookingBody extends StatelessWidget {
  final Feed feed;


  const LookingBody({Key? key, required this.feed}) // 생성자 이름을 LookingBody로 변경
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1, color: Color(0xFFD4D5DD)),
        ),
      ),
      child: Column(
        children: [
          _buildTop(),
          _buildWriter(),
          _buildWriting(),
          _buildImage(),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey[300],
          ),
          _buildTail(),
        ],
      ),
    );
  }

  // 기존의 _buildTop 위젯을 다시 통합
  Widget _buildTop() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: Color.fromRGBO(247, 247, 247, 1)),
            child: Text(
              feed.category,
              style: TextTheme().bodyMedium,
            ),
          ),
          Text(
            feed.date,
            style: textTheme().bodyMedium, //작동안함
            //스타일해야될듯
          ),
        ],
      ),
    );
  }

  // 기존의 _buildWriter 위젯을 다시 통합
  Widget _buildWriter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          ImageContainer(
            width: 30,
            height: 30,
            borderRadius: 15,
            imageUrl: feed.profileImgUri,
          ),
          const SizedBox(width: 8.0),
          Text.rich(
            TextSpan(children: [
              TextSpan(
                text: '${feed.userName}',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  // 기존의 _buildWriting 위젯을 다시 통합
  Widget _buildWriting() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          feed.content,
          style: textTheme().bodyLarge,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
        ),
      ),
    );
  }

  // 기존의 _buildImage 위젯을 다시 통합
  Widget _buildImage() {

    return Visibility(
      visible: feed.contentImgUris.isNotEmpty,
      child: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Image.network(
          feed.contentImgUris.isNotEmpty ? feed.contentImgUris[0] : '',
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // 기존의 _buildTail 위젯을 다시 통합
  Widget _buildTail() {
    if (feed.contentImgUris.isEmpty) {
      return SizedBox.shrink(); // 아무것도 렌더링하지 않음
    }
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              for (var imageUrl in feed.contentImgUris.take(3)) // 최대 3개의 이미지만 표시
                _buildImageItem(imageUrl),

            ],
          ),
          Row(
            children:[
              Text(
                '상품 더보기',
                style: textTheme().displayMedium,
              ),
              const SizedBox(width: 8.0),
              Icon(
                CupertinoIcons.right_chevron,
                size: 18.0,
                color: Colors.black87,
              ),
            ]
          ),
        ],
      ),
    );
  }
}

Widget _buildImageItem(String imageUrl) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(8.0), // 이미지에 border radius 적용
      child: Image.network(
        imageUrl,
        width: 50, // 이미지 너비
        height: 50, // 이미지 높이
        fit: BoxFit.cover, // 이미지 잘 맞게 표시
      ),
    ),
  );
}
