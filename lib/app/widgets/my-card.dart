import 'package:flutter/material.dart';
import 'package:ranck_game_libras/app/theme/Theme.dart';
import 'package:ranck_game_libras/app/widgets/text-body.dart';
import 'package:ranck_game_libras/utils/constants.dart';

class MyCard extends StatelessWidget {
  final List<Widget> children;
  final String? title;
  final Widget? newRow;
  final bool? visible;
  const MyCard({
    Key? key,
    this.title,
    required this.children,
    this.newRow,
    this.visible = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding * 3),
      child: FocusTraversalGroup(
        child: Card(
          elevation: visible == true ? null : 0.0,
          margin: EdgeInsets.zero,
          // shape: const RoundedRectangleBorder(
          //   borderRadius: BorderRadius.zero,
          // ),
          color: SobratColors.secondary,
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: defaultPadding),
                    child: TextBody(
                      title!,
                    ),
                  ),
                Wrap(
                  runSpacing: defaultPadding,
                  children: [
                    ...children,
                    Row(), // Só está aqui pra deixar o card expandido
                  ],
                ),
                if (newRow != null) newRow!
              ],
            ),
          ),
        ),
      ),
    );
  }
}
