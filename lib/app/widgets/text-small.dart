import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ranck_game_libras/app/theme/Theme.dart';

class TextSmall extends Text {
  TextSmall(String data, {super.key, Color? color})
      : super(
          data,
          style: Get.theme.textTheme.bodySmall?.copyWith(
            color: color ??
                (Get.isDarkMode
                    ? SobratColors.textDark
                    : SobratColors.textLight),
            fontSize: 10.0,
          ),
        );
}
