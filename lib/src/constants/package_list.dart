import '../features/products/domain/package.dart';
import 'constants.dart';

const description = 'This list a wide here range of traditionali Bangladeshi ';
const price = r'$20';
const pastPrice = r'$40';
final kPackages = [
  Package(
      name: 'Package 1',
      image: riceBox,
      description: description,
      price: price,
      pastPrice: pastPrice),
  Package(
      name: 'Package 2',
      image: sushi,
      description: description,
      price: price,
      pastPrice: pastPrice),
  Package(
      name: 'Package 3',
      image: mealBox,
      description: description,
      price: price,
      pastPrice: pastPrice),
  Package(
      name: 'Package 4',
      image: vegBox,
      description: description,
      price: price,
      pastPrice: pastPrice),
];
