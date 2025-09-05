// import 'package:cryptoback_business_app/ui/themes/color_constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String title;
//   final VoidCallback? onBackPressed;
//   final List<Widget>? actions;
//
//   const CustomAppBar({
//     super.key,
//     required this.title,
//     this.onBackPressed,
//     this.actions,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 68.h,
//       decoration: BoxDecoration(
//         color: AppColors.kPrimaryColor,
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(20.r),
//           bottomRight: Radius.circular(20.r),
//         ),
//       ),
//       child: Row(
//         children: [
//           if (onBackPressed != null)
//             IconButton(
//               onPressed: onBackPressed,
//               icon: const Icon(
//                 Icons.arrow_back_ios,
//                 color: Colors.white,
//                 size: 20,
//               ),
//             ),
//           Expanded(
//             child: Text(
//               title,
//               style: TextStyle(
//                 fontSize: 18.sp,
//                 fontWeight: FontWeight.w600,
//                 color: AppColors.whiteColor,
//                 letterSpacing: -0.18,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           if (actions != null) ...actions!,
//         ],
//       ),
//     );
//   }
//
//   @override
//   Size get preferredSize => Size.fromHeight(120.h);
// }
