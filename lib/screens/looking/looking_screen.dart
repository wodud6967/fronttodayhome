import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fronttodayhome/components/image_container.dart';
import 'package:fronttodayhome/models/Feed.dart';
import 'package:fronttodayhome/screens/looking/components/looking_body.dart';
import 'package:fronttodayhome/screens/looking/looking_vm.dart';

class LookingScreen extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(LookingScreenProvider);
    if (model == null || model.list == null) {
      return Center(child: CircularProgressIndicator()); // 로딩 중일 때 표시
    }
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
          title: Text("둘러보기"),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.search)),
            IconButton(
                onPressed: () {},
                icon: Icon(CupertinoIcons.plus_rectangle_on_rectangle)),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.0),
            child: Container(
              color: Colors.grey,
              height: 1.0,
            ),
          )),
      body: ListView(
        children: [
          look_header(),
           ...List.generate(
             model.list!.length,
           (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: LookingBody(feed: model.list![index]),
           ),
           ),
        ],

      ),
    );
  }
}




class look_header extends StatelessWidget {
  const look_header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12.0),
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            ImageContainer(
              borderRadius: 6.0,
                imageUrl: 'https://picsum.photos/id/780/200/100',
              width: 45.0,
              height: 45.0,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Text(
                lifeTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
