import 'package:flutter/material.dart';

class CardSquare extends StatelessWidget {
  const CardSquare(
      {super.key, this.title = "Placeholder Title",
      this.cta = "",
      this.img = "https://via.placeholder.com/200",
      this.tap = defaultFunc});

  final String cta;
  final String img;
  final Function tap;
  final String title;

  static void defaultFunc() {
    print("the function works!");
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 250,
        width: null,
        child: GestureDetector(
          onTap: () => tap,
          child: Card(
              elevation: 0.4,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      flex: 3,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(6.0),
                                  topRight: Radius.circular(6.0)),
                              image: DecorationImage(
                                image: NetworkImage(img),
                                fit: BoxFit.cover,
                              )))),
                  Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 8.0, left: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(title,
                                style: Theme.of(context).textTheme.bodyMedium),
                            Text(cta,
                                style: Theme.of(context).textTheme.bodyLarge)
                          ],
                        ),
                      ))
                ],
              )),
        ));
  }
}
