import 'package:brindavan_student/theme/shared_preference.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
// ignore: depend_on_referenced_packages
import 'package:velocity_x/velocity_x.dart' as velx;

class DarkThemeProvider with ChangeNotifier {
  DarkThemePrefrence darkThemePrefrence = DarkThemePrefrence();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePrefrence.setDarkTheme(value);
    notifyListeners();
  }
}

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    const int blackPrimaryValue = 0xFF0056D2;

    const MaterialColor primaryColor = MaterialColor(
      blackPrimaryValue,
      <int, Color>{
        50: Color(0xFF000000),
        100: Color(0xFF000000),
        200: Color(0xFF000000),
        300: Color(0xFF000000),
        400: Color(0xFF000000),
        500: Color(blackPrimaryValue),
        600: Color(0xFF000000),
        700: Color(0xFF000000),
        800: Color(0xFF000000),
        900: Color(0xFF000000),
      },
    );
    return ThemeData(
        extensions: <ThemeExtension<dynamic>>[
          MyColors(
            brandColor:
                isDarkTheme ? const Color(0xFF1E88E5) : velx.Vx.amber300,
            danger: const Color(0xFFE53935),
            backgroundSecondary: const Color(0xFFEDF0FF),
            textColor:
                isDarkTheme ? Colors.white : velx.Vx.hexToColor("#333333"),
          ),
        ],
        fontFamily: GoogleFonts.montserrat().fontFamily,
        primaryColor: velx.Vx.hexToColor("#0056D2"),
        backgroundColor: isDarkTheme
            ? velx.Vx.hexToColor('#1c202a')
            : velx.Vx.hexToColor('#FFFFFF'),
        cardColor: isDarkTheme ? velx.Vx.hexToColor('#272c39') : Colors.white,
        shadowColor: isDarkTheme
            ? Colors.black.withAlpha(50)
            : Colors.black.withAlpha(50),
        canvasColor: isDarkTheme
            ? velx.Vx.hexToColor('#242936')
            : velx.Vx.hexToColor('#F5F5F5'),
        hintColor: isDarkTheme ? Colors.white38 : Colors.black45,
        disabledColor: Colors.grey,
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme: isDarkTheme
                ? const ColorScheme.dark()
                : const ColorScheme.light()),
        appBarTheme: AppBarTheme(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            foregroundColor: isDarkTheme ? Colors.white : Colors.black),
        // colorScheme: ColorScheme.fromSwatch(primarySwatch: primaryColor)
        //     .copyWith(secondary: isDarkTheme ? Colors.black : Colors.white),
        colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: velx.Vx.hexToColor("#0056D2"),
            onPrimary: velx.Vx.hexToColor("#FFFFFF"),
            primaryContainer: isDarkTheme
                ? velx.Vx.hexToColor("#0040A1")
                : velx.Vx.hexToColor("#DAE2FF"),
            onPrimaryContainer: isDarkTheme
                ? velx.Vx.hexToColor("#DAE2FF")
                : velx.Vx.hexToColor("#001847"),
            secondary: isDarkTheme
                ? velx.Vx.hexToColor("#C0C6DD")
                : velx.Vx.hexToColor("#585E71"),
            onSecondary: velx.Vx.hexToColor("#ffffff"),
            error: isDarkTheme
                ? velx.Vx.hexToColor("#FFB4AB")
                : velx.Vx.hexToColor("#BA1A1A"),
            onError: isDarkTheme
                ? velx.Vx.hexToColor("#ffffff")
                : velx.Vx.hexToColor("#690005"),
            background: isDarkTheme
                ? velx.Vx.hexToColor("#1B1B1F")
                : velx.Vx.hexToColor("#F4F4F4"),
            onBackground: isDarkTheme
                ? velx.Vx.hexToColor("#E4E2E6")
                : velx.Vx.hexToColor("#1B1B1F"),
            surface: isDarkTheme
                ? velx.Vx.hexToColor("#1B1B1F")
                : velx.Vx.hexToColor("#FEFBFF"),
            onSurface: isDarkTheme
                ? velx.Vx.hexToColor("#FEFBFF")
                : velx.Vx.hexToColor("#1B1B1F")));
  }
}

@immutable
class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    required this.brandColor,
    required this.danger,
    required this.backgroundSecondary,
    required this.textColor,
  });

  final Color? brandColor;
  final Color? danger;
  final Color? backgroundSecondary;
  final Color? textColor;

  @override
  MyColors copyWith({Color? brandColor, Color? danger}) {
    return MyColors(
      brandColor: brandColor ?? this.brandColor,
      danger: danger ?? this.danger,
      backgroundSecondary: backgroundSecondary ?? backgroundSecondary,
      textColor: textColor ?? textColor,
    );
  }

  @override
  MyColors lerp(ThemeExtension<MyColors>? other, double t) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
      brandColor: Color.lerp(brandColor, other.brandColor, t),
      danger: Color.lerp(danger, other.danger, t),
      backgroundSecondary:
          Color.lerp(backgroundSecondary, other.backgroundSecondary, t),
      textColor: Color.lerp(textColor, other.textColor, t),
    );
  }
}
