import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson.freezed.dart';
part 'lesson.g.dart';

@freezed
class Lesson with _$Lesson {
  const factory Lesson({
    required int id,
    required String titleKey,
    required int moduleId,
    required List<LessonPage> pages,
    @Default(true) bool isAvailable,
  }) = _Lesson;

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);
}

@freezed
class LessonPage with _$LessonPage {
  const LessonPage._();

  const factory LessonPage({
    required String titleRu,
    required String titleKk,
    required String contentRu,
    required String contentKk,
    @Default(LessonPageType.text) LessonPageType type,
    String? codeSnippet,
    String? dartPadId,
  }) = _LessonPage;

  factory LessonPage.fromJson(Map<String, dynamic> json) =>
      _$LessonPageFromJson(json);

  String getTitle(String languageCode) {
    return languageCode == 'kk' ? titleKk : titleRu;
  }

  String getContent(String languageCode) {
    return languageCode == 'kk' ? contentKk : contentRu;
  }
}

enum LessonPageType {
  text,
  code,
  interactive,
  video,
  quiz,
}
