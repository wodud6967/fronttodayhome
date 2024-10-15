import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fronttodayhome/models/neighborhood_life.dart';

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
              shape: BoxShape.rectangle
            ),
          ),
          Text(
            neighborhoodLife.date,
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
      child: Container(
        color: Colors.red[100],
        height: 50,
      ),
    );
  }

  // 기존의 _buildWriting 위젯을 다시 통합
  Widget _buildWriting() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Container(
        color: Colors.blue,
        height: 50,
      ),
    );
  }

  // 기존의 _buildImage 위젯을 다시 통합
  Widget _buildImage() {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Container(
        color: Colors.black,
        height: 150,
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