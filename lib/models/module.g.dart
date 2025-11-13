// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseModuleImpl _$$CourseModuleImplFromJson(Map<String, dynamic> json) =>
    _$CourseModuleImpl(
      id: (json['id'] as num).toInt(),
      titleKey: json['titleKey'] as String,
      descriptionKey: json['descriptionKey'] as String,
      lessons: (json['lessons'] as List<dynamic>)
          .map((e) => Lesson.fromJson(e as Map<String, dynamic>))
          .toList(),
      isExpanded: json['isExpanded'] as bool? ?? false,
    );

Map<String, dynamic> _$$CourseModuleImplToJson(_$CourseModuleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titleKey': instance.titleKey,
      'descriptionKey': instance.descriptionKey,
      'lessons': instance.lessons,
      'isExpanded': instance.isExpanded,
    };
