import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:universal_io/io.dart';

part 'dart_logger_configuration.freezed.dart';

/// LogFormat define the format of printed line
enum LogFormat {
  /// inline format message in human readable line
  inline,

  /// json format message in easy parsable json line
  json;
}

/// DartLoggerConfiguration contains logger configuration
@freezed
class DartLoggerConfiguration with _$DartLoggerConfiguration {
  /// [format] and [name] are required
  const factory DartLoggerConfiguration({
    required LogFormat format,
    required String name,
  }) = _DartLoggerConfiguration;

  /// Default logger configuration is LogFormat.inline with current executable
  /// name as logger name
  factory DartLoggerConfiguration.defaultConfiguration() {
    final String executableName = Platform.resolvedExecutable.split('/').last;
    return DartLoggerConfiguration(
      format: LogFormat.inline,
      name: executableName,
    );
  }
}
