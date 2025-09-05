import 'package:cryptoback_business_app/app_routes.dart';
import 'package:cryptoback_business_app/resources/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../notifier/scan_notifier.dart';

class CameraScreen extends ConsumerWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scanState = ref.watch(scanProvider);
    final scanNotifier = ref.read(scanProvider.notifier);

    // Set up QR detection callback
    scanNotifier.onQRDetected = (result) =>
        _handleQRResult(result, context, ref);

    // Show error message if any
    if (scanState.errorMessage != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(scanState.errorMessage!),
            backgroundColor: Colors.red,
          ),
        );
      });
    }

    if (!scanState.hasPermission) {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () {
              Navigator.pop(context);
              // cameraController!.dispose();
            },
          ),
          title: const Text(
            'Get Help',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.camera_alt, color: Colors.white54, size: 64),
              const SizedBox(height: 16),
              const Text(
                'Camera Permission Required',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Please allow camera access to scan QR codes',
                style: TextStyle(color: Colors.white70, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  scanNotifier.retryInitialization();
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    if (!scanState.isInitialized || scanNotifier.cameraController == null) {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'Get Help',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: Colors.white),
              SizedBox(height: 16),
              Text(
                'Initializing Camera...',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 24.sp),
          onPressed: () => Navigator.pop(context),
        ),

        actions: [
          Padding(
            padding: EdgeInsetsGeometry.only(right: 24.w),
            child: Text(
              'Get Help',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // IconButton(
          //   icon: Icon(
          //     isFlashOn ? Icons.flash_on : Icons.flash_off,
          //     color: Colors.white,
          //   ),
          //   onPressed: () async {
          //     if (cameraController != null) {
          //       await cameraController!.toggleTorch();
          //       setState(() {
          //         isFlashOn = !isFlashOn;
          //       });
          //     }
          //   },
          // ),
        ],
      ),
      body: Stack(
        children: [
          // Camera preview
          MobileScanner(
            controller: scanNotifier.cameraController!,
            onDetect: scanNotifier.onDetect,
          ),

          // Dark overlay with transparent center
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                // Dark overlay
                Container(color: Colors.black.withOpacity(0.5)),

                // Transparent scanning area
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 40.h),
                    child: ClipPath(
                      clipper: QRScannerClipper(),
                      child: Container(
                        width: 280.w,
                        height: 280.h,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Main content overlay
          Column(
            children: [
              // Top spacing for status bar and app bar
              SizedBox(height: 120.h),
              // Scanning frame area
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // QR Code scanning frame
                      Container(
                        width: 267.w,
                        height: 239.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff717171),
                            width: 1.r,
                          ),
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(21.r),
                          child: SvgPicture.asset(
                            SvgAssets.qrSquare,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),

                      SizedBox(height: 50.h),

                      // Instructions text
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 38.w),
                        child: Text(
                          'Place the QR Code in this box',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),

                      SizedBox(height: 6.h),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 38.w),
                        child: const Text(
                          'Position all 4 corners of the QR Code in the frame',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom camera button
              Padding(
                padding: EdgeInsets.only(bottom: 50.h),
                child: GestureDetector(
                  onTap: () async {
                    HapticFeedback.lightImpact();
                    await scanNotifier.captureImage();
                    // Navigate to purchase detail screen
                    scanNotifier.stopScanning();
                    Navigator.pushNamed(context, purchaseDetailRoute).then((
                      value,
                    ) {
                      scanNotifier.resumeScanning();
                    });
                  },
                  child: Container(
                    width: 80.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 6.w),
                    ),
                    child: Center(
                      child: Container(
                        width: 60.w,
                        height: 60.h,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _handleQRResult(String result, BuildContext context, WidgetRef ref) {
    final scanNotifier = ref.read(scanProvider.notifier);
    // Navigate to purchase detail screen
    scanNotifier.stopScanning();
    Navigator.pushNamed(context, purchaseDetailRoute).then((value) {
      scanNotifier.resumeScanning();
    });
  }
}

// Custom clipper for scanning area
class QRScannerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    // Create a hole in the center for scanning
    final scanningRect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: 280,
      height: 280,
    );

    path.addRect(scanningRect);
    path.fillType = PathFillType.evenOdd;

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
