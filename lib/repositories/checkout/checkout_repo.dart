
import 'package:chop_kenkey/models/models.dart';
import 'package:chop_kenkey/repositories/checkout/base_checkout_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CheckoutRepository extends BaseCheckouRepository {
  final FirebaseFirestore _firebaseFirestore;

  CheckoutRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> addCheckout(Checkout checkout) {
    return _firebaseFirestore.collection('checkout').add(checkout.toDocument());
  }
}
