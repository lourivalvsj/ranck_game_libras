import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ranck_game_libras/utils/constants.dart';

class TextBody extends Text {
  TextBody(
    String data, {
    super.key,
    Color? color,
    TextAlign? textAlign,
    bool? softWrap,
    TextOverflow? overflow,
    TextStyle? style,
    FontWeight? fontWeight,
    bool lineThrough = true,
    double? fontSize,
  }) : super(
          data,
          style: style ??
              Get.theme.textTheme.bodyLarge?.copyWith(
                color: color,
                fontWeight: fontWeight ?? FontWeight.normal,
                decoration: !lineThrough ? TextDecoration.lineThrough : null,
                fontSize: fontSize ?? fontSizeInputs,
              ),
          textAlign: textAlign,
          softWrap: softWrap,
          overflow: overflow ?? TextOverflow.visible,
        );
}
