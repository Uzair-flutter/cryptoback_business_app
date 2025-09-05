// ui/widgets/category_selection_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../notifier/business_setup_notifier.dart';
import '../notifier/dummy_notifiers.dart';
import '../themes/color_constants.dart';

class CategorySelectionView extends StatelessWidget {
  const CategorySelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        // Title
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            'Select Business Industry/\nCategory',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1F2937),
              height: 1.3,
            ),
          ),
        ),
        SizedBox(height: 32.h),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Consumer(
              builder: (context, ref, _) {
                final state = ref.watch(dummyProvider);
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 16.h,
                    childAspectRatio:
                        164.w /
                        97.h, // Fixed aspect ratio based on required size
                  ),
                  itemCount: state.categories.length,
                  itemBuilder: (context, index) {
                    final category = state.categories[index];
                    return CategoryCard(
                      category: category,
                      onTap: () {
                        ref
                            .read(dummyProvider.notifier)
                            .updateSelectedCategory(category.title);
                        // Update business step validation
                        ref
                            .read(businessSetupProvider.notifier)
                            .updateCategorySelection(true);
                      },
                      isSelected: state.selectedCategory == category.title,
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryItem {
  final String title;
  final String icon;

  CategoryItem({required this.title, required this.icon});
}

class CategoryCard extends StatelessWidget {
  final CategoryItem category;
  final VoidCallback onTap;
  final bool isSelected;

  const CategoryCard({
    super.key,
    required this.category,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 164.w,
        height: 97.h,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFEEF2FF) : Colors.white,
          border: Border.all(
            color: isSelected
                ? AppColors.kPrimaryColor
                : const Color(0xFFE5E7EB),
            width: isSelected ? 1.w : 1.w,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(category.icon, width: 31.w, height: 31.w),
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Text(
                category.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.sp, // Slightly reduced for better fit
                  fontWeight: FontWeight.w600,
                  color: isSelected
                      ? const Color(0xFF5B7FFF)
                      : const Color(0xFF374151),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
