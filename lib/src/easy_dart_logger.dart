import 'dart:convert';
import 'dart:developer';

import 'package:easy_dart_logger/src/dart_logger_configuration.dart';
import 'package:logging/logging.dart';

/// true is running on web platform
const bool kIsWeb = bool.fromEnvironment('dart.library.js_util');

/// Define differents levels available
enum DartLoggerLevel {
  /// Error level is printed red on stderr
  error._('\x1B[31m', Level.SEVERE),

  /// Debug level is printed blue on stderr
  debug._('\x1B[34m', Level.FINE),

  /// Warning level is printed yellow on stdout
  warning._('\x1B[33m', Level.WARNING),

  /// Info level is printed green on stdout
  info._('\x1B[32m', Level.INFO); // green - stdout

  const DartLoggerLevel._(
    this.colorCode,
    this.level,
  );

  /// Color code of level printing
  final String colorCode;

  /// Std output of message
  final Level level;

  @override
  String toString() {
    return '$colorCode${name.toUpperCase()}\x1B[0m';
  }
}

/// DartLogger is used to log messages
class DartLogger {
  /// [configuration] define parameters of logger
  /// Default to `DartLoggerConfiguration.defaultConfiguration()`
  const DartLogger({
    DartLoggerConfiguration? configuration,
  }) : _configuration = configuration;

  final DartLoggerConfiguration? _configuration;

  /// Default global logger
  static DartLogger global = const DartLogger();

  /// Configuration of current logger
  DartLoggerConfiguration get configuration =>
      _configuration ?? DartLoggerConfiguration.defaultConfiguration();

  /// Print Info [message]
  void info(dynamic message) {
    _logMessage(DartLoggerLevel.info, message.toString());
  }

  /// Print warning [message]
  void warning(dynamic message) {
    _logMessage(DartLoggerLevel.warning, message.toString());
  }

  /// Print debug [message]
  void debug(dynamic message) {
    _logMessage(DartLoggerLevel.debug, message.toString());
  }

  /// Print error [message]
  /// [stackTrace] is optionnal
  /// With inline format each line of stacktrace will be printed
  /// With json format, lines are in array with "stacktrace" key
  void error(dynamic message, [StackTrace? stackTrace]) {
    if (configuration.format == LogFormat.inline) {
      _log(
        message,
        DartLoggerLevel.error,
        stackTrace,
      );
    } else {
      _logJson(
        DartLoggerLevel.error,
        message.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  void _log(dynamic message, DartLoggerLevel level, [StackTrace? stackTrace]) {
    final DateTime date = DateTime.now();
    log(
      '[${date.toIso8601String()}\t$level\t] $message',
      stackTrace: stackTrace,
      name: configuration.name,
      time: date,
      level: level.level.value,
    );
  }

  /// Dispatch logging to current LogFormat
  void _logMessage(
    DartLoggerLevel level,
    String message,
  ) {
    switch (configuration.format) {
      case LogFormat.inline:
        _log(
          message,
          level,
        );
      case LogFormat.json:
        _logJson(level, message);
    }
  }

  /// Print json message
  void _logJson(
    DartLoggerLevel level,
    String message, {
    StackTrace? stackTrace,
  }) {
    final Map<String, dynamic> printedJson = <String, dynamic>{
      'timestamp': DateTime.now().toIso8601String(),
      'name': configuration.name,
      'level': level.name,
      'message': message,
      if (stackTrace != null)
        'stacktrace': stackTrace.toString().trim().split('\n'),
    };

    final String printedLine = jsonEncode(printedJson);

    log(printedLine);
  }
}
