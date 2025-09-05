import 'package:carousel_slider/carousel_slider.dart';
import 'package:cryptoback_business_app/app_routes.dart';
import 'package:cryptoback_business_app/resources/assets.dart';
import 'package:cryptoback_business_app/ui/notifier/merchant_notifier.dart';
import 'package:cryptoback_business_app/ui/themes/color_constants.dart';
import 'package:cryptoback_business_app/utils/responsive.dart';
import 'package:cryptoback_business_app/widgets/custom_blue_app_bar.dart';
import 'package:cryptoback_business_app/widgets/merchant_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class MerchantScreen extends ConsumerWidget {
  const MerchantScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final merchantState = ref.watch(merchantProvider);
    final merchantNotifier = ref.read(merchantProvider.notifier);

    final CarouselSliderController carouselController =
        CarouselSliderController();

    return Scaffold(
      appBar: CustomBlueAppBar(
        title: 'All Merchants',
        showActions: false,
        showLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),

          // Carousel Slider
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                height: Responsive.getResponsiveDesign(
                  mobile: () => 125.h,
                  smallTablet: () => 180.h,
                  tablet: () => 200.h,
                )!,
                clipBehavior: Clip.none,
                viewportFraction: Responsive.getResponsiveDesign(
                  mobile: () => 0.85,
                  smallTablet: () => 0.7,
                  tablet: () => 0.75,
                )!,
                enlargeCenterPage: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeFactor: 0.22,
                // enlargeFactor: Responsive.getResponsiveDesign(
                //   mobile: () => 0.22,
                //   smallTablet: () => 0.3,
                //   tablet: () => 0.4,
                // )!,
                onPageChanged: (index, reason) {
                  merchantNotifier.updateCarouselIndex(index);
                },
              ),
              items: merchantState.merchantImages.map((imagePath) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      // width: 277.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.asset(imagePath, fit: BoxFit.cover),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),

          SizedBox(height: 10.h),

          // Pagination Dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(merchantState.merchantImages.length, (index) {
                final isActive = index == merchantState.currentCarouselIndex;
                return Container(
                  margin: EdgeInsets.only(right: 2.w),
                  width: isActive ? 23.w : 8.w,
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: isActive
                        ? AppColors.kPrimaryColor
                        : const Color(0xFFDBE4FF),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                );
              }),
            ],
          ),

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

          SizedBox(height: 12.h),
          Expanded(
            child: ListView.builder(
              // clipBehavior: Clip.none,
              padding: EdgeInsets.only(top: 13.h, left: 25.w, right: 25.w),
              itemCount: 8,
              itemBuilder: (context, index) {
                final isLastItem = index == 7;
                return Padding(
                  padding: EdgeInsets.only(bottom: isLastItem ? 120.h : 20.h),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, merchantDetailRoute);
                    },
                    child: MerchantCard(
                      isFavorite: false,
                      imagePath: DummyAssets.mcdonald,
                      merchantName: 'Dominos Pizza',
                      discount: '50%',
                      cashback: 'Cash Back',
                      distance: '5.4 KM',
                      isInStore: true,
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

  // Widget _buildMerchantCard({
  // required BuildContext context,
  // required String imagePath,
  // required String merchantName,
  // required String discount,
  // required String cashback,
  // required String distance,
  // required bool isInStore,
  // }) {
  //   return
}
