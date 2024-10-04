import '../features/products/domain/features.dart';
import '../routing/app_router.dart';
import 'constants.dart';

final kfeatures = [
  Feature(title: 'Todays Menu', image: todaysMenu, route: AppRoute.todaysMenu),
  Feature(
      title: 'Official Package',
      image: officialPackage,
      route: AppRoute.package),
  Feature(title: 'Create Package', image: createPackage),
  Feature(title: 'Meal ON/OFF', image: mealOnOff, route: AppRoute.mealOnOff),
  Feature(title: 'Guest Meal', image: guestMeal, route: AppRoute.guestMeal),
  Feature(
      title: 'Delivery Time',
      image: deliveryTime,
      route: AppRoute.deliverySchedule),
  Feature(title: 'My Meals', image: lunchTime),
  Feature(title: 'My Offer', image: myOffer),
  Feature(title: 'Categories', image: category),
  Feature(title: 'Feedback & Review', image: feedback),
  Feature(title: 'Help & Support', image: help),
  Feature(title: 'My Report', image: myReport),
];
