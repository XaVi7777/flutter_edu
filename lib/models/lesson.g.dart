// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonImpl _$$LessonImplFromJson(Map<String, dynamic> json) => _$LessonImpl(
  id: (json['id'] as num).toInt(),
  titleKey: json['titleKey'] as String,
  moduleId: (json['moduleId'] as num).toInt(),
  pages: (json['pages'] as List<dynamic>)
      .map((e) => LessonPage.fromJson(e as Map<String, dynamic>))
      .toList(),
  isAvailable: json['isAvailable'] as bool? ?? true,
);

Map<String, dynamic> _$$LessonImplToJson(_$LessonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titleKey': instance.titleKey,
      'moduleId': instance.moduleId,
      'pages': instance.pages,
      'isAvailable': instance.isAvailable,
    };

_$LessonPageImpl _$$LessonPageImplFromJson(Map<String, dynamic> json) =>
    _$LessonPageImpl(
      titleRu: json['titleRu'] as String,
      titleKk: json['titleKk'] as String,
      contentRu: json['contentRu'] as String,
      contentKk: json['contentKk'] as String,
      type:
          $enumDecodeNullable(_$LessonPageTypeEnumMap, json['type']) ??
          LessonPageType.text,
      codeSnippet: json['codeSnippet'] as String?,
      dartPadId: json['dartPadId'] as String?,
    );

Map<String, dynamic> _$$LessonPageImplToJson(_$LessonPageImpl instance) =>
    <String, dynamic>{
      'titleRu': instance.titleRu,
      'titleKk': instance.titleKk,
      'contentRu': instance.contentRu,
      'contentKk': instance.contentKk,
      'type': _$LessonPageTypeEnumMap[instance.type]!,
      'codeSnippet': instance.codeSnippet,
      'dartPadId': instance.dartPadId,
    };

const _$LessonPageTypeEnumMap = {
  LessonPageType.text: 'text',
  LessonPageType.code: 'code',
  LessonPageType.interactive: 'interactive',
  LessonPageType.video: 'video',
  LessonPageType.quiz: 'quiz',
};
