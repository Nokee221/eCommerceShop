import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile_ecommerce/models/category_model.dart';
import 'package:mobile_ecommerce/repositories/category/base_category_repository.dart';

class CategoryRepository extends BaseCategoryRepository {
  final FirebaseFirestore _firebaseFirestore;

  CategoryRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Category>> getAllCategories() {
    return _firebaseFirestore
        .collection('categories')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((e) => Category.fromSnapshot(e)).toList();
    });
  }
}
