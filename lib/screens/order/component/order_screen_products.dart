import 'package:flutter/material.dart';

class OrderScreenProducts extends StatefulWidget {

  @override
  State<OrderScreenProducts> createState() => _OrderScreenProductsState();
}

class _OrderScreenProductsState extends State<OrderScreenProducts> {
  bool isExpanded = false;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 10,color: Colors.black12),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 18,vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "주문 상품", // 요약 내용
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                  ),
                  SizedBox(width: 8),
                  Text("1건",style: TextStyle(color: Colors.black)),
                  Spacer(),
                  SizedBox(width: 5),
                  Container(child: InkWell(onTap:(){
                    setState(() {
                      isExpanded = !isExpanded; // 버튼 클릭 시 확장 상태 토글
                    });
                  },child: Icon(isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down))),
                ],
              ),
              if (isExpanded) ...[ // 확장된 경우 상세 내용을 보여줌
                SizedBox(height: 8), // 상세 내용과 요약 사이의 간격
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(color: Colors.black12),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Text("(주)하니코",style: TextStyle(color: Colors.black)),
                                      Spacer(),
                                      Text("배송비 착불",style: TextStyle(color: Colors.black)),
                                      SizedBox(width: 7),
                                      Icon(Icons.info_outlined,color: Colors.black38),
                                    ],
                                  ),
                                ),
                                Divider(color: Colors.black26,),
                                Text("업체직접배송"),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14.0,horizontal: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 80,
                                child: AspectRatio(aspectRatio: 3/4,
                                child: ClipRRect(borderRadius:BorderRadius.circular(7),child: Image.network("https://picsum.photos/id/200/200/300",fit: BoxFit.cover,))),
                              ),
                              SizedBox(width: 15),
                              Container(
                                width: 223,
                                height: 140,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("원단샘플 빈 아쿠아텍스 패브릭/부를레 호텔 침구프레임(SS/Q/K/LK/CK)",style: TextStyle(color: Colors.black)),
                                    SizedBox(height:10),

                                    Text("사이즈: 슈퍼싱글(매트제외)/색상: 소프트아이보리",style: TextStyle(color: Colors.black26)),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Text("249000원",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
                                        Container(
                                          height: 13,
                                          child: VerticalDivider(
                                            color: Colors.black26,
                                            thickness: 1,
                                          ),
                                        ),
                                        Text("1개"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              SizedBox(height: 8), // 버튼과 텍스트 사이의 간격

            ],
          ),
        ),
      ],
    );
  }
}
