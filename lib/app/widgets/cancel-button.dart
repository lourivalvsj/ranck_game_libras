import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ranck_game_libras/app/theme/Theme.dart';
import 'package:ranck_game_libras/utils/constants.dart';

class CancelButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final bool widthInfinity;
  const CancelButton({
    Key? key,
    this.onPressed,
    this.child,
    this.width,
    this.padding,
    this.widthInfinity = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: widthInfinity ? null : width ?? widthDefaultInput,
      padding: padding ?? const EdgeInsets.all(defaultPadding / 2),
      child: ElevatedButton(
        style: Get.theme.elevatedButtonTheme.style?.copyWith(
          backgroundColor: MaterialStateProperty.all(SobratColors.btnCancelar),
        ),
        onPressed: onPressed ?? () => Get.back(),
        child: child ??
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('CANCELAR'),
              ],
            ),
      ),
    );
  }
}
