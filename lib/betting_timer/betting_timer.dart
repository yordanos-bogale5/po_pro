import 'dart:async';

class BettingTimer {
  final int duration; // duration in seconds
  late Timer _timer;
  int _remainingTime;

  // A stream to notify when the timer has finished
  final StreamController<int> _timerController = StreamController<int>();

  BettingTimer({this.duration = 30}) : _remainingTime = duration;

  // Start the timer
  void start() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _remainingTime--;
      _timerController.add(_remainingTime);

      if (_remainingTime == 0) {
        _timer.cancel();
        _timerController.add(-1); // -1 means time's up
      }
    });
  }

  // Stop the timer
  void stop() {
    _timer.cancel();
  }

  // Reset the timer to the original duration
  void reset() {
    _remainingTime = duration;
    _timerController.add(_remainingTime);
  }

  Stream<int> get remainingTime => _timerController.stream;
}
