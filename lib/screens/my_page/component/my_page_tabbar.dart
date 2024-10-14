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
    return TabBarView(
      controller: _tabController, // 탭바 컨트롤러
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: 10, // 상품 갯수
            itemBuilder: (context, index) {
              return Card(
                elevation: 4, // 그림자
                margin: EdgeInsets.symmetric(vertical: 16),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 배송 정보
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
                      // 상품 정보
                      Row(
                        children: [
                          // 상품 이미지
                          Image.network(
                            "https://picsum.photos/id/${index + 1}/100/100",
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 10),
                          // 상품명 및 가격 정보
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '제품명 $index',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '495,000원  •  1개',
                                  style: TextStyle(color: Colors.black87),
                                ),
                              ],
                            ),
                          ),
                          // 장바구니 담기 버튼
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
                      // 교환 및 배송조회 버튼
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
                              // 리뷰 작성 페이지로 이동
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductReviewScreen(), // 올바른 클래스 이름으로 수정
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
        Container(color: Colors.red), // 다른 탭의 내용
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
