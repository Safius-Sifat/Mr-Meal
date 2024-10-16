import '../../../routing/app_router.dart';

class Feature {
  final String title;
  final String image;
  final AppRoute route;
  const Feature(
      {required this.title,
      required this.image,
      this.route = AppRoute.comingSoon});
}
