import 'package:freezed_annotation/freezed_annotation.dart';
import 'lesson.dart';

part 'module.freezed.dart';
part 'module.g.dart';

@freezed
class CourseModule with _$CourseModule {
  const factory CourseModule({
    required int id,
    required String titleKey,
    required String descriptionKey,
    required List<Lesson> lessons,
    @Default(false) bool isExpanded,
  }) = _CourseModule;

  factory CourseModule.fromJson(Map<String, dynamic> json) =>
      _$CourseModuleFromJson(json);
}
