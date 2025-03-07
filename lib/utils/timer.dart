import 'dart:async';
import 'package:get/get.dart';

class TimerManagerController extends GetxController {
  final List<Timer> _activeTimers = [];

  /// Create and store a new timer
  Timer createTimer(Duration duration, void Function() callback) {
    Timer timer = Timer(duration, callback);
    _activeTimers.add(timer);
    return timer;
  }

  /// Create and store a periodic timer
  Timer createPeriodicTimer(Duration duration, void Function() callback) {
    Timer timer = Timer.periodic(duration, (t) => callback());
    _activeTimers.add(timer);
    return timer;
  }

  /// Cancel all active timers
  void cancelAllTimers() {
    for (var timer in _activeTimers) {
      if (timer.isActive) {
        timer.cancel();
      }
    }
    _activeTimers.clear();
  }

  @override
  void onClose() {
    cancelAllTimers(); // Cleanup when the controller is disposed
    super.onClose();
  }
}
