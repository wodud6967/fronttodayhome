import 'package:flutter/material.dart';
import '../../product_reivew/product_reivew_screen.dart';

class MyPageTabbar extends StatefulWidget {
  @override
  _MyPageTabbarState createState() => _MyPageTabbarState();
}

class _MyPageTabbarState extends State<MyPageTabbar>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Tabbar(tabController: _tabController),
        Expanded(
          child: _TabBarView(tabController: _tabController),
        ),
      ],
    );
  }
}

class _TabBarView extends StatelessWidget {
  const _TabBarView({
    super.key,
    required TabController? tabController,
  }) : _tabController = tabController;

  final TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    // 예시 상품마다 고유의 이미지 URL 리스트
    final List<List<String>> productImages = [
      [
        "https://image.hanssem.com/hsimg/gds/330/1021/1021051_A1.jpg?v=20241015085531",
        "https://image.hanssem.com/hsimg/gds/330/978/978544_A1.jpg?v=20241002160612",
        "https://image.hanssem.com/hsimg/gds/330/1025/1025752_A1.jpg?v=20241002145703",
      ],
      [
        "https://image.hanssem.com/hsimg/gds/1050/1046/1046294_A1.jpg?v=20240906134132",
        "https://image.hanssem.com/hsimg/gds/330/1021/1021051_A1.jpg?v=20241015085531",
        "https://image.hanssem.com/hsimg/gds/330/978/978544_A1.jpg?v=20241002160612",
      ],
      [
        "https://image.hanssem.com/hsimg/gds/330/1025/1025752_A1.jpg?v=20241002145703",
        "https://image.hanssem.com/hsimg/gds/1050/1046/1046294_A1.jpg?v=20240906134132",
        "https://image.hanssem.com/hsimg/gds/330/1021/1021051_A1.jpg?v=20241015085531",
      ],
    ];

    return TabBarView(
      controller: _tabController, // 탭바 컨트롤러
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: productImages.length, // 상품 갯수
            itemBuilder: (context, index) {
              return Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 16),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '배송완료',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          Text('10/18(일) 도착'),
                        ],
                      ),
                      Divider(),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 100, // 이미지가 들어갈 높이 설정
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal, // 수평 스크롤
                                itemCount: productImages[index].length, // 상품별 이미지 리스트
                                itemBuilder: (context, imgIndex) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 10.0), // 이미지 간의 간격 추가
                                    child: Image.network(
                                      productImages[index][imgIndex], // 상품별 이미지 참조
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '시몬스 침대',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '800,000원  •  1개',
                                  style: TextStyle(color: Colors.black87),
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              '상품 정보',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              minimumSize: Size(100, 40),
                              side: BorderSide(color: Colors.blue),
                              backgroundColor: Colors.lightBlue,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              print("교환, 반품 신청");
                            },
                            child: Text(
                              '교환, 반품 신청',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(150, 40),
                              backgroundColor: Colors.lightBlue,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductReviewScreen(),
                                ),
                              );
                            },
                            child: Text(
                              '리뷰쓰기',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              minimumSize: Size(100, 40),
                              backgroundColor: Colors.lightBlue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        // 두 번째 탭 내용 - "나의 리뷰"
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              ListTile(
                leading: Image.network(
                  "https://image.hanssem.com/hsimg/gds/1050/1046/1046294_A1.jpg?v=20240906134132",
                  width: 80, // 이미지 크기 확대
                  height: 80,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  '시몬스 침대',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // 텍스트 크기와 스타일 변경
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0), // 텍스트 간격 조정
                  child: Text(
                    '정말 좋습니다.',
                    style: TextStyle(fontSize: 16), // 텍스트 크기 확대
                  ),
                ),
              ),
              SizedBox(height: 20), // ListTile 간의 간격 추가
              ListTile(
                leading: Image.network(
                  "https://image.hanssem.com/hsimg/gds/330/1021/1021051_A1.jpg?v=20241015085531",
                  width: 80, // 이미지 크기 확대
                  height: 80,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  '한샘 책상',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // 텍스트 크기와 스타일 변경
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0), // 텍스트 간격 조정
                  child: Text(
                    '튼튼하고 좋아요.',
                    style: TextStyle(fontSize: 16), // 텍스트 크기 확대
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Tabbar extends StatelessWidget {
  const _Tabbar({
    super.key,
    required TabController? tabController,
  }) : _tabController = tabController;

  final TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      indicatorColor: Colors.blue,
      tabs: const [
        Tab(text: "주문 목록"), // 첫 번째 탭
        Tab(text: "나의 리뷰"), // 두 번째 탭
      ],
    );
  }
}