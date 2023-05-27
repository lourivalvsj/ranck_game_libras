import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ranck_game_libras/app/theme/Theme.dart';
import 'package:ranck_game_libras/app/widgets/title-body.dart';
import 'package:ranck_game_libras/utils/constants.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;
  final bool isSelected;
  // final Color? iconColor;

  DrawerTile({
    required this.title,
    required this.icon,
    this.onTap,
    this.isSelected = false,
    // this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).primaryColor
                : Get.isDarkMode
                    ? SobratColors.bgColorScreenDark
                    : SobratColors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Row(
            children: [
              Icon(icon,
                  size: Theme.of(context).iconTheme.size,
                  color: isSelected
                      ? SobratColors.white
                      : Theme.of(context).iconTheme.color),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: TitleBody(
                  title,
                  color: isSelected ? SobratColors.white : null,
                ),
              )
            ],
          )),
    );
  }
}
