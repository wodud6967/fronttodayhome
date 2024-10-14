/*
import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';

class KaKaoPayPage1 extends StatefulWidget {
  @override
  _KaKaoPayPageState createState() => _KaKaoPayPageState();
}

class _KaKaoPayPageState extends State<KaKaoPayPage> {
  final _URL = 'http://192.168.0.99:8080';
  final _DEV_SECRET_KEY = 'DEV3863C5B753FF2D1963BBD89ABF2E70A555A73';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () async {
            var res = await dio.post(
              'https://open-api.kakaopay.com/online/v1/payment/ready',
              options: Options(
                headers: {'Authorization': 'DEV_SECRET_KEY $_DEV_SECRET_KEY'},
              ),
              data: {
                'cid': 'TC0ONETIME',
                'partner_order_id': 'partner_order_id',
                'partner_user_id': 'partner_user_id',
                'item_name': '초코빠이',
                'quantity': '1',
                'total_amount': '100',
                'vat_amount': '10',
                'tax_free_amount': '0',
                'approval_url': '$_URL/success',
                'fail_url': '$_URL/fail',
                'cancel_url': '$_URL/cancel'
              },
            );
            Map<String, dynamic> result = res.data;
            AndroidIntent intent = AndroidIntent(
              action: 'action_view',
              data: result['next_redirect_mobile_url'],
              arguments: {'txn_id': result['tid']},
            );
            await intent.launch();
          },
          child: Text("Buy"),
        ),
      ),
    );
  }
}
*/
