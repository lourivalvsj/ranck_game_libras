import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ranck_game_libras/app/theme/Theme.dart';

class TextError extends Text {
  TextError(String data)
      : super(data,
            style: Get.theme.textTheme.bodyText1
                ?.copyWith(color: SobratColors.error));
}
