import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ranck_game_libras/app/modules/initial/pages/initial_page.dart';
import 'package:ranck_game_libras/app/widgets/text-small.dart';
import 'package:ranck_game_libras/utils/routes/app_routes.dart';

class BottomBar extends StatelessWidget {
  final Widget page;
  const BottomBar({
    Key? key,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildBottomAppBar();
  }

  Widget buildBottomAppBar() {
    return BottomAppBar(
      // color: SobratColors.textDark,
      child: SizedBox(
        height: 70.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: InkWell(
                onTap: () => Get.toNamed(AppRoutes.INITIAL),
                child: SizedBox(
                  child: Material(
                    type: MaterialType.transparency,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color: page is InitialPage
                              ? Get.theme.primaryColor
                              : null,
                        ),
                        // IconButton(
                        //   padding: EdgeInsets.zero,
                        //   constraints: const BoxConstraints(),
                        //   icon: const Icon(Icons.home),
                        //   color: page is Initial
                        //       ? Get.theme.primaryColor
                        //       : null,
                        //   // onPressed: () => Get.find<InitialController>()
                        //   //     .setCurrentPage(Initial()),
                        //   onPressed: () => Get.toNamed(AppRoutes.Initial),
                        // ),
                        TextSmall(
                          "Início",
                          color: page is InitialPage
                              ? Get.theme.primaryColor
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
