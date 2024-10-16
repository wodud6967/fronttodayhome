import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fronttodayhome/data/repository/feed_repository.dart';
import 'package:logger/logger.dart';

class LookingScreenVm extends StateNotifier<LookingScreenModel?> {
  LookingScreenVm(super.state);



  Future<void> notifyInit() async {
    // 1. 통신을 해서 응답 받기
    List<dynamic> list = await FeedRepository().findAll();
    Logger().d("이건 응답받은 데이터 $list");
    List<Looking>? feeds = list.map((e) => Looking.fromMap(e)).toList();
    Logger().d(feeds);
    // 2. 상태 갱신
    state = LookingScreenModel (list: feeds);
  }

  void updateIndex(int newIndex) { // 다시해야함
    state = LookingScreenModel( list: state!.list);
  }
}



class LookingScreenModel {

  List<Looking>? list;

  LookingScreenModel({this.list});
}


// Feed 창고 데이터
class Looking {
  final String category;
  final String profileImgUri;
  final String userName;
  final int postId;
  final String content;
  final String date;
  final List<ContentImgUris> contentImgUris; // 대문자로 수정

  Looking({
    required this.category,
    required this.profileImgUri,
    required this.userName,
    required this.postId,
    required this.content,
    required this.date,
    this.contentImgUris = const [],
  });


  // JSON 데이터를 Feed 객체로 변환하는 메서드
  factory Looking.fromMap(Map<String, dynamic> map) {
    return Looking(
      category: map['category'],
      content: map['content'],
      postId: map['postId'],
      date: map['date'],
      userName: map['userName'],
      profileImgUri: map['profileImgUrl'],
      // userFeedPhotos를 ContentImgUris 객체로 변환
      contentImgUris: (map['userFeedPhotos'] as List).map((photo) {
        return ContentImgUris(
          id: photo['id'],
          type: photo['type'],
          url: photo['url'],
        );
      }).toList(),
    );
  }
}
class ContentImgUris{
  final int id;
  final String type;
  final String url;

  ContentImgUris({required this.id, required this.type, required this.url});
}



final LookingScreenProvider =
StateNotifierProvider<LookingScreenVm, LookingScreenModel?>((ref) {
  return LookingScreenVm(null)..notifyInit();
});