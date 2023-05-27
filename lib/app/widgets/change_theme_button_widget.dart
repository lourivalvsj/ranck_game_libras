import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ranck_game_libras/app/theme/my_theme.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: Get.isDarkMode,
      onChanged: (value) {
        Get.changeTheme(
          Get.isDarkMode ? MyThemes.lightTheme : MyThemes.darkTheme,
        );
      },
      activeColor: Theme.of(context).primaryColor,
    );
  }
}
