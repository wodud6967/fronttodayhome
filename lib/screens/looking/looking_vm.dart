import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fronttodayhome/data/repository/feed_repository.dart';

class LookingScreenVm extends StateNotifier<LookingScreenModel?> {
  LookingScreenVm(super.state);

  List<_Looking>? feeds;

  Future<void> notifyInit() async {
    // 1. 통신을 해서 응답 받기
    List<dynamic> list = await FeedRepository().findAll();
    feeds = list.map((e) => _Looking.fromMap(e)).toList();

    // 2. 상태 갱신
    state = LookingScreenModel (list: feeds);
  }

  void updateIndex(int newIndex) { // 다시해야함
    state = LookingScreenModel( list: feeds);
  }
}



class LookingScreenModel {

  List<_Looking>? list;

  LookingScreenModel({this.list});
}


// Feed 창고 데이터
class _Looking {
  final String category;
  final String profileImgUri;
  final String userName;
  final int postId;
  final String content;
  final String date;
  final List<String> contentImgUris;

  _Looking({
    required this.category,
    required this.profileImgUri,
    required this.userName,
    required this.postId,
    required this.content,
    required this.date,
    this.contentImgUris = const [],
  });

  // JSON 데이터를 Feed 객체로 변환하는 메서드
  factory _Looking.fromMap(Map<String, dynamic> map) {
    return _Looking(
      category: map['category'],
      profileImgUri: map['profileImgUri'],
      userName: map['userName'],
      postId: map['postId'],
      content: map['content'],
      date: map['date'],
      contentImgUris: List<String>.from(map['contentImgUris'] ?? []),
    );
  }
}

final LookingScreenProvider =
StateNotifierProvider<LookingScreenVm, LookingScreenModel?>((ref) {
  return LookingScreenVm(null)..notifyInit();
});