import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'l10n/app_localizations.dart';

import 'providers/course_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CourseProvider(),
      child: Consumer<CourseProvider>(
        builder: (context, courseProvider, _) {
          return ScreenUtilInit(
            designSize: const Size(1920, 1080),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                title: 'Flutter Education Platform',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: const Color(0xFF0175C2),
                    brightness: Brightness.light,
                  ),
                  useMaterial3: true,
                  textTheme: GoogleFonts.interTextTheme(
                    ThemeData.light().textTheme,
                  ).copyWith(
                    displayLarge: GoogleFonts.inter(
                      fontSize: 57,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.25,
                    ),
                    displayMedium: GoogleFonts.inter(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                    displaySmall: GoogleFonts.inter(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                    headlineLarge: GoogleFonts.inter(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    headlineMedium: GoogleFonts.inter(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                    headlineSmall: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                    titleLarge: GoogleFonts.inter(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.15,
                    ),
                    titleMedium: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.15,
                    ),
                    titleSmall: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.1,
                    ),
                    bodyLarge: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 0.5,
                      height: 1.6,
                    ),
                    bodyMedium: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 0.25,
                      height: 1.5,
                    ),
                    bodySmall: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 0.4,
                      height: 1.4,
                    ),
                    labelLarge: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.1,
                    ),
                    labelMedium: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                    labelSmall: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                locale: courseProvider.currentLocale,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('ru'),
                  Locale('kk'),
                ],
                home: const HomeScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
