// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:chop_kenkey/models/models.dart';

abstract class BaseCategoryRepository {
  Stream<List<Category>> getAllCategories();
}
