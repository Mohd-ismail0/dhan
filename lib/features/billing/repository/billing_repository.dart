import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhanda_app/core/failure.dart';
import 'package:dhanda_app/core/providers/firebase_providers.dart';
import 'package:dhanda_app/core/type_defs.dart';
import 'package:dhanda_app/models/bill_model.dart';
import 'package:dhanda_app/models/products_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

final billingRepositoryProvider = Provider(
    (ref) => BillingRepository(firebaseFirestore: ref.read(firestoreProvider)));

class BillingRepository {
  FirebaseFirestore _firebaseFirestore;
  BillingRepository({required FirebaseFirestore firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore;

  FutureEither<ProductsModel> getProductDetail(double barcode) async {
    var _productRef = _firebaseFirestore.collection("products");
    var _query = _productRef.where("Barcode", isEqualTo: barcode);

    late ProductsModel productsModel;
    print("HERROOO");
    try {
      await _query.get().then((querySnapshot) {
        print("Successfully Fetched");
        QueryDocumentSnapshot doc = querySnapshot.docs[0];
        var data = doc.data() as Map<String, dynamic>;
        print(data);
        productsModel = ProductsModel.fromMap(data);

        return right(productsModel);
      });
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }

    return right(productsModel);
  }

  Future<bool> uploadBillData(BillModel billModel) async {
    var _billRef = _firebaseFirestore.collection("billings");
    try {
      var billSnap = await _billRef.add(billModel.toMap());
      print(billSnap.id);
      return true;
    } on Exception {
      return false;
    }
  }
}
