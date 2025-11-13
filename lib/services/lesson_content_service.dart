import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/lesson.dart';

class LessonContentService {
  static Future<Lesson> loadLesson(int lessonId, String languageCode) async {
    final jsonString = await rootBundle.loadString(
      'assets/lessons/lesson${lessonId}_$languageCode.json',
    );

    final jsonData = json.decode(jsonString) as Map<String, dynamic>;

    return _parseLesson(jsonData);
  }

  static Lesson _parseLesson(Map<String, dynamic> json) {
    final pages = (json['pages'] as List)
        .map((pageJson) => _parsePage(pageJson as Map<String, dynamic>))
        .toList();

    return Lesson(
      id: json['lessonId'] as int,
      titleKey: 'lesson${json['lessonId']}',
      moduleId: json['lessonId'] <= 6 ? 1 : 2,
      pages: pages,
      isAvailable: true,
    );
  }

  static LessonPage _parsePage(Map<String, dynamic> json) {
    final typeString = json['type'] as String? ?? 'text';
    final type = _parsePageType(typeString);

    return LessonPage(
      titleRu: json['title'] as String,
      titleKk: json['title'] as String, // Уже локализовано в JSON
      contentRu: json['content'] as String,
      contentKk: json['content'] as String, // Уже локализовано в JSON
      type: type,
      codeSnippet: json['codeSnippet'] as String?,
      dartPadId: json['dartPadId'] as String?,
    );
  }

  static LessonPageType _parsePageType(String typeString) {
    switch (typeString) {
      case 'text':
        return LessonPageType.text;
      case 'code':
        return LessonPageType.code;
      case 'interactive':
        return LessonPageType.interactive;
      case 'video':
        return LessonPageType.video;
      case 'quiz':
        return LessonPageType.quiz;
      default:
        return LessonPageType.text;
    }
  }
}
