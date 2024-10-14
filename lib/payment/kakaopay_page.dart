import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fronttodayhome/payment/kakaopay_vm.dart';

class KaKaoPayPage extends ConsumerWidget {
  const KaKaoPayPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? nextUrl = ref.watch(KaKaoPayProvider); // URL 가져오기

    if (nextUrl == null) {
      return Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () async {
            AndroidIntent intent = AndroidIntent(
              action: 'action_view',
              data: nextUrl,
            );
            await intent.launch();

            print("결재완료 됨");
            Navigator.pushNamedAndRemoveUntil(
                context, "/mypage", (route) => true);
          },
          child: Text("Buy"),
        ),
      ),
    );
  }
}
