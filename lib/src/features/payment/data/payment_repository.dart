import 'dart:async';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/api_constants.dart';
import '../../../utils/dio_provider.dart';
part 'payment_repository.g.dart';

class PaymentRepository {
  PaymentRepository(this.client);

  final Dio client;

  Future<String> postOrder({
    required String token,
    required double amount,
    required String address,
    required List<List<dynamic>> items,
    required List<List<dynamic>> packages,
    required double discount,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: orderUrl,
    );

    final response = await client.postUri(uri,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
        data: {
          'amount': '$amount',
          'address': address,
          'item_id': items.toString(),
          'package_id': packages.toString(),
          'discount': '$discount'
        });

    return response.data['payment_url'] as String;
  }

  Future<bool> fetchPaymentStatus(
      {String? token, CancelToken? cancelToken, required String url}) async {
    final response = await client.getUri(
      Uri.parse(url),
    );
    return response.data['success'] as int == 200;
  }
}

@riverpod
PaymentRepository paymentRepository(PaymentRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  return PaymentRepository(dio);
}

// @riverpod
// Future<List<Announcement>> fetchAnnouncement(FetchAnnouncementRef ref) {
//   final user = ref.read(authRepositoryProvider).currentUser;
//   if (user == null) {
//     throw UserNotAuthenticated();
//   }
//   final repo = ref.watch(announcementRepositoryProvider);
//   final cancelToken = CancelToken();
//   ref.listenSelf((_, st) {
//     if (st.hasValue) {
//       final link = ref.keepAlive();
//       Timer? timer;
//       ref.onDispose(() {
//         cancelToken.cancel();
//         timer?.cancel();
//       });
//       ref.onCancel(() {
//         timer = Timer(const Duration(seconds: 30), link.close);
//       });
//       ref.onResume(() {
//         timer?.cancel();
//       });
//     }
//   });
//   return repo.fetchAnnouncement(token: user.token, cancelToken: cancelToken);
// }
