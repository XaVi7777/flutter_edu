import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';

import '../providers/course_provider.dart';
import '../widgets/sidebar_menu.dart';
import '../widgets/lesson_viewer.dart';
import '../widgets/language_switcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final courseProvider = context.watch<CourseProvider>();
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.appTitle,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          LanguageSwitcher(),
          SizedBox(width: 16),
        ],
        elevation: 2,
      ),
      drawer: isDesktop ? null : const Drawer(child: SidebarMenu()),
      body: Row(
        children: [
          if (isDesktop)
            SizedBox(
              width: 300.w,
              child: const SidebarMenu(),
            ),
          Expanded(
            child: courseProvider.currentLesson == null
                ? _buildWelcomeScreen(context, l10n)
                : const LessonViewer(),
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeScreen(BuildContext context, AppLocalizations l10n) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.school,
            size: 100.sp,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
          ),
          SizedBox(height: 24.h),
          Text(
            l10n.appTitle,
            style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),
          Text(
            l10n.comingSoon,
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
