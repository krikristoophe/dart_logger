// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dart_logger_configuration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DartLoggerConfiguration {
  String get name;
  LogFormat get format;

  /// Create a copy of DartLoggerConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DartLoggerConfigurationCopyWith<DartLoggerConfiguration> get copyWith =>
      _$DartLoggerConfigurationCopyWithImpl<DartLoggerConfiguration>(
          this as DartLoggerConfiguration, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DartLoggerConfiguration &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.format, format) || other.format == format));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, format);

  @override
  String toString() {
    return 'DartLoggerConfiguration(name: $name, format: $format)';
  }
}

/// @nodoc
abstract mixin class $DartLoggerConfigurationCopyWith<$Res> {
  factory $DartLoggerConfigurationCopyWith(DartLoggerConfiguration value,
          $Res Function(DartLoggerConfiguration) _then) =
      _$DartLoggerConfigurationCopyWithImpl;
  @useResult
  $Res call({String name, LogFormat format});
}

/// @nodoc
class _$DartLoggerConfigurationCopyWithImpl<$Res>
    implements $DartLoggerConfigurationCopyWith<$Res> {
  _$DartLoggerConfigurationCopyWithImpl(this._self, this._then);

  final DartLoggerConfiguration _self;
  final $Res Function(DartLoggerConfiguration) _then;

  /// Create a copy of DartLoggerConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? format = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      format: null == format
          ? _self.format
          : format // ignore: cast_nullable_to_non_nullable
              as LogFormat,
    ));
  }
}

/// Adds pattern-matching-related methods to [DartLoggerConfiguration].
extension DartLoggerConfigurationPatterns on DartLoggerConfiguration {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DartLoggerConfiguration value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DartLoggerConfiguration() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DartLoggerConfiguration value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DartLoggerConfiguration():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DartLoggerConfiguration value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DartLoggerConfiguration() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String name, LogFormat format)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DartLoggerConfiguration() when $default != null:
        return $default(_that.name, _that.format);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String name, LogFormat format) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DartLoggerConfiguration():
        return $default(_that.name, _that.format);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String name, LogFormat format)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DartLoggerConfiguration() when $default != null:
        return $default(_that.name, _that.format);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DartLoggerConfiguration implements DartLoggerConfiguration {
  const _DartLoggerConfiguration(
      {required this.name, this.format = LogFormat.inline});

  @override
  final String name;
  @override
  @JsonKey()
  final LogFormat format;

  /// Create a copy of DartLoggerConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DartLoggerConfigurationCopyWith<_DartLoggerConfiguration> get copyWith =>
      __$DartLoggerConfigurationCopyWithImpl<_DartLoggerConfiguration>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DartLoggerConfiguration &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.format, format) || other.format == format));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, format);

  @override
  String toString() {
    return 'DartLoggerConfiguration(name: $name, format: $format)';
  }
}

/// @nodoc
abstract mixin class _$DartLoggerConfigurationCopyWith<$Res>
    implements $DartLoggerConfigurationCopyWith<$Res> {
  factory _$DartLoggerConfigurationCopyWith(_DartLoggerConfiguration value,
          $Res Function(_DartLoggerConfiguration) _then) =
      __$DartLoggerConfigurationCopyWithImpl;
  @override
  @useResult
  $Res call({String name, LogFormat format});
}

/// @nodoc
class __$DartLoggerConfigurationCopyWithImpl<$Res>
    implements _$DartLoggerConfigurationCopyWith<$Res> {
  __$DartLoggerConfigurationCopyWithImpl(this._self, this._then);

  final _DartLoggerConfiguration _self;
  final $Res Function(_DartLoggerConfiguration) _then;

  /// Create a copy of DartLoggerConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? format = null,
  }) {
    return _then(_DartLoggerConfiguration(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      format: null == format
          ? _self.format
          : format // ignore: cast_nullable_to_non_nullable
              as LogFormat,
    ));
  }
}

// dart format on
