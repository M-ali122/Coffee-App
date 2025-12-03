import 'package:get/get.dart';

class TrackingController extends GetxController {
  final progress = 0.0.obs;
  final etaMinutes = 10.obs;

  void startTracking() {
    // Simulate progress
    progress.value = 0.0;
    etaMinutes.value = 10;
    ever(progress, (p) {
      // no-op
    });
  }

  void updateProgress(double p) {
    progress.value = p;
  }
}
