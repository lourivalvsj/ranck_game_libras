import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ranck_game_libras/app/theme/Theme.dart';
import 'package:ranck_game_libras/app/widgets/text-body.dart';
import 'package:ranck_game_libras/utils/constants.dart';

class MyTab extends StatelessWidget {
  MyTab({
    Key? key,
    required this.onTap,
    required this.title,
    required this.selected,
  }) : super(key: key);

  final void Function()? onTap;
  final String title;
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          color: GameColors.secondary,
          // border: selected
          //     ? const Border(
          //         bottom: BorderSide(
          //           color: SobratColors.headerTable,
          //           width: 3.0,
          //         ),
          //       )
          //     : null,
        ),
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Container(
            decoration: BoxDecoration(
              color: selected ? Colors.white : null,
              borderRadius: BorderRadius.circular(5),
              boxShadow: selected
                  ? [
                      const BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ]
                  : null,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextBody(
                title,
                color: selected ? Get.theme.primaryColor : null,
                fontWeight: selected ? FontWeight.bold : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
