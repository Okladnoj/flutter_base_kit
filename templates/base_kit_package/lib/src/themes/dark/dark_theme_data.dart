part of '../app_theme.dart';

ThemeData _darkThemeData({String? fontFamily}) {
  final design = CustomDesigns.dark();
  final baseDesign = BaseDesigns.instance;
  final colorScheme = ColorScheme.dark(
    brightness: Brightness.dark,
    primary: design.primary,
    secondary: design.secondary,
  );
  final styleFrom = ElevatedButton.styleFrom(
    backgroundColor: design.surface,
    foregroundColor: design.onSurface,
  );

  return ThemeData(
    useMaterial3: true,
    primaryColor: design.background,
    appBarTheme: AppBarTheme(
      elevation: 0,
      iconTheme: IconThemeData(
        color: design.onSurface,
        size: 24,
      ),
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontFamily: fontFamily,
        fontSize: 20,
        color: design.onSurface,
      ),
      backgroundColor: design.background,
    ),
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        elevation: 4,
        foregroundColor: design.onSurface,
        backgroundColor: colorScheme.surface,
        side: BorderSide(
          color: colorScheme.surface,
          width: 0,
        ),
        shadowColor: colorScheme.surface,
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: colorScheme.surface,
            width: 0,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
        fontFamily: fontFamily,
        fontSize: 96,
        letterSpacing: -1.5,
        color: design.textPrimary,
      ),
      displayMedium: TextStyle(
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
        fontFamily: fontFamily,
        fontSize: 60,
        letterSpacing: -0.5,
        color: design.textPrimary,
      ),
      displaySmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontFamily: fontFamily,
        fontSize: 48,
        letterSpacing: 0,
        color: design.textPrimary,
      ),
      headlineMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontFamily: fontFamily,
        fontSize: 28,
        color: design.textPrimary,
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontFamily: fontFamily,
        fontSize: 24,
        color: design.textPrimary,
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        fontFamily: fontFamily,
        fontSize: 18,
        color: design.textPrimary,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontFamily: fontFamily,
        fontSize: 16,
        color: design.textPrimary,
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontFamily: fontFamily,
        fontSize: 14,
        color: design.textPrimary,
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontFamily: fontFamily,
        fontSize: 16,
        letterSpacing: 0.5,
        color: design.textPrimary,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontFamily: fontFamily,
        fontSize: 14,
        letterSpacing: 0.25,
        color: design.textPrimary,
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontFamily: fontFamily,
        fontSize: 12,
        letterSpacing: 0.4,
        color: design.textPrimary,
      ),
      labelLarge: TextStyle(
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontFamily: fontFamily,
        fontSize: 14,
        letterSpacing: 1.25,
        color: design.textPrimary,
      ),
      labelMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontFamily: fontFamily,
        fontSize: 12,
        letterSpacing: 1.5,
        color: design.textPrimary,
      ),
      labelSmall: TextStyle(
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontFamily: fontFamily,
        fontSize: 10,
        letterSpacing: 1.5,
        color: design.textPrimary,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: design.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(200),
      ),
    ),
    tabBarTheme: TabBarThemeData(
      labelPadding: const EdgeInsets.symmetric(vertical: 8),
      labelStyle: TextStyle(
        color: design.primary,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      unselectedLabelStyle: TextStyle(
        color: design.primary,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
    ),
    scaffoldBackgroundColor: design.background,
    primaryColorLight: design.primary,
    dividerColor: design.primary,
    canvasColor: design.primary,
    textButtonTheme: TextButtonThemeData(style: styleFrom),
    elevatedButtonTheme: ElevatedButtonThemeData(style: styleFrom),
    colorScheme: colorScheme.copyWith(
      surface: design.primary,
    ),
    extensions: [
      design,
      baseDesign,
    ],
  );
}
