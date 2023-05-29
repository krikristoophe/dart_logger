import 'package:easy_dart_logger/src/easy_dart_logger.dart';

/// NoDartLogger is used to override DartLogger to print nothing
class NoDartLogger extends DartLogger {
  /// Print Info [message]
  @override
  void info(dynamic message) {}

  /// Print warning [message]
  @override
  void warning(dynamic message) {}

  /// Print debug [message]
  @override
  void debug(dynamic message) {}

  /// Print error [message]
  /// [stackTrace] is optionnal
  /// With inline format each line of stacktrace will be printed
  /// With json format, lines are in array with "stacktrace" key
  @override
  void error(dynamic message, [StackTrace? stackTrace]) {}
}
