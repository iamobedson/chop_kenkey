import 'package:chop_kenkey/models/models.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}
