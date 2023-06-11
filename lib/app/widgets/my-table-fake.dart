import 'package:flutter/material.dart';
import 'package:ranck_game_libras/app/theme/Theme.dart';
import 'package:ranck_game_libras/utils/constants.dart';

class MyTableFake extends StatefulWidget {
  final String? title;
  final double? width;
  final List<Widget> rows;
  final List<Widget> columns;
  final bool sortAscending;
  final int? sortColumnIndex;
  final bool showPagination;
  final int? resultsPerPage;
  final int? totalPages;
  final int? currentPage;
  final int? totalItems;
  final Function(int)? changePage;
  const MyTableFake({
    Key? key,
    this.title,
    this.width,
    required this.rows,
    required this.columns,
    this.sortAscending = false,
    this.sortColumnIndex,
    this.showPagination = false,
    this.resultsPerPage,
    this.totalPages,
    this.currentPage,
    this.totalItems,
    this.changePage,
  }) : super(key: key);

  @override
  State<MyTableFake> createState() => _MyTableFakeState();
}

class _MyTableFakeState extends State<MyTableFake> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: GameColors.headerTable,
          ),
          height: 30,
          child: Row(
            children: widget.columns
                .map(
                  (e) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: defaultPadding * 3,
                        right: defaultPadding * 3,
                      ),
                      child: e,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: widget.rows.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 30,
              child: Container(
                decoration: const BoxDecoration(
                  color: GameColors.secondary,
                  border: Border(
                    bottom: BorderSide(
                      color: GameColors.headerTable,
                      width: 1.5,
                    ),
                  ),
                ),
                child: widget.rows[index],
              ),
            );
          },
        ),
      ],
    );
  }
}
