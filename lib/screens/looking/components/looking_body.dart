import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fronttodayhome/components/image_container.dart';
import 'package:fronttodayhome/models/neighborhood_life.dart';
import 'package:fronttodayhome/theme.dart';

class LookingBody extends StatelessWidget {
  final NeighborhoodLife neighborhoodLife;

  const LookingBody({Key? key, required this.neighborhoodLife})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 10.0, color: Color(0xFFD4D5DD)),
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
              neighborhoodLife.category,
              style: TextTheme().bodyMedium,
            ),
          ),
          Text(
            neighborhoodLife.date,
            style: TextTheme().bodyMedium, //작동안함
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
            imageUrl: neighborhoodLife.profileImgUri,
          ),
          const SizedBox(width: 8.0),
          Text.rich(
            TextSpan(children: [
              TextSpan(
                text: '${neighborhoodLife.userName}',
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
          neighborhoodLife.content,
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
      visible: neighborhoodLife.contentImgUri != 's',//이부분 나중에 공백으로
      child: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Image.network(
          'https://picsum.photos/id/872/200/300?grayscale',
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // 기존의 _buildTail 위젯을 다시 통합
  Widget _buildTail() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        color: Colors.lime[100],
        height: 50,
      ),
    );
  }
}
