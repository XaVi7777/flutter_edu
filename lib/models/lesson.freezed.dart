// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Lesson _$LessonFromJson(Map<String, dynamic> json) {
  return _Lesson.fromJson(json);
}

/// @nodoc
mixin _$Lesson {
  int get id => throw _privateConstructorUsedError;
  String get titleKey => throw _privateConstructorUsedError;
  int get moduleId => throw _privateConstructorUsedError;
  List<LessonPage> get pages => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;

  /// Serializes this Lesson to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Lesson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LessonCopyWith<Lesson> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonCopyWith<$Res> {
  factory $LessonCopyWith(Lesson value, $Res Function(Lesson) then) =
      _$LessonCopyWithImpl<$Res, Lesson>;
  @useResult
  $Res call({
    int id,
    String titleKey,
    int moduleId,
    List<LessonPage> pages,
    bool isAvailable,
  });
}

/// @nodoc
class _$LessonCopyWithImpl<$Res, $Val extends Lesson>
    implements $LessonCopyWith<$Res> {
  _$LessonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Lesson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? titleKey = null,
    Object? moduleId = null,
    Object? pages = null,
    Object? isAvailable = null,
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
            moduleId: null == moduleId
                ? _value.moduleId
                : moduleId // ignore: cast_nullable_to_non_nullable
                      as int,
            pages: null == pages
                ? _value.pages
                : pages // ignore: cast_nullable_to_non_nullable
                      as List<LessonPage>,
            isAvailable: null == isAvailable
                ? _value.isAvailable
                : isAvailable // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LessonImplCopyWith<$Res> implements $LessonCopyWith<$Res> {
  factory _$$LessonImplCopyWith(
    _$LessonImpl value,
    $Res Function(_$LessonImpl) then,
  ) = __$$LessonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String titleKey,
    int moduleId,
    List<LessonPage> pages,
    bool isAvailable,
  });
}

/// @nodoc
class __$$LessonImplCopyWithImpl<$Res>
    extends _$LessonCopyWithImpl<$Res, _$LessonImpl>
    implements _$$LessonImplCopyWith<$Res> {
  __$$LessonImplCopyWithImpl(
    _$LessonImpl _value,
    $Res Function(_$LessonImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Lesson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? titleKey = null,
    Object? moduleId = null,
    Object? pages = null,
    Object? isAvailable = null,
  }) {
    return _then(
      _$LessonImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        titleKey: null == titleKey
            ? _value.titleKey
            : titleKey // ignore: cast_nullable_to_non_nullable
                  as String,
        moduleId: null == moduleId
            ? _value.moduleId
            : moduleId // ignore: cast_nullable_to_non_nullable
                  as int,
        pages: null == pages
            ? _value._pages
            : pages // ignore: cast_nullable_to_non_nullable
                  as List<LessonPage>,
        isAvailable: null == isAvailable
            ? _value.isAvailable
            : isAvailable // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonImpl implements _Lesson {
  const _$LessonImpl({
    required this.id,
    required this.titleKey,
    required this.moduleId,
    required final List<LessonPage> pages,
    this.isAvailable = true,
  }) : _pages = pages;

  factory _$LessonImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonImplFromJson(json);

  @override
  final int id;
  @override
  final String titleKey;
  @override
  final int moduleId;
  final List<LessonPage> _pages;
  @override
  List<LessonPage> get pages {
    if (_pages is EqualUnmodifiableListView) return _pages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pages);
  }

  @override
  @JsonKey()
  final bool isAvailable;

  @override
  String toString() {
    return 'Lesson(id: $id, titleKey: $titleKey, moduleId: $moduleId, pages: $pages, isAvailable: $isAvailable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.titleKey, titleKey) ||
                other.titleKey == titleKey) &&
            (identical(other.moduleId, moduleId) ||
                other.moduleId == moduleId) &&
            const DeepCollectionEquality().equals(other._pages, _pages) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    titleKey,
    moduleId,
    const DeepCollectionEquality().hash(_pages),
    isAvailable,
  );

  /// Create a copy of Lesson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonImplCopyWith<_$LessonImpl> get copyWith =>
      __$$LessonImplCopyWithImpl<_$LessonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonImplToJson(this);
  }
}

abstract class _Lesson implements Lesson {
  const factory _Lesson({
    required final int id,
    required final String titleKey,
    required final int moduleId,
    required final List<LessonPage> pages,
    final bool isAvailable,
  }) = _$LessonImpl;

  factory _Lesson.fromJson(Map<String, dynamic> json) = _$LessonImpl.fromJson;

  @override
  int get id;
  @override
  String get titleKey;
  @override
  int get moduleId;
  @override
  List<LessonPage> get pages;
  @override
  bool get isAvailable;

  /// Create a copy of Lesson
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonImplCopyWith<_$LessonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LessonPage _$LessonPageFromJson(Map<String, dynamic> json) {
  return _LessonPage.fromJson(json);
}

/// @nodoc
mixin _$LessonPage {
  String get titleRu => throw _privateConstructorUsedError;
  String get titleKk => throw _privateConstructorUsedError;
  String get contentRu => throw _privateConstructorUsedError;
  String get contentKk => throw _privateConstructorUsedError;
  LessonPageType get type => throw _privateConstructorUsedError;
  String? get codeSnippet => throw _privateConstructorUsedError;
  String? get dartPadId => throw _privateConstructorUsedError;

  /// Serializes this LessonPage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LessonPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LessonPageCopyWith<LessonPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonPageCopyWith<$Res> {
  factory $LessonPageCopyWith(
    LessonPage value,
    $Res Function(LessonPage) then,
  ) = _$LessonPageCopyWithImpl<$Res, LessonPage>;
  @useResult
  $Res call({
    String titleRu,
    String titleKk,
    String contentRu,
    String contentKk,
    LessonPageType type,
    String? codeSnippet,
    String? dartPadId,
  });
}

/// @nodoc
class _$LessonPageCopyWithImpl<$Res, $Val extends LessonPage>
    implements $LessonPageCopyWith<$Res> {
  _$LessonPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LessonPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? titleRu = null,
    Object? titleKk = null,
    Object? contentRu = null,
    Object? contentKk = null,
    Object? type = null,
    Object? codeSnippet = freezed,
    Object? dartPadId = freezed,
  }) {
    return _then(
      _value.copyWith(
            titleRu: null == titleRu
                ? _value.titleRu
                : titleRu // ignore: cast_nullable_to_non_nullable
                      as String,
            titleKk: null == titleKk
                ? _value.titleKk
                : titleKk // ignore: cast_nullable_to_non_nullable
                      as String,
            contentRu: null == contentRu
                ? _value.contentRu
                : contentRu // ignore: cast_nullable_to_non_nullable
                      as String,
            contentKk: null == contentKk
                ? _value.contentKk
                : contentKk // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as LessonPageType,
            codeSnippet: freezed == codeSnippet
                ? _value.codeSnippet
                : codeSnippet // ignore: cast_nullable_to_non_nullable
                      as String?,
            dartPadId: freezed == dartPadId
                ? _value.dartPadId
                : dartPadId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LessonPageImplCopyWith<$Res>
    implements $LessonPageCopyWith<$Res> {
  factory _$$LessonPageImplCopyWith(
    _$LessonPageImpl value,
    $Res Function(_$LessonPageImpl) then,
  ) = __$$LessonPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String titleRu,
    String titleKk,
    String contentRu,
    String contentKk,
    LessonPageType type,
    String? codeSnippet,
    String? dartPadId,
  });
}

/// @nodoc
class __$$LessonPageImplCopyWithImpl<$Res>
    extends _$LessonPageCopyWithImpl<$Res, _$LessonPageImpl>
    implements _$$LessonPageImplCopyWith<$Res> {
  __$$LessonPageImplCopyWithImpl(
    _$LessonPageImpl _value,
    $Res Function(_$LessonPageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LessonPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? titleRu = null,
    Object? titleKk = null,
    Object? contentRu = null,
    Object? contentKk = null,
    Object? type = null,
    Object? codeSnippet = freezed,
    Object? dartPadId = freezed,
  }) {
    return _then(
      _$LessonPageImpl(
        titleRu: null == titleRu
            ? _value.titleRu
            : titleRu // ignore: cast_nullable_to_non_nullable
                  as String,
        titleKk: null == titleKk
            ? _value.titleKk
            : titleKk // ignore: cast_nullable_to_non_nullable
                  as String,
        contentRu: null == contentRu
            ? _value.contentRu
            : contentRu // ignore: cast_nullable_to_non_nullable
                  as String,
        contentKk: null == contentKk
            ? _value.contentKk
            : contentKk // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as LessonPageType,
        codeSnippet: freezed == codeSnippet
            ? _value.codeSnippet
            : codeSnippet // ignore: cast_nullable_to_non_nullable
                  as String?,
        dartPadId: freezed == dartPadId
            ? _value.dartPadId
            : dartPadId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonPageImpl extends _LessonPage {
  const _$LessonPageImpl({
    required this.titleRu,
    required this.titleKk,
    required this.contentRu,
    required this.contentKk,
    this.type = LessonPageType.text,
    this.codeSnippet,
    this.dartPadId,
  }) : super._();

  factory _$LessonPageImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonPageImplFromJson(json);

  @override
  final String titleRu;
  @override
  final String titleKk;
  @override
  final String contentRu;
  @override
  final String contentKk;
  @override
  @JsonKey()
  final LessonPageType type;
  @override
  final String? codeSnippet;
  @override
  final String? dartPadId;

  @override
  String toString() {
    return 'LessonPage(titleRu: $titleRu, titleKk: $titleKk, contentRu: $contentRu, contentKk: $contentKk, type: $type, codeSnippet: $codeSnippet, dartPadId: $dartPadId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonPageImpl &&
            (identical(other.titleRu, titleRu) || other.titleRu == titleRu) &&
            (identical(other.titleKk, titleKk) || other.titleKk == titleKk) &&
            (identical(other.contentRu, contentRu) ||
                other.contentRu == contentRu) &&
            (identical(other.contentKk, contentKk) ||
                other.contentKk == contentKk) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.codeSnippet, codeSnippet) ||
                other.codeSnippet == codeSnippet) &&
            (identical(other.dartPadId, dartPadId) ||
                other.dartPadId == dartPadId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    titleRu,
    titleKk,
    contentRu,
    contentKk,
    type,
    codeSnippet,
    dartPadId,
  );

  /// Create a copy of LessonPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonPageImplCopyWith<_$LessonPageImpl> get copyWith =>
      __$$LessonPageImplCopyWithImpl<_$LessonPageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonPageImplToJson(this);
  }
}

abstract class _LessonPage extends LessonPage {
  const factory _LessonPage({
    required final String titleRu,
    required final String titleKk,
    required final String contentRu,
    required final String contentKk,
    final LessonPageType type,
    final String? codeSnippet,
    final String? dartPadId,
  }) = _$LessonPageImpl;
  const _LessonPage._() : super._();

  factory _LessonPage.fromJson(Map<String, dynamic> json) =
      _$LessonPageImpl.fromJson;

  @override
  String get titleRu;
  @override
  String get titleKk;
  @override
  String get contentRu;
  @override
  String get contentKk;
  @override
  LessonPageType get type;
  @override
  String? get codeSnippet;
  @override
  String? get dartPadId;

  /// Create a copy of LessonPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonPageImplCopyWith<_$LessonPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
