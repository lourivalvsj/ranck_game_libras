import 'package:flutter/material.dart';
import 'package:ranck_game_libras/utils/constants.dart';

class EditButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget? child;
  final bool dialog;
  final double? width;
  final bool? isLoading;
  const EditButton({
    Key? key,
    required this.onPressed,
    this.child,
    this.dialog = false,
    this.width,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: width ?? widthDefaultInput,
      padding: const EdgeInsets.all(defaultPadding / 2),
      child: ElevatedButton(
        onPressed: isLoading == true ? null : onPressed,
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
            : child ??
                const Text(
                  'EDITAR',
                ),
      ),
    );
  }
}
