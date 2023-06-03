import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ranck_game_libras/app/theme/theme.dart';
import 'package:ranck_game_libras/app/widgets/text-body.dart';
import 'package:ranck_game_libras/utils/constants.dart';
import 'package:ranck_game_libras/utils/responsive.dart';

class Input extends StatelessWidget {
  @override
  final double? width;
  final String? placeholder;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function? onTap;
  final Function(String?)? onChanged;
  final TextEditingController? controller;
  final bool autofocus;
  final Color borderColor;
  final bool obscureText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final String? label;

  const Input({
    super.key,
    this.width,
    this.placeholder,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.onChanged,
    this.autofocus = false,
    this.borderColor = SobratColors.border,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.inputFormatters,
    this.validator,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ??
          (Responsive.isDesktop(context)
              ? widthDefaultInput
              : Get.width - defaultPadding / 2),
      padding: const EdgeInsets.all(defaultPadding / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            TextBody(
              "${label!}:",
              textAlign: TextAlign.start,
            ),
          TextFormField(
            key: key,
            obscureText: obscureText,
            keyboardType: keyboardType,
            cursorColor: SobratColors.muted,
            onTap: () => onTap,
            onChanged: onChanged,
            controller: controller,
            autofocus: autofocus,
            style: const TextStyle(
                height: 0.85, fontSize: 14.0, color: SobratColors.initial),
            textAlignVertical: const TextAlignVertical(y: 0.6),
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).inputDecorationTheme.fillColor,
              hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(
                      color: borderColor,
                      width: 1.0,
                      style: BorderStyle.solid)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(
                      color: borderColor,
                      width: 1.0,
                      style: BorderStyle.solid)),
              hintText: placeholder,
            ),
            validator: validator,
            inputFormatters: inputFormatters,
          ),
        ],
      ),
    );
  }
}
