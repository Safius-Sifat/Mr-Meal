import '../../../routing/app_router.dart';

class Feature {
  final String title;
  final String image;
  final AppRoute route;

  Feature(
      {required this.title,
      required this.image,
      this.route = AppRoute.category});
}
