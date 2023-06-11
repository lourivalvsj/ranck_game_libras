import 'package:flutter/material.dart';
import 'package:ranck_game_libras/app/theme/Theme.dart';
import 'package:ranck_game_libras/utils/constants.dart';

class MyThemes {
  static final darkTheme = ThemeData.dark().copyWith();

  static final lightTheme = ThemeData.light().copyWith(
    primaryColorLight: GameColors.primaryLight,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: GameColors.primaryLight,
      elevation: defaultPadding,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: GameColors.primaryLight,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: GameColors.primaryLight,
    ),
    primaryIconTheme: const IconThemeData(
      color: GameColors.primaryLight,
    ),
    listTileTheme: const ListTileThemeData(
      dense: true,
      visualDensity: VisualDensity(),
      contentPadding: EdgeInsets.only(
        left: defaultPadding,
      ),
      style: ListTileStyle.list,
      textColor: GameColors.textLight,
      iconColor: GameColors.textLight,
      selectedColor: GameColors.primaryLight,
      selectedTileColor: GameColors.menuSelectedLight,
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
        textStyle:
            MaterialStateProperty.all(const TextStyle(color: GameColors.error)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          color: GameColors.primaryLight,
          fontWeight: FontWeight.bold,
        ),
      ),
    )),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        mouseCursor: MaterialStateProperty.all(MouseCursor.uncontrolled),
        textStyle:
            MaterialStateProperty.all(const TextStyle(color: GameColors.white)),
        backgroundColor: MaterialStateProperty.all(GameColors.primaryDark),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      filled: true,
      fillColor: GameColors.bgColorScreenLight,
      hintStyle: const TextStyle(
        color: GameColors.textDark,
        fontSize: fontSizeInputs,
      ),
      focusColor: GameColors.error,
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(
          color: GameColors.error,
          width: 1.0,
          style: BorderStyle.solid,
        ),
      ),
      counterStyle: const TextStyle(fontSize: fontSizeInputs),
      contentPadding: const EdgeInsets.all(contentPaddingTF),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(
          color: GameColors.border,
          width: 1.0,
          style: BorderStyle.solid,
        ),
      ),
      prefixStyle: const TextStyle(
        decorationColor: GameColors.primaryLight,
      ),
      prefixIconColor: GameColors.primaryLight,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(
          color: GameColors.primaryLight,
          width: 1.0,
          style: BorderStyle.solid,
        ),
      ),
      iconColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.focused)) {
          return GameColors.primaryLight;
        }
        if (states.contains(MaterialState.error)) {
          return Colors.deepOrange;
        }
        return Colors.grey;
      }),
    ),
    primaryColor: GameColors.primaryLight,
    tooltipTheme: null,
    scaffoldBackgroundColor: GameColors.white,
    drawerTheme: const DrawerThemeData(
      backgroundColor: GameColors.white,
      scrimColor: null,
      elevation: null,
      shape: null,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: fontSizeInputs,
        color: GameColors.textLight,
        overflow: TextOverflow.ellipsis,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: GameColors.textLight,
        overflow: TextOverflow.ellipsis,
      ),
      titleLarge: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: GameColors.textLight,
      ),
    ),
    iconTheme: const IconThemeData(
      color: GameColors.textLight,
      size: 20.0,
    ),
  );
}
