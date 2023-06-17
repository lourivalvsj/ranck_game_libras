import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ranck_game_libras/app/theme/Theme.dart';
import 'package:ranck_game_libras/app/widgets/text-body.dart';
import 'package:ranck_game_libras/utils/constants.dart';
import 'package:ranck_game_libras/utils/no_special_character.dart';
import 'package:ranck_game_libras/utils/responsive.dart';
import 'package:ranck_game_libras/utils/uppercasetextformatter.dart';

class InputText extends StatelessWidget {
  @override
  final double? width;
  final EdgeInsetsGeometry? padding;
  final String? name;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function()? onTap;
  final Function(String?)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final TextEditingController? controller;
  final bool autofocus;
  final Color borderColor;
  final bool obscureText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final bool show;
  final bool enabled;
  final bool showLabel;
  final bool showPlaceholder;
  final bool upperCaseTextFormatter;
  final bool noSpecialCharacterAndAccent;
  final String? permitCharacters;
  final int? maxLines;
  final int? maxLength;
  final bool readOnly;
  final String? initialValue;
  final String? placeholder;
  final String? textWhenToShow;
  void Function(String?)? onSaved;

  InputText({
    super.key,
    this.width,
    this.padding,
    this.name,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.autofocus = false,
    this.borderColor = GameColors.borderInputEnable,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.inputFormatters,
    this.validator,
    this.show = false,
    this.enabled = true,
    this.showLabel = false,
    this.showPlaceholder = true,
    this.upperCaseTextFormatter = false,
    this.noSpecialCharacterAndAccent = false,
    this.permitCharacters,
    this.maxLines = 1,
    this.maxLength,
    this.readOnly = false,
    this.initialValue,
    this.placeholder,
    this.textWhenToShow,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return show
        ? Container(
            padding:
                padding != null ? null : const EdgeInsets.all(defaultPadding),
            constraints: width == null
                ? null
                : const BoxConstraints(minWidth: defaultTextShowContentWidth),
            width: width ??
                (Responsive.isDesktop(context)
                    ? widthDefaultInput
                    : Get.width - defaultPadding / 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: defaultPadding / 2),
                  child: TextBody(
                    name?.replaceAll('*', '') ?? '',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextBody(
                  textWhenToShow != null
                      ? textWhenToShow!
                      : initialValue != null
                          ? initialValue!
                          : controller?.text != null ||
                                  controller!.text.isNotEmpty
                              ? controller!.text
                              : '-',
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        : Container(
            width: width ??
                (Responsive.isDesktop(context)
                    ? widthDefaultInput
                    : Get.width - defaultPadding / 2),
            padding: padding ?? const EdgeInsets.all(defaultPadding / 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (name != null && showLabel)
                  Padding(
                    padding: const EdgeInsets.only(bottom: defaultPadding / 2),
                    child: TextBody(
                      name!,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                TextFormField(
                  initialValue: initialValue,
                  textInputAction: TextInputAction.none,
                  key: key,
                  enabled: enabled,
                  obscureText: obscureText,
                  readOnly: readOnly,
                  keyboardType: keyboardType,
                  cursorColor: GameColors.muted,
                  onTap: onTap,
                  onChanged: onChanged,
                  onFieldSubmitted: onFieldSubmitted,
                  onSaved: onSaved,
                  controller: controller,
                  autofocus: autofocus,
                  maxLines: maxLines,
                  maxLength: maxLength,
                  style: const TextStyle(
                    fontSize: fontSizeMenu,
                    color: GameColors.black,
                  ),
                  decoration: InputDecoration(
                    suffixIcon: suffixIcon,
                    prefixIcon: prefixIcon,
                    suffixIconConstraints: const BoxConstraints(
                      minHeight: 15,
                      minWidth: 15,
                    ),
                    hintText:
                        showPlaceholder ? placeholder ?? name ?? '' : null,
                  ).applyDefaults(Theme.of(context).inputDecorationTheme),
                  validator: validator,
                  inputFormatters: upperCaseTextFormatter &&
                          noSpecialCharacterAndAccent
                      ? [
                          UpperCaseTextFormatter(),
                          NoSpecialCharacterAndAccent(
                              permit: permitCharacters ??
                                  ''), //Por padrão, todos ficarão com essa formatação
                          ...inputFormatters ?? [],
                        ]
                      : upperCaseTextFormatter && !noSpecialCharacterAndAccent
                          ? [
                              UpperCaseTextFormatter(),
                              ...inputFormatters ?? [],
                            ]
                          : !upperCaseTextFormatter &&
                                  noSpecialCharacterAndAccent
                              ? [
                                  NoSpecialCharacterAndAccent(
                                      permit: permitCharacters ??
                                          ''), //Por padrão, todos ficarão com essa formatação
                                  ...inputFormatters ?? [],
                                ]
                              : inputFormatters,
                ),
              ],
            ),
          );
  }
}
