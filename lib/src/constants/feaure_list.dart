import '../features/products/domain/features.dart';
import '../routing/app_router.dart';
import 'constants.dart';

final kfeatures = [
  Feature(title: 'Category', image: menu),
  Feature(title: 'Official Package', image: paperBag, route: AppRoute.package),
  Feature(title: 'Create Package', image: create),
  Feature(title: 'Meal ON/OFF', image: friedRice, route: AppRoute.todaysMenu),
  Feature(title: 'Guest Meal', image: dish),
  Feature(title: 'Delivery Time', image: foodDelivery),
  Feature(title: 'My Meals', image: lunchTime),
  Feature(title: 'My Offer', image: discount),
];
