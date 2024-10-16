import '../features/products/domain/features.dart';
import '../routing/app_router.dart';
import 'constants.dart';

final kfeatures = [
  const Feature(title: 'Categories', image: category, route: AppRoute.category),
  const Feature(
      title: 'Official Package',
      image: officialPackage,
      route: AppRoute.package),
  const Feature(title: 'Create Package', image: createPackage),
  const Feature(
      title: 'Todays Menu', image: todaysMenu, route: AppRoute.todaysMenu),
  const Feature(
      title: 'Meal ON/OFF', image: mealOnOff, route: AppRoute.mealOnOff),
  const Feature(
      title: 'Guest Meal', image: guestMeal, route: AppRoute.guestMeal),
  const Feature(
      title: 'Delivery Time',
      image: deliveryTime,
      route: AppRoute.deliverySchedule),
  const Feature(title: 'My Report', image: myReport, route: AppRoute.myReport),
  const Feature(title: 'My Offer', image: myOffer),
  const Feature(title: 'My Meals', image: lunchTime),
  const Feature(title: 'Feedback & Review', image: feedback),
  const Feature(title: 'Help & Support', image: help),
];
