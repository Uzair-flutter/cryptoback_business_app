import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../resources/assets.dart';
import '../../utils/base_notifier.dart';
import '../widgets/category_selection_view.dart';

final dummyProvider = StateNotifierProvider((_) => DummyNotifier());

class DummyNotifier extends BaseNotifier<DummyState> {
  DummyNotifier()
    : super(
        DummyState(
          categories: [
            CategoryItem(title: 'Food & Beverages', icon: DummyAssets.test1),
            CategoryItem(title: 'Clothing Brand', icon: DummyAssets.test2),
            CategoryItem(title: 'Fashion', icon: DummyAssets.test3),
            CategoryItem(title: 'Groceries', icon: DummyAssets.test4),
            CategoryItem(
              title: 'Beauty & Personal Care',
              icon: DummyAssets.test1,
            ),
            CategoryItem(title: 'Electronics', icon: DummyAssets.test2),
            CategoryItem(title: 'Health & Wellness', icon: DummyAssets.test3),
            CategoryItem(title: 'Home & Furniture', icon: DummyAssets.test4),
            CategoryItem(title: 'Toys & Hobbies', icon: DummyAssets.test1),
            CategoryItem(title: 'Sports & Outdoors', icon: DummyAssets.test2),
            CategoryItem(title: 'Automotive', icon: DummyAssets.test3),
            CategoryItem(title: 'Books & Stationery', icon: DummyAssets.test4),
          ],
        ),
      );

  void updateSelectedCategory(String category) {
    state = state.copyWith(selectedCategory: category);
  }

  @override
  void handleError(String message) {
    log('Error: $message');
  }
}

class DummyState {
  final String? selectedCategory;
  final List<CategoryItem> categories;

  const DummyState({this.selectedCategory, required this.categories});

  DummyState copyWith({
    String? selectedCategory,
    List<CategoryItem>? categories,
  }) {
    return DummyState(
      selectedCategory: selectedCategory ?? this.selectedCategory,
      categories: categories ?? this.categories,
    );
  }
}
