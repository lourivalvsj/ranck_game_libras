import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ranck_game_libras/utils/constants.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final bool widthInfinity;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final bool? isLoading;
  final bool? enable;
  const PrimaryButton(
      {Key? key,
      required this.onPressed,
      required this.child,
      this.width,
      this.padding,
      this.widthInfinity = false,
      this.prefixIcon,
      this.sufixIcon,
      this.isLoading = false,
      this.enable = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(defaultPadding / 2),
      // width: widthInfinity ? null : width ?? widthDefaultInput,
      child: ElevatedButton(
        onPressed: enable == true
            ? isLoading == true
                ? null
                : onPressed
            : null,
        style: enable == true
            ? Get.theme.elevatedButtonTheme.style
            : Get.theme.elevatedButtonTheme.style?.copyWith(
                backgroundColor: MaterialStateProperty.all(Colors.grey)),
        child: isLoading == true
            ? const Center(
                child: SizedBox(
                  height: 15,
                  width: 15,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (prefixIcon != null) prefixIcon!,
                  child,
                  if (sufixIcon != null) sufixIcon!,
                ],
              ),
      ),
    );
  }
}
