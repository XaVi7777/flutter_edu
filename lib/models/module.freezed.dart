// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'module.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CourseModule _$CourseModuleFromJson(Map<String, dynamic> json) {
  return _CourseModule.fromJson(json);
}

/// @nodoc
mixin _$CourseModule {
  int get id => throw _privateConstructorUsedError;
  String get titleKey => throw _privateConstructorUsedError;
  String get descriptionKey => throw _privateConstructorUsedError;
  List<Lesson> get lessons => throw _privateConstructorUsedError;
  bool get isExpanded => throw _privateConstructorUsedError;

  /// Serializes this CourseModule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CourseModule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourseModuleCopyWith<CourseModule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseModuleCopyWith<$Res> {
  factory $CourseModuleCopyWith(
    CourseModule value,
    $Res Function(CourseModule) then,
  ) = _$CourseModuleCopyWithImpl<$Res, CourseModule>;
  @useResult
  $Res call({
    int id,
    String titleKey,
    String descriptionKey,
    List<Lesson> lessons,
    bool isExpanded,
  });
}

/// @nodoc
class _$CourseModuleCopyWithImpl<$Res, $Val extends CourseModule>
    implements $CourseModuleCopyWith<$Res> {
  _$CourseModuleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourseModule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? titleKey = null,
    Object? descriptionKey = null,
    Object? lessons = null,
    Object? isExpanded = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            titleKey: null == titleKey
                ? _value.titleKey
                : titleKey // ignore: cast_nullable_to_non_nullable
                      as String,
            descriptionKey: null == descriptionKey
                ? _value.descriptionKey
                : descriptionKey // ignore: cast_nullable_to_non_nullable
                      as String,
            lessons: null == lessons
                ? _value.lessons
                : lessons // ignore: cast_nullable_to_non_nullable
                      as List<Lesson>,
            isExpanded: null == isExpanded
                ? _value.isExpanded
                : isExpanded // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CourseModuleImplCopyWith<$Res>
    implements $CourseModuleCopyWith<$Res> {
  factory _$$CourseModuleImplCopyWith(
    _$CourseModuleImpl value,
    $Res Function(_$CourseModuleImpl) then,
  ) = __$$CourseModuleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String titleKey,
    String descriptionKey,
    List<Lesson> lessons,
    bool isExpanded,
  });
}

/// @nodoc
class __$$CourseModuleImplCopyWithImpl<$Res>
    extends _$CourseModuleCopyWithImpl<$Res, _$CourseModuleImpl>
    implements _$$CourseModuleImplCopyWith<$Res> {
  __$$CourseModuleImplCopyWithImpl(
    _$CourseModuleImpl _value,
    $Res Function(_$CourseModuleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CourseModule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? titleKey = null,
    Object? descriptionKey = null,
    Object? lessons = null,
    Object? isExpanded = null,
  }) {
    return _then(
      _$CourseModuleImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        titleKey: null == titleKey
            ? _value.titleKey
            : titleKey // ignore: cast_nullable_to_non_nullable
                  as String,
        descriptionKey: null == descriptionKey
            ? _value.descriptionKey
            : descriptionKey // ignore: cast_nullable_to_non_nullable
                  as String,
        lessons: null == lessons
            ? _value._lessons
            : lessons // ignore: cast_nullable_to_non_nullable
                  as List<Lesson>,
        isExpanded: null == isExpanded
            ? _value.isExpanded
            : isExpanded // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseModuleImpl implements _CourseModule {
  const _$CourseModuleImpl({
    required this.id,
    required this.titleKey,
    required this.descriptionKey,
    required final List<Lesson> lessons,
    this.isExpanded = false,
  }) : _lessons = lessons;

  factory _$CourseModuleImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseModuleImplFromJson(json);

  @override
  final int id;
  @override
  final String titleKey;
  @override
  final String descriptionKey;
  final List<Lesson> _lessons;
  @override
  List<Lesson> get lessons {
    if (_lessons is EqualUnmodifiableListView) return _lessons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lessons);
  }

  @override
  @JsonKey()
  final bool isExpanded;

  @override
  String toString() {
    return 'CourseModule(id: $id, titleKey: $titleKey, descriptionKey: $descriptionKey, lessons: $lessons, isExpanded: $isExpanded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseModuleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.titleKey, titleKey) ||
                other.titleKey == titleKey) &&
            (identical(other.descriptionKey, descriptionKey) ||
                other.descriptionKey == descriptionKey) &&
            const DeepCollectionEquality().equals(other._lessons, _lessons) &&
            (identical(other.isExpanded, isExpanded) ||
                other.isExpanded == isExpanded));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    titleKey,
    descriptionKey,
    const DeepCollectionEquality().hash(_lessons),
    isExpanded,
  );

  /// Create a copy of CourseModule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseModuleImplCopyWith<_$CourseModuleImpl> get copyWith =>
      __$$CourseModuleImplCopyWithImpl<_$CourseModuleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseModuleImplToJson(this);
  }
}

abstract class _CourseModule implements CourseModule {
  const factory _CourseModule({
    required final int id,
    required final String titleKey,
    required final String descriptionKey,
    required final List<Lesson> lessons,
    final bool isExpanded,
  }) = _$CourseModuleImpl;

  factory _CourseModule.fromJson(Map<String, dynamic> json) =
      _$CourseModuleImpl.fromJson;

  @override
  int get id;
  @override
  String get titleKey;
  @override
  String get descriptionKey;
  @override
  List<Lesson> get lessons;
  @override
  bool get isExpanded;

  /// Create a copy of CourseModule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseModuleImplCopyWith<_$CourseModuleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
