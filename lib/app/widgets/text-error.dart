import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ranck_game_libras/app/theme/Theme.dart';

class TextError extends Text {
  TextError(String data, {super.key})
      : super(data,
            style: Get.theme.textTheme.bodyLarge
                ?.copyWith(color: SobratColors.error));
}
