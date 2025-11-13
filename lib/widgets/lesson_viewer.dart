import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';

import '../providers/course_provider.dart';
import '../models/lesson.dart';
import 'dartpad_embed.dart';

class LessonViewer extends StatefulWidget {
  const LessonViewer({super.key});

  @override
  State<LessonViewer> createState() => _LessonViewerState();
}

class _LessonViewerState extends State<LessonViewer> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final courseProvider = context.watch<CourseProvider>();
    final lesson = courseProvider.currentLesson;

    if (lesson == null) {
      return const SizedBox.shrink();
    }

    // Sync page controller with provider
    if (_pageController.hasClients &&
        _pageController.page?.round() != courseProvider.currentPageIndex) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        if (_pageController.hasClients) {
          _pageController.jumpToPage(courseProvider.currentPageIndex);
        }
      });
    }

    return Column(
      children: [
        // Page indicator
        Container(
          padding: EdgeInsets.all(16.w),
          color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '${courseProvider.currentPageIndex + 1} / ${lesson.pages.length}',
                  style: TextStyle(fontSize: 14.sp),
                ),
              ),
              ...List.generate(
                lesson.pages.length,
                (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  width: 8.w,
                  height: 8.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == courseProvider.currentPageIndex
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey.shade300,
                  ),
                ),
              ),
            ],
          ),
        ),

        // PageView
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: lesson.pages.length,
            onPageChanged: (index) {
              courseProvider.goToPage(index);
            },
            itemBuilder: (context, index) {
              final page = lesson.pages[index];
              return _PageContent(page: page);
            },
          ),
        ),

        // Navigation buttons
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                onPressed: courseProvider.hasPreviousPage
                    ? () {
                        courseProvider.previousPage();
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    : null,
                icon: const Icon(Icons.arrow_back),
                label: Text(l10n.previous),
              ),
              ElevatedButton.icon(
                onPressed: courseProvider.hasNextPage
                    ? () {
                        courseProvider.nextPage();
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    : null,
                icon: const Icon(Icons.arrow_forward),
                label: Text(l10n.next),
                iconAlignment: IconAlignment.end,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PageContent extends StatelessWidget {
  final LessonPage page;

  const _PageContent({required this.page});

  @override
  Widget build(BuildContext context) {
    final courseProvider = context.read<CourseProvider>();
    final languageCode = courseProvider.currentLocale.languageCode;
    final lesson = courseProvider.currentLesson!;

    // Handle TOC page type
    if (page.type == LessonPageType.text && page.getContent(languageCode) == 'toc') {
      return _TableOfContents(lesson: lesson, languageCode: languageCode);
    }

    // Check if this is a cheatsheet page (contains "Шпаргалка" or "шпаргалка")
    final isCheatsheet = page.getTitle(languageCode).toLowerCase().contains('шпаргалка');

    // Check if this is an interactive page with code
    final isInteractive = page.type == LessonPageType.interactive && page.codeSnippet != null;

    // For interactive pages, use side-by-side layout
    if (isInteractive) {
      return SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 32.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primaryContainer,
                    Theme.of(context).colorScheme.secondaryContainer,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                page.getTitle(languageCode),
                style: TextStyle(
                  fontSize: 42.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  height: 1.3,
                ),
              ),
            ),
            SizedBox(height: 32.h),

            // Side-by-side layout: Theory on left, Code on right
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left side: Theory
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(24.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      page.getContent(languageCode),
                      style: TextStyle(
                        fontSize: 20.sp,
                        height: 1.8,
                        color: Colors.grey.shade800,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 32.w),

                // Right side: Code example
                Expanded(
                  flex: 1,
                  child: DartPadEmbed(
                    initialCode: page.codeSnippet!,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    // Regular layout for non-interactive pages
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 32.h),
      child: Container(
        constraints: BoxConstraints(maxWidth: isCheatsheet ? double.infinity : 1200.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title with gradient background
            Container(
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primaryContainer,
                    Theme.of(context).colorScheme.secondaryContainer,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                page.getTitle(languageCode),
                style: TextStyle(
                  fontSize: 42.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  height: 1.3,
                ),
              ),
            ),
            SizedBox(height: 32.h),

            // Content with better styling
            Container(
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                page.getContent(languageCode),
                style: TextStyle(
                  fontSize: 20.sp,
                  height: 1.8,
                  color: Colors.grey.shade800,
                  letterSpacing: 0.3,
                ),
              ),
            ),
            SizedBox(height: 32.h),

            // Code snippet for non-interactive pages
            if (page.codeSnippet != null)
              _CodeBlock(code: page.codeSnippet!),
          ],
        ),
      ),
    );
  }
}

class _CodeBlock extends StatefulWidget {
  final String code;

  const _CodeBlock({required this.code});

  @override
  State<_CodeBlock> createState() => _CodeBlockState();
}

class _CodeBlockState extends State<_CodeBlock> {
  bool _copied = false;

  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: widget.code));
    setState(() => _copied = true);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => _copied = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(24.w),
            child: SelectableText(
              widget.code,
              style: TextStyle(
                fontSize: 18.sp,
                fontFamily: 'monospace',
                height: 1.6,
                color: const Color(0xFFD4D4D4),
                letterSpacing: 0.5,
              ),
            ),
          ),
          Positioned(
            top: 12.h,
            right: 12.w,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: _copyToClipboard,
                borderRadius: BorderRadius.circular(8.r),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: _copied
                        ? Colors.green.withOpacity(0.2)
                        : Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: _copied ? Colors.green : Colors.white.withOpacity(0.3),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _copied ? Icons.check : Icons.copy,
                        size: 16.sp,
                        color: _copied ? Colors.green : Colors.white,
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        _copied ? 'Скопировано!' : 'Копировать',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: _copied ? Colors.green : Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TableOfContents extends StatelessWidget {
  final Lesson lesson;
  final String languageCode;

  const _TableOfContents({
    required this.lesson,
    required this.languageCode,
  });

  @override
  Widget build(BuildContext context) {
    final courseProvider = context.read<CourseProvider>();

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 32.h),
      child: Container(
        constraints: BoxConstraints(maxWidth: 1200.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Container(
              padding: EdgeInsets.all(32.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primaryContainer,
                    Theme.of(context).colorScheme.secondaryContainer,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '📚 ${lesson.titleKey}',
                    style: TextStyle(
                      fontSize: 48.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      height: 1.2,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    languageCode == 'ru'
                        ? 'Выберите тему для изучения:'
                        : 'Оқу үшін тақырыпты таңдаңыз:',
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.8),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),

            // Table of contents with buttons
            ...List.generate(lesson.pages.length, (index) {
              if (index == 0) return const SizedBox.shrink(); // Skip TOC itself

              final page = lesson.pages[index];
              final pageNumber = index;

              return Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => courseProvider.goToPage(pageNumber),
                    borderRadius: BorderRadius.circular(16.r),
                    child: Container(
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          // Number badge
                          Container(
                            width: 48.w,
                            height: 48.w,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Theme.of(context).colorScheme.primary,
                                  Theme.of(context).colorScheme.secondary,
                                ],
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '$pageNumber',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20.w),

                          // Title
                          Expanded(
                            child: Text(
                              page.getTitle(languageCode),
                              style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade800,
                                height: 1.4,
                              ),
                            ),
                          ),

                          // Arrow icon
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 20.sp,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
