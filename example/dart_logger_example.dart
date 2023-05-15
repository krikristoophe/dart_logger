// ignore_for_file: lines_longer_than_80_chars

import 'package:easy_dart_logger/easy_dart_logger.dart';

void main() {
  // Override default global logger
  DartLogger.global = DartLogger(
    configuration: DartLoggerConfiguration.defaultConfiguration(),
  );

  // Use global logger
  DartLogger.global.error('error');

  DartLogger.global.debug('debug');

  DartLogger.global.info('info');

  DartLogger.global.warning('warning');

  /*
  Result :

  [2023-05-15T02:36:16.696898     ERROR   dart] error
  [2023-05-15T02:36:16.705203     DEBUG   dart] debug
  [2023-05-15T02:36:16.705379     INFO    dart] info
  [2023-05-15T02:36:16.705420     WARNING dart] warning
  */

  // Create other logger with different configuration (inline)
  final DartLogger loggerInline = DartLogger(
    configuration: const DartLoggerConfiguration(
      format: LogFormat.inline,
      name: 'loggerInline',
    ),
  );

  loggerInline.error('error', StackTrace.current);

  loggerInline.debug(<String, dynamic>{'is_debug': true});

  loggerInline.info('info');

  loggerInline.warning('warning');

  /*
  Result :

  [2023-05-15T02:36:16.705535     ERROR   loggerInline] error
  [2023-05-15T02:36:16.705535     ERROR   loggerInline] #0      main (file:///Users/christophesonneville/dev/devac/dart_logger/example/dart_logger_example.dart:26:42)
  [2023-05-15T02:36:16.705535     ERROR   loggerInline] #1      _delayEntrypointInvocation.<anonymous closure> (dart:isolate-patch/isolate_patch.dart:297:19)
  [2023-05-15T02:36:16.705535     ERROR   loggerInline] #2      _RawReceivePort._handleMessage (dart:isolate-patch/isolate_patch.dart:192:26)
  [2023-05-15T02:36:16.706730     DEBUG   loggerInline] {is_debug: true}
  [2023-05-15T02:36:16.706775     INFO    loggerInline] info
  [2023-05-15T02:36:16.706793     WARNING loggerInline] warning
  */

  // Create other logger with different configuration (json)
  final DartLogger loggerJson = DartLogger(
    configuration: const DartLoggerConfiguration(
      format: LogFormat.json,
      name: 'loggerJson',
    ),
  );

  loggerJson.error('error', StackTrace.current);

  loggerJson.debug('debug');

  loggerJson.info('info');

  loggerJson.warning(true);

  /*
  Result :

  {"timestamp":"2023-05-15T02:36:16.706902","name":"loggerJson","level":"error","message":"error","stacktrace":["#0      main (file:///Users/christophesonneville/dev/devac/dart_logger/example/dart_logger_example.dart:42:40)","#1      _delayEntrypointInvocation.<anonymous closure> (dart:isolate-patch/isolate_patch.dart:297:19)","#2      _RawReceivePort._handleMessage (dart:isolate-patch/isolate_patch.dart:192:26)"]}
  {"timestamp":"2023-05-15T02:36:16.708224","name":"loggerJson","level":"debug","message":"debug"}
  {"timestamp":"2023-05-15T02:36:16.708274","name":"loggerJson","level":"info","message":"info"}
  {"timestamp":"2023-05-15T02:36:16.708304","name":"loggerJson","level":"warning","message":"true"}
  */
}
