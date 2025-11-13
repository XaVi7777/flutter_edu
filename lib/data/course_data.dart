import '../models/lesson.dart';
import '../models/module.dart';
import '../services/lesson_content_service.dart';

class CourseData {
  static Future<List<CourseModule>> getCourseModules(String languageCode) async {
    return [
      CourseModule(
        id: 1,
        titleKey: 'module1',
        descriptionKey: '',
        lessons: await _getModule1Lessons(languageCode),
      ),
      CourseModule(
        id: 2,
        titleKey: 'module2',
        descriptionKey: '',
        lessons: _getModule2Lessons(),
      ),
    ];
  }

  static Future<List<Lesson>> _getModule1Lessons(String languageCode) async {
    return [
      _createPlaceholder(1, 'lesson1', 1),
      await LessonContentService.loadLesson(2, languageCode), // Git
      await LessonContentService.loadLesson(3, languageCode), // Dart
      _createPlaceholder(4, 'lesson4', 1),
      _createPlaceholder(5, 'lesson5', 1),
      _createPlaceholder(6, 'lesson6', 1),
    ];
  }

  static List<Lesson> _getModule2Lessons() {
    return [
      _createPlaceholder(7, 'lesson7', 2),
      _createPlaceholder(8, 'lesson8', 2),
      _createPlaceholder(9, 'lesson9', 2),
      _createPlaceholder(10, 'lesson10', 2),
      _createPlaceholder(11, 'lesson11', 2),
      _createPlaceholder(12, 'lesson12', 2),
    ];
  }

  static Lesson _createPlaceholder(int id, String titleKey, int moduleId) {
    return Lesson(
      id: id,
      titleKey: titleKey,
      moduleId: moduleId,
      isAvailable: false,
      pages: const [
        LessonPage(
          titleRu: 'Урок скоро будет доступен',
          titleKk: 'Сабақ жақында қолжетімді болады',
          contentRu: 'Этот урок находится в разработке.',
          contentKk: 'Бұл сабақ әзірлеу барысында.',
        ),
      ],
    );
  }
}
