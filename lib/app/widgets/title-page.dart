import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitlePage extends Text {
  TitlePage(
    String data, {
    Color? color,
    TextAlign? textAlign,
    bool? softWrap,
    TextOverflow? overflow,
    double? fontSize,
  }) : super(
          data,
          style: Get.theme.textTheme.headline6?.copyWith(
            color: color,
            fontSize: fontSize,
          ),
          textAlign: textAlign,
          softWrap: softWrap,
          overflow: overflow ?? TextOverflow.visible,
        );
}
