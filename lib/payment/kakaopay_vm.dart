import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fronttodayhome/payment/ready/ready_repository.dart';

class KaKaoPayVM extends StateNotifier<String?> {
  KaKaoPayVM(super.state);

  Future<void> notifyURL(int id) async {
    String nextUrl = await ReadyRepository().findUrl(id);
    state = nextUrl;
  }
}

final KaKaoPayProvider =
    StateNotifierProvider.family<KaKaoPayVM, String?, int>((ref, id) {
  return KaKaoPayVM(null)..notifyURL(id);
});
