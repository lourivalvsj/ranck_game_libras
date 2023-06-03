import 'package:flutter/material.dart';
import 'package:ranck_game_libras/app/theme/Theme.dart';
import 'package:ranck_game_libras/utils/constants.dart';

class MyThemes {
  static final darkTheme = ThemeData.dark().copyWith();

  static final lightTheme = ThemeData.light().copyWith(
    primaryColorLight: SobratColors.primaryLight,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: SobratColors.primaryLight,
      elevation: defaultPadding,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: SobratColors.primaryLight,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: SobratColors.primaryLight,
    ),
    primaryIconTheme: const IconThemeData(
      color: SobratColors.primaryLight,
    ),
    listTileTheme: const ListTileThemeData(
      dense: true,
      visualDensity: VisualDensity(),
      contentPadding: EdgeInsets.only(
        left: defaultPadding,
      ),
      style: ListTileStyle.list,
      textColor: SobratColors.textLight,
      iconColor: SobratColors.textLight,
      selectedColor: SobratColors.primaryLight,
      selectedTileColor: SobratColors.menuSelectedLight,
      mouseCursor: MaterialStateMouseCursor.clickable,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
          // bottomRight: Radius.circular(5),
          // bottomLeft: Radius.circular(5),
        ),
      ),
      // tileColor: SobratColors.primaryLight,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      // Botão Cancelar
      style: ButtonStyle(
        mouseCursor: MaterialStateProperty.all(MouseCursor.defer),
        textStyle: MaterialStateProperty.all(
            const TextStyle(color: SobratColors.error)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          color: SobratColors.primaryLight,
          fontWeight: FontWeight.bold,
        ),
      ),
    )),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        mouseCursor: MaterialStateProperty.all(MouseCursor.uncontrolled),
        textStyle: MaterialStateProperty.all(
            const TextStyle(color: SobratColors.white)),
        backgroundColor: MaterialStateProperty.all(SobratColors.primaryDark),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      filled: true,
      fillColor: SobratColors.bgColorScreenLight,
      hintStyle: const TextStyle(
        color: SobratColors.textDark,
        fontSize: fontSizeInputs,
      ),
      focusColor: SobratColors.error,
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(
          color: SobratColors.error,
          width: 1.0,
          style: BorderStyle.solid,
        ),
      ),
      counterStyle: const TextStyle(fontSize: fontSizeInputs),
      contentPadding: const EdgeInsets.all(contentPaddingTF),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(
          color: SobratColors.border,
          width: 1.0,
          style: BorderStyle.solid,
        ),
      ),
      prefixStyle: const TextStyle(
        decorationColor: SobratColors.primaryLight,
      ),
      prefixIconColor: SobratColors.primaryLight,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(
          color: SobratColors.primaryLight,
          width: 1.0,
          style: BorderStyle.solid,
        ),
      ),
      iconColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.focused)) {
          return SobratColors.primaryLight;
        }
        if (states.contains(MaterialState.error)) {
          return Colors.deepOrange;
        }
        return Colors.grey;
      }),
    ),
    primaryColor: SobratColors.primaryLight,
    tooltipTheme: null,
    scaffoldBackgroundColor: SobratColors.bgColorScreenLight,
    drawerTheme: const DrawerThemeData(
      backgroundColor: SobratColors.white,
      scrimColor: null,
      elevation: null,
      shape: null,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: fontSizeInputs,
        color: SobratColors.textLight,
        overflow: TextOverflow.ellipsis,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: SobratColors.textLight,
        overflow: TextOverflow.ellipsis,
      ),
      titleLarge: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: SobratColors.textLight,
      ),
    ),
    iconTheme: const IconThemeData(
      color: SobratColors.textLight,
      size: 20.0,
    ),
  );
}
