import 'package:cryptoback_business_app/ui/themes/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget white38w800Center({required String data}) {
  return Text(
    data,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: AppColors.whiteColor,
      fontSize: 20.sp,
      fontWeight: FontWeight.w800,
    ),
  );
}

Widget white20w400Center({required String data}) {
  return Text(
    data,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: AppColors.whiteColor,
      fontSize: 20.sp,
      fontWeight: FontWeight.w400,
    ),
  );
}

Widget blue24w500Center({required String data}) {
  return Text(
    data,
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
  );
}

Widget black232w600Center({required String data}) {
  return Text(
    data,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.blackColor2,
    ),
  );
}

Widget grey12w500Center({required String data, bool? isCenter}) {
  return Text(
    data,
    textAlign: isCenter != null ? TextAlign.center : TextAlign.start,
    style: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.greyColor,
    ),
  );
}

Widget grey12w400Center({required String data}) {
  return Text(
    data,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.greyColor,
    ),
  );
}

Widget blue12w600Center({required String data}) {
  return Text(
    data,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.kPrimaryColor,
    ),
  );
}

Widget black14w500center({required String data}) {
  return Text(
    data,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.blackColor,
    ),
  );
}

Widget listTileTextBlackColor14w400center({
  required String data,
  bool? alignCenter,
}) {
  return Text(
    data,
    textAlign: alignCenter != null ? TextAlign.center : TextAlign.end,
    style: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.listTileTextBlackColor,
    ),
  );
}

Widget listTileTextBlackColor12w600center({
  required String data,
  bool? alignCenter,
}) {
  return Text(
    data,
    textAlign: alignCenter != null ? TextAlign.center : TextAlign.end,
    style: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.listTileTextBlackColor,
    ),
  );
}

Widget listTileTextBlackColor12w400center({
  required String data,
  bool? alignCenter,
}) {
  return Text(
    data,
    textAlign: alignCenter != null ? TextAlign.center : TextAlign.left,
    style: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.listTileTextBlackColor,
    ),
  );
}

Widget black16w500center({required String data, bool? alignCenter}) {
  return Text(
    data,
    textAlign: alignCenter != null ? TextAlign.center : TextAlign.start,
    style: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.blackColor,
    ),
  );
}

Widget black14w400center({required String data, bool? alignCenter}) {
  return Text(
    data,
    textAlign: alignCenter != null ? TextAlign.center : TextAlign.start,
    style: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.blackColor,
    ),
  );
}

Widget black13w400center({required String data, bool? alignCenter}) {
  return Text(
    data,
    textAlign: alignCenter != null ? TextAlign.center : TextAlign.start,
    style: TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.blackColor,
    ),
  );
}

Widget black18w500center({required String data, bool? alignCenter}) {
  return Text(
    data,
    textAlign: alignCenter != null ? TextAlign.center : TextAlign.start,
    style: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.blackColor,
    ),
  );
}

Widget black25w500center({required String data}) {
  return Text(
    data,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 25.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.blackColor2,
    ),
  );
}

Widget black25w600center({required String data}) {
  return Text(
    data,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 25.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.blackColor2,
    ),
  );
}

Widget blue12w400Center({required String data}) {
  return Text(
    data,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.kPrimaryColor,
    ),
  );
}

Widget black22w600center({required String data}) {
  return Text(
    data,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.blackColor2,
    ),
  );
}

Widget black16w600center({required String data}) {
  return Text(
    data,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.blackColor2,
    ),
  );
}
