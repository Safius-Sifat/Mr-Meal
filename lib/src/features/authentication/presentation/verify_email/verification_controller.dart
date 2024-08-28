import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'verification_controller.g.dart';

@riverpod
Stream<String> timer(TimerRef ref) async* {
  String minutesStr = '02';
  String secondsStr = '00';
  for (int newTick = 120; newTick >= 0; newTick--) {
    await Future.delayed(const Duration(seconds: 1), () {
      minutesStr = ((newTick / 60) % 60).floor().toString().padLeft(2, '0');
      secondsStr = (newTick % 60).toString().padLeft(2, '0');
    });

    yield '$minutesStr:$secondsStr';
  }
}
