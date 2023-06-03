import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleBody extends Text {
  TitleBody(
    String data, {super.key, 
    Color? color,
    TextAlign? textAlign,
    bool? softWrap,
    TextStyle? style,
    TextOverflow? overflow,
    FontWeight? fontWeight,
  }) : super(
          data,
          style: style ??
              Get.theme.textTheme.bodyMedium?.copyWith(
                color: color,
                fontWeight: fontWeight,
              ),
          textAlign: textAlign,
          softWrap: softWrap,
          overflow: overflow,
        );
}
