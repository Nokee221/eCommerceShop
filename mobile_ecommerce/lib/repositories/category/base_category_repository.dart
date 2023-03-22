import 'package:mobile_ecommerce/models/category_model.dart';

abstract class BaseCategoryRepository{
  Stream<List<Category>> getAllCategories();
}