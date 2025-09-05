import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../utils/base_notifier.dart';
import '../states/scan_state.dart';

final scanProvider = StateNotifierProvider<ScanNotifier, ScanState>((_) => ScanNotifier());

class ScanNotifier extends BaseNotifier<ScanState> {
  ScanNotifier()
      : super(
          ScanState(),
        ) {
    _initializeCamera();
  }

  MobileScannerController? cameraController;

  Future<void> _initializeCamera() async {
    try {
      state = state.copyWith(isLoading: true);
      
      // Check camera permission first
      final status = await Permission.camera.status;
      if (status.isGranted) {
        await _initializeCameraController();
      } else {
        final result = await Permission.camera.request();
        if (result.isGranted) {
          await _initializeCameraController();
        } else {
          state = state.copyWith(
            hasPermission: false,
            isLoading: false,
          );
        }
      }
    } catch (e) {
      print('Error initializing camera: $e');
      state = state.copyWith(
        hasPermission: false,
        isLoading: false,
        errorMessage: 'Failed to initialize camera: $e',
      );
    }
  }

  Future<void> _initializeCameraController() async {
    try {
      cameraController = MobileScannerController(
        detectionSpeed: DetectionSpeed.normal,
        facing: CameraFacing.back,
        torchEnabled: false,
      );

      state = state.copyWith(
        hasPermission: true,
        isInitialized: true,
        isLoading: false,
      );
    } catch (e) {
      print('Error creating camera controller: $e');
      state = state.copyWith(
        hasPermission: false,
        isInitialized: false,
        isLoading: false,
        errorMessage: 'Failed to create camera controller: $e',
      );
    }
  }

  Function(String)? onQRDetected;

  void onDetect(BarcodeCapture capture) {
    if (!state.isScanning) return;

    final List<Barcode> barcodes = capture.barcodes;
    if (barcodes.isNotEmpty) {
      state = state.copyWith(isScanning: false);
      final result = barcodes.first.displayValue ?? 'Unknown';
      onQRDetected?.call(result);
    }
  }

  Future<void> captureImage() async {
    if (cameraController == null) return;

    try {
      // Show feedback to user
      HapticFeedback.mediumImpact();
      
      // Stop scanning temporarily
      cameraController!.stop();
      
      // The navigation will be handled by the UI layer
    } catch (e) {
      print('Error capturing image: $e');
      state = state.copyWith(
        errorMessage: 'Failed to capture image. Please try again.',
      );
    }
  }

  Future<void> toggleFlash() async {
    if (cameraController != null) {
      await cameraController!.toggleTorch();
      state = state.copyWith(isFlashOn: !state.isFlashOn);
    }
  }

  void retryInitialization() {
    _initializeCamera();
  }

  void resumeScanning() {
    if (cameraController != null) {
      cameraController!.start();
      state = state.copyWith(isScanning: true);
    }
  }

  void stopScanning() {
    if (cameraController != null) {
      cameraController!.stop();
      state = state.copyWith(isScanning: false);
    }
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  @override
  void handleError(String message) {
    state = state.copyWith(errorMessage: message);
  }
}
