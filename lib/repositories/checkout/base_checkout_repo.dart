//@dart=2.9
import 'package:chop_kenkey/models/checkout_model.dart';

abstract class BaseCheckouRepository {
  Future<void> addCheckout(Checkout checkout);
}
