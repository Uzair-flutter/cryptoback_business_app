import 'package:cryptoback_business_app/app_routes.dart';
import 'package:cryptoback_business_app/resources/assets.dart';
import 'package:cryptoback_business_app/widgets/custom_app_bar.dart';
import 'package:cryptoback_business_app/widgets/custom_blue_app_bar.dart';
import 'package:cryptoback_business_app/widgets/merchant_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class FavoritesScreen extends StatelessWidget {
  static const String routeName = '/favoritesScreen';
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBlueAppBar(
        title: 'Favorites',
        showActions: false,
        showLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Iconsax.search_normal, size: 14.sp),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: ListView.builder(
              // clipBehavior: Clip.none,
              padding: EdgeInsets.only(top: 10.h, left: 25.w, right: 25.w),
              itemCount: 8,
              itemBuilder: (context, index) {
                final isLastItem = index == 7;

                return Padding(
                  padding: EdgeInsets.only(bottom: isLastItem ? 120.h : 20.h),
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, merchantDetailRoute);
                    },
                    child: GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, merchantDetailRoute),
                      child: MerchantCard(
                        isFavorite: true,
                        imagePath: DummyAssets.mcdonald,
                        merchantName: 'Dominos Pizza',
                        discount: '50%',
                        cashback: 'Cash Back',
                        distance: '5.4 KM',
                        isInStore: true,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // SizedBox(height: 100.h),
        ],
      ),
    );
  }
}
