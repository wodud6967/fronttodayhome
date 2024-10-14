import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fronttodayhome/payment/ready/ready_repository.dart';

class KaKaoPayVM extends StateNotifier<String?> {
  KaKaoPayVM(super.state);

  Future<void> notifyURL() async {
    String nextUrl = await ReadyRepository().findUrl();
    state = nextUrl;
  }
}

final KaKaoPayProvider = StateNotifierProvider<KaKaoPayVM, String?>((ref) {
  return KaKaoPayVM(null)..notifyURL();
});
