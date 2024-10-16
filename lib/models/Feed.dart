class Feed {
  final String category;
  final String profileImgUri;
  final String userName;
  final int postId;
  final String content;
  final String date;
  final List<String> contentImgUris; // 이미지 리스트

  Feed({
    required this.category,
    required this.profileImgUri,
    required this.userName,
    required this.postId,
    required this.content,
    required this.date,
    this.contentImgUris = const [], // 필드 변경
  });
}
// 샘플 데이터 1
String lifeTitle = '이웃과 함께 만드는 봄 간식 지도 마음까지 따듯해지는 봄 간식을 만나보세요.';
// 샘플 데이터 2
List<Feed> feedList = [
  Feed(
    category: '우리동네질문',
    profileImgUri: 'https://picsum.photos/id/871/200/300?grayscale',
    userName: '헬로비비',
    postId: 1,
    content: '예민한 개도 미용할 수 있는 곳이나 동물 병원 어디 있을까요?\n'
        '내일 유기견을 데려오기로 했는데 아직 성향을 잘 몰라서 걱정이 돼요 ㅜㅜ.',
    contentImgUris: [
      'https://picsum.photos/id/872/200/300?grayscale',
      'https://picsum.photos/id/873/200/300?grayscale',
      'https://picsum.photos/id/874/200/300?grayscale',
    ],
    date: '3시간전',
  ),
  Feed(
    category: '우리동네소식',
    profileImgUri: 'https://picsum.photos/id/873/200/100?grayscale',
    userName: '당근토끼',
    postId: 2,
    content: '이명 치료 잘 아시는 분 있나요?',
    contentImgUris: [
      'https://picsum.photos/id/874/200/100?grayscale',
      'https://picsum.photos/id/875/200/100?grayscale',
    ],
    date: '1일전',
  ),
  Feed(
    category: '분실',
    profileImgUri: 'https://picsum.photos/id/875/200/100?grayscale',
    userName: 'flutter',
    postId: 3,
    content: '롯데캐슬 방향으로 재래시장 앞쪽 지나 혹시 에어팟 오른쪽 주우신 분 있나요ㅜㅜ',
    contentImgUris: [
      'https://picsum.photos/id/876/200/100?grayscale',
      'https://picsum.photos/id/877/200/100?grayscale',
    ],
    date: '1일전',
  ),
  // contentImgUris 필드가 없는 경우 (빈 리스트)
  Feed(
    category: '우리동네질문',
    profileImgUri: 'https://picsum.photos/id/880/200/100',
    userName: '구름나드리',
    postId: 4,
    content: '밤부터 새벽까지 하던 토스트 아저씨 언제 다시 오나요ㅜㅠ',
    contentImgUris: [], // 이미지 리스트가 비어있는 데이터
    date: '3일전',
  ),
  // contentImgUris 필드가 없는 경우 (빈 리스트)
  Feed(
    category: '우리동네질문',
    profileImgUri: 'https://picsum.photos/id/730/200/100?grayscale',
    userName: '아는형',
    postId: 5,
    content: '아니 이 시간에 마이크 들고 노래하는 사람은 정상인가요?',
    contentImgUris: [], // 이미지 리스트가 비어있는 데이터
    date: '5일전',
  ),
  // contentImgUris 필드가 없는 경우 (빈 리스트)
  Feed(
    category: '우리동네소식',
    profileImgUri: 'https://picsum.photos/id/123/200/300?grayscale',
    userName: '작은새',
    postId: 6,
    content: '새로 개업한 카페 가보신 분 있나요? 너무 예쁘다네요.',
    contentImgUris: [], // 이미지 리스트가 비어있는 데이터
    date: '2일전',
  ),
];