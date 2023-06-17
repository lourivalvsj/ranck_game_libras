import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ranck_game_libras/utils/constants.dart';

class TitleBody extends Text {
  TitleBody(
    String data, {
    super.key,
    Color? color,
    TextAlign? textAlign,
    bool? softWrap,
    TextStyle? style,
    double? fontSize,
    TextOverflow? overflow,
    FontWeight? fontWeight,
  }) : super(
          data,
          style: style ??
              Get.theme.textTheme.bodyMedium?.copyWith(
                color: color,
                fontWeight: fontWeight,
                fontSize: fontSize ?? fontSizeInputs,
              ),
          textAlign: textAlign,
          softWrap: softWrap,
          overflow: overflow,
        );
}
