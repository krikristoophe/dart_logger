import 'dart:convert';

import 'package:easy_dart_logger/src/dart_logger_configuration.dart';
import 'package:universal_io/io.dart';

/// StdSink define the std output on which log will be printed
enum StdSink {
  /// stdout
  out,

  /// stderr
  err;
}

/// true is running on web platform
const bool kIsWeb = bool.fromEnvironment('dart.library.js_util');

/// Define differents levels available
enum DartLoggerLevel {
  /// Error level is printed red on stderr
  error._('\x1B[31m', StdSink.err),

  /// Debug level is printed blue on stderr
  debug._('\x1B[34m', StdSink.out),

  /// Warning level is printed yellow on stdout
  warning._('\x1B[33m', StdSink.out),

  /// Info level is printed green on stdout
  info._('\x1B[32m', StdSink.out); // green - stdout

  const DartLoggerLevel._(
    this.colorCode,
    this.sink,
  );

  /// Color code of level printing
  final String colorCode;

  /// Std output of message
  final StdSink sink;

  @override
  String toString() {
    return '$colorCode${name.toUpperCase()}\x1B[0m';
  }
}

/// DartLogger is used to log messages
class DartLogger {
  /// [configuration] define parameters of logger
  /// Default to `DartLoggerConfiguration.defaultConfiguration()`
  DartLogger({
    DartLoggerConfiguration? configuration,
  }) : configuration =
            configuration ?? DartLoggerConfiguration.defaultConfiguration();

  /// Default global logger
  static DartLogger global = DartLogger();

  /// Configuration of current logger
  final DartLoggerConfiguration configuration;

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
      final String date = DateTime.now().toIso8601String();
      _logInline(
        DartLoggerLevel.error,
        message.toString(),
        overrideDate: date,
      );
      if (stackTrace != null) {
        final List<String> stacktraceLines =
            stackTrace.toString().trim().split('\n');
        for (final String line in stacktraceLines) {
          _logInline(
            DartLoggerLevel.error,
            line,
            overrideDate: date,
          );
        }
      }
    } else {
      _logJson(
        DartLoggerLevel.error,
        message.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  /// Dispatch logging to current LogFormat
  void _logMessage(
    DartLoggerLevel level,
    String message,
  ) {
    switch (configuration.format) {
      case LogFormat.inline:
        _logInline(level, message);
      case LogFormat.json:
        _logJson(level, message);
    }
  }

  /// Print inline [message]
  void _logInline(
    DartLoggerLevel level,
    String message, {
    String? overrideDate,
  }) {
    final String now = overrideDate ?? DateTime.now().toIso8601String();
    final String printedLine = '[$now\t$level\t${configuration.name}] $message';
    _writeLine(level, printedLine);
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

    _writeLine(level, printedLine);
  }

  /// Write line to [level] std output
  void _writeLine(DartLoggerLevel level, String line) {
    if (kIsWeb) {
      // ignore: avoid_print
      print(line);
      return;
    }

    switch (level.sink) {
      case StdSink.out:
        stdout.writeln(line);
      case StdSink.err:
        stderr.writeln(line);
    }
  }
}
