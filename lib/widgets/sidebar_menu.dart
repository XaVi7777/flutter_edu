import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';

import '../providers/course_provider.dart';
import '../models/module.dart';
import '../models/lesson.dart';

class SidebarMenu extends StatelessWidget {
  const SidebarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final courseProvider = context.watch<CourseProvider>();

    return Container(
      color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Text(
              l10n.modules,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          ...courseProvider.modules.map((module) => _ModuleTile(module: module)),
        ],
      ),
    );
  }
}

class _ModuleTile extends StatelessWidget {
  final CourseModule module;

  const _ModuleTile({required this.module});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final courseProvider = context.watch<CourseProvider>();

    final titleMap = {
      'module1': l10n.module1,
      'module2': l10n.module2,
    };

    return ExpansionTile(
      title: Text(
        titleMap[module.titleKey] ?? module.titleKey,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      initiallyExpanded: module.isExpanded,
      onExpansionChanged: (expanded) {
        courseProvider.toggleModule(module.id);
      },
      children: module.lessons.map((lesson) {
        return _LessonTile(lesson: lesson);
      }).toList(),
    );
  }
}

class _LessonTile extends StatelessWidget {
  final Lesson lesson;

  const _LessonTile({required this.lesson});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final courseProvider = context.watch<CourseProvider>();

    final titleMap = {
      'lesson1': l10n.lesson1,
      'lesson2': l10n.lesson2,
      'lesson3': l10n.lesson3,
      'lesson4': l10n.lesson4,
      'lesson5': l10n.lesson5,
      'lesson6': l10n.lesson6,
      'lesson7': l10n.lesson7,
      'lesson8': l10n.lesson8,
      'lesson9': l10n.lesson9,
      'lesson10': l10n.lesson10,
      'lesson11': l10n.lesson11,
      'lesson12': l10n.lesson12,
    };

    final isSelected = courseProvider.currentLesson?.id == lesson.id;

    return ListTile(
      contentPadding: EdgeInsets.only(left: 48.w, right: 16.w),
      title: Text(
        titleMap[lesson.titleKey] ?? lesson.titleKey,
        style: TextStyle(
          fontSize: 14.sp,
          color: lesson.isAvailable ? null : Colors.grey,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      enabled: lesson.isAvailable,
      onTap: lesson.isAvailable
          ? () {
              courseProvider.selectLesson(lesson);
              if (MediaQuery.of(context).size.width <= 800) {
                Navigator.of(context).pop();
              }
            }
          : null,
      trailing: lesson.isAvailable
          ? null
          : Icon(Icons.lock, size: 16.sp, color: Colors.grey),
    );
  }
}
