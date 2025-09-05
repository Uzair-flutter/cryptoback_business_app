import 'package:cryptoback_business_app/resources/assets.dart';
import 'package:cryptoback_business_app/ui/screens/customer_profile_screen.dart';
import 'package:cryptoback_business_app/ui/screens/favorites_screen.dart';
import 'package:cryptoback_business_app/ui/screens/home_screen.dart';
import 'package:cryptoback_business_app/ui/screens/merchant_screen.dart';
import 'package:cryptoback_business_app/ui/screens/scan_screen.dart';
import 'package:cryptoback_business_app/ui/themes/color_constants.dart';
import 'package:cryptoback_business_app/utils/custom_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';

final shopperBottomNavIndexProvider = StateProvider<int>((ref) => 0);

class ShopperBottomNavBar extends ConsumerWidget {
  const ShopperBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(shopperBottomNavIndexProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildBody(currentIndex),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        child: BottomNavBar(
          currentIndex: currentIndex,
          onTap: (index) =>
              ref.read(shopperBottomNavIndexProvider.notifier).state = index,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildBody(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return MerchantScreen();
      case 2:
        return ScanScreen();
      case 3:
        return FavoritesScreen();
      case 4:
        return CustomerProfileScreen();
      default:
        return HomeScreen();
    }
  }
}

// Bottom Navigation Bar Widget - Receives state from parent
class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                icon: Icon(
                  Iconsax.home,
                  color: currentIndex == 0
                      ? AppColors.kPrimaryColor
                      : AppColors.greyColor,
                  size: 24.sp,
                ),
                label: 'Home',
                index: 0,
                isSelected: currentIndex == 0,
              ),
              _buildNavItem(
                icon: Icon(
                  Iconsax.shop,
                  color: currentIndex == 1
                      ? AppColors.kPrimaryColor
                      : AppColors.greyColor,
                  size: 24.sp,
                ),
                label: 'Merchant',
                index: 1,
                isSelected: currentIndex == 1,
              ),
              _buildNavItem(
                icon: Icon(
                  Iconsax.scan,
                  color: currentIndex == 2
                      ? AppColors.kPrimaryColor
                      : AppColors.greyColor,
                  size: 24.sp,
                ),
                label: 'Scan',
                index: 2,
                isSelected: currentIndex == 2,
              ),
              _buildNavItem(
                icon: Icon(
                  Iconsax.heart,
                  color: currentIndex == 3
                      ? AppColors.kPrimaryColor
                      : AppColors.greyColor,
                  size: 24.sp,
                ),
                label: 'Favorites',
                index: 3,
                isSelected: currentIndex == 3,
              ),
              _buildNavItem(
                icon: SvgPicture.asset(
                  SvgAssets.user,
                  color: currentIndex == 4
                      ? AppColors.kPrimaryColor
                      : AppColors.greyColor,
                  height: 24.h,
                  width: 24.w,
                ),
                label: 'Profile',
                index: 4,
                isSelected: currentIndex == 4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required Widget icon,
    required String label,
    required int index,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedScale(
              scale: isSelected ? 1.1 : 1.0,
              duration: const Duration(milliseconds: 2500),
              curve: Curves.easeInOut,
              child: icon,
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 350),
              // curve: Curves.easeInOut,
              child: isSelected
                  ? Column(
                      children: [
                        SizedBox(height: 4.h),
                        blue12w400Center(data: label),
                      ],
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
