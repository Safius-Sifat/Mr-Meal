import 'dart:async';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../constants/api_constants.dart';
import '../../../../utils/dio_provider.dart';
import '../../domain/cart.dart';
import '../../domain/online_cart.dart';
part 'remote_cart_repository.g.dart';

class RemoteCartRepository {
  RemoteCartRepository(this.client);

  final Dio client;

  /// An InMemoryStore containing the shopping cart data for all users, where:
  /// key: uid of the user
  /// value: Cart of that user

  Future<RemoteCart> fetchCart({required String token}) async {
    final uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: cartItemsUrl,
    );
    final response = await client.getUri(
      uri,
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return RemoteCart.fromJson(response.data as Map<String, dynamic>);
  }

  Future<void> removeCartItem({required String token, required int id}) async {
    final uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: removeFromCartUrl,
    );
    await client.postUri(uri,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
        data: {'cart_id': '$id'});
  }

  Future<void> addItemToCart(
      {required String token,
      required int id,
      required String type,
      required int quantity}) async {
    final uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: addToCartUrl,
    );
    await client.postUri(uri,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
        data: type == 'package'
            ? {'package_id': '$id', 'quantity': '$quantity'}
            : {'item_id': '$id', 'quantity': '$quantity'});
  }

  Future<void> setCart(Cart cart) async {
    // await Future.delayed(Duration(milliseconds: 2000));
    // First, get the current carts data for all users
    // final carts = _carts.value;
    // // Then, set the cart for the given uid
    // carts[uid] = cart;
    // Finally, update the carts data (will emit a new value)
    // _carts.value = cart;
  }
}

@Riverpod(keepAlive: true)
RemoteCartRepository remoteCartRepository(RemoteCartRepositoryRef ref) {
  final dio = ref.watch(dioProvider);

  return RemoteCartRepository(dio);
}
