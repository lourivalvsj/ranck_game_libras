import 'package:flutter/material.dart';
import 'package:ranck_game_libras/app/theme/Theme.dart';
import 'package:ranck_game_libras/utils/constants.dart';

class BtnAdd extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;
  const BtnAdd({
    Key? key,
    required this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 25,
      margin: const EdgeInsets.only(
        top: 23,
        left: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: InkWell(
        onTap: isLoading ? null : onPressed,
        child: isLoading
            ? const SizedBox(
                height: 15,
                width: 15,
                child: CircularProgressIndicator(
                  color: SobratColors.white,
                ),
              )
            : const Icon(
                Icons.add,
                color: SobratColors.white,
              ),
      ),
    );
  }
}
