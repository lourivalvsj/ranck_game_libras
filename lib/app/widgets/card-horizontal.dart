import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ranck_game_libras/app/theme/Theme.dart';
import 'package:ranck_game_libras/utils/constants.dart';

class CardHorizontal extends StatelessWidget {
  const CardHorizontal({
    super.key,
    this.title = "Placeholder Title",
    this.description = "",
    this.cta = "",
    this.img,
    this.tap = defaultFunc,
  });

  final String cta;
  final String? img;
  final Function() tap;
  final String title;
  final String? description;

  static void defaultFunc() {
    print("Nenhuma função definida");
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 130,
        child: GestureDetector(
          onTap: tap,
          child: Card(
            elevation: 0.6,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6.0))),
            child: Row(
              children: [
                if (img != null)
                  Flexible(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.all(defaultPadding * 2),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6.0),
                          bottomLeft: Radius.circular(6.0),
                        ),
                      ),
                      child: Image.memory(
                        base64Decode(img!),
                        fit: BoxFit.fill,
                        width: 50.0,
                        height: 50.0,
                      ),
                    ),
                  ),
                Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title,
                              style: Theme.of(context).textTheme.bodyMedium),
                          Text(
                            description ?? '',
                            style: const TextStyle(
                                color: GameColors.header, fontSize: 10),
                            overflow: TextOverflow.clip,
                          ),
                          Text(cta,
                              style: Theme.of(context).textTheme.bodyLarge),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
