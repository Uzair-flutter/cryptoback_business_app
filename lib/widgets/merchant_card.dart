import 'package:cryptoback_business_app/ui/themes/color_constants.dart';
import 'package:cryptoback_business_app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class MerchantCard extends StatelessWidget {
  final String imagePath;
  final String merchantName;
  final String discount;
  final String cashback;
  final String distance;
  final bool isInStore;
  final bool isFavorite;

  const MerchantCard({
    super.key,
    required this.imagePath,
    required this.merchantName,
    required this.discount,
    required this.cashback,
    required this.distance,
    required this.isInStore,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 30,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          // Image Container
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.asset(
              imagePath,
              fit: BoxFit.fitHeight,
              width: Responsive.getResponsiveDesign(
                mobile: () => 152.w,
                smallTablet: () => 170.w,
                tablet: () => 190.w,
              )!,
              height: 152.h,
            ),
          ),

          // Content Container
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          merchantName,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: AppColors.lightBlackColor,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(
                        isFavorite ? Iconsax.heart5 : Iconsax.heart,
                        size: 13.sp,
                        color: isFavorite
                            ? Colors.red
                            : const Color(0xFF292D32),
                      ),
                    ],
                  ),

                  SizedBox(height: 7.h),

                  Text(
                    'Flat',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 11.sp,
                      color: AppColors.lightBlackColor,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    discount,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25.sp,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),

                  SizedBox(height: 3.h),

                  Text(
                    cashback,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 11.sp,
                      color: AppColors.lightBlackColor,
                    ),
                  ),

                  SizedBox(height: 7.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Iconsax.location5,
                            size: 12.sp,
                            color: AppColors.kPrimaryColor,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            distance,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              color: const Color(0xFF797979),
                            ),
                          ),
                        ],
                      ),
                      if (isInStore)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.kPrimaryColor,
                            borderRadius: BorderRadius.circular(3.r),
                          ),
                          child: Text(
                            'In Store',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
