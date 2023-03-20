import 'package:flutter/cupertino.dart';

class DbDiagnose {
  void printExecutionTime(Function function, String functionName) async {
    final stopwatch = Stopwatch()..start();
    await function();
    final elapsedMs = stopwatch.elapsedMilliseconds;
    debugPrint('Execution time of $functionName: $elapsedMs ms');
  }
}