import '../../../../utils/in_memory_store.dart';
import '../../domain/online_cart.dart';
import 'local_cart_repository.dart';

class FakeLocalCartRepository implements LocalCartRepository {
  FakeLocalCartRepository({this.addDelay = true});
  final bool addDelay;

  final _cart = InMemoryStore<RemoteCart>(const RemoteCart(carts: []));

  @override
  Future<RemoteCart> fetchCart() => Future.value(_cart.value);

  @override
  Stream<RemoteCart> watchCart() => _cart.stream;

  @override
  Future<void> setCart(RemoteCart cart) async {
    _cart.value = cart;
  }
}
