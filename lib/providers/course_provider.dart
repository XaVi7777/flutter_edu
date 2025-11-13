import 'package:flutter/material.dart';
import '../models/module.dart';
import '../models/lesson.dart';
import '../data/course_data.dart';

class CourseProvider with ChangeNotifier {
  List<CourseModule> _modules = [];
  Lesson? _currentLesson;
  int _currentPageIndex = 0;
  Locale _currentLocale = const Locale('ru', '');

  List<CourseModule> get modules => _modules;
  Lesson? get currentLesson => _currentLesson;
  int get currentPageIndex => _currentPageIndex;
  Locale get currentLocale => _currentLocale;

  CourseProvider() {
    _loadCourse();
  }

  Future<void> _loadCourse() async {
    _modules = await CourseData.getCourseModules(_currentLocale.languageCode);
    notifyListeners();
  }

  void toggleModule(int moduleId) {
    _modules = _modules.map((module) {
      if (module.id == moduleId) {
        return module.copyWith(isExpanded: !module.isExpanded);
      }
      return module;
    }).toList();
    notifyListeners();
  }

  void selectLesson(Lesson lesson) {
    _currentLesson = lesson;
    _currentPageIndex = 0;
    notifyListeners();
  }

  void nextPage() {
    if (_currentLesson != null &&
        _currentPageIndex < _currentLesson!.pages.length - 1) {
      _currentPageIndex++;
      notifyListeners();
    }
  }

  void previousPage() {
    if (_currentPageIndex > 0) {
      _currentPageIndex--;
      notifyListeners();
    }
  }

  void goToPage(int index) {
    if (_currentLesson != null &&
        index >= 0 &&
        index < _currentLesson!.pages.length &&
        _currentPageIndex != index) {  // Only update if index changed
      _currentPageIndex = index;
      notifyListeners();
    }
  }

  Future<void> changeLocale(Locale locale) async {
    _currentLocale = locale;
    await _loadCourse(); // Reload content in new language
    notifyListeners();
  }

  bool get hasNextPage {
    return _currentLesson != null &&
        _currentPageIndex < _currentLesson!.pages.length - 1;
  }

  bool get hasPreviousPage {
    return _currentPageIndex > 0;
  }
}
