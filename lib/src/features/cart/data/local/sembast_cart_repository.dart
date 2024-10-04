import 'dart:convert';

import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

import '../../domain/online_cart.dart';
import 'local_cart_repository.dart';

class SembastCartRepository implements LocalCartRepository {
  SembastCartRepository(this.db);
  final Database db;
  final store = StoreRef.main();

  static Future<Database> createDatabase(String filename) async {
    final appDocDir = await getApplicationDocumentsDirectory();
    return databaseFactoryIo.openDatabase('${appDocDir.path}/$filename');
  }

  static Future<SembastCartRepository> makeDefault() async {
    return SembastCartRepository(await createDatabase('default.db'));
  }

  static const cartItemsKey = 'cartItems';

  @override
  Future<RemoteCart> fetchCart() async {
    final cartJson = await store.record(cartItemsKey).get(db);
    if (cartJson != null) {
      return RemoteCart.fromJson(cartJson as Map<String, dynamic>);
    } else {
      return const RemoteCart(carts: []);
    }
  }

  @override
  Future<void> setCart(RemoteCart cart) {
    return store.record(cartItemsKey).put(db, cart.toJson());
  }

  @override
  Stream<RemoteCart> watchCart() {
    final record = store.record(cartItemsKey);
    return record.onSnapshot(db).map((snapshot) {
      if (snapshot != null) {
        return RemoteCart.fromJson(snapshot.value! as Map<String, dynamic>);
      } else {
        return const RemoteCart(carts: []);
      }
    });
  }
}
