import 'package:chop_kenkey/models/models.dart';

abstract class BaseCheckouRepository {
  Future<void> addCheckout(Checkout checkout);
}
