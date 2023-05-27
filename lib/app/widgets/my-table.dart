import 'package:flutter/material.dart';
import 'package:ranck_game_libras/app/theme/Theme.dart';
import 'package:ranck_game_libras/app/widgets/scrollable_widget.dart.dart';
import 'package:ranck_game_libras/app/widgets/text-body.dart';
import 'package:ranck_game_libras/utils/constants.dart';

class MyTable extends StatelessWidget {
  final String? title;
  final double? width;
  final List<DataRow> rows;
  final List<DataColumn> columns;
  final bool sortAscending;
  final int? sortColumnIndex;
  final bool showPagination;
  final int? resultsPerPage;
  final int? totalPages;
  final int? currentPage;
  final int? totalItems;
  final bool? isDialog;
  final double? minWidth;
  final Function(int)? changePage;
  const MyTable({
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
    this.isDialog = false,
    this.changePage,
    this.minWidth = 0.7,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        ScrollableWidget(
          child: Container(
            constraints: isDialog == true
                ? BoxConstraints(
                    minWidth:
                        MediaQuery.of(context).size.width * (minWidth ?? 0.7),
                  )
                : BoxConstraints(
                    minWidth:
                        //  Get.find<InitialController>().drawerIsOpen
                        //     ? MediaQuery.of(context).size.width -
                        //         (widthDrawer + (defaultPadding * 2))
                        //     :
                        MediaQuery.of(context).size.width,
                  ),
            child: DataTable(
              showBottomBorder: true,
              headingRowColor: MaterialStateColor.resolveWith(
                (states) {
                  return SobratColors.headerTable;
                },
              ),
              dataRowColor: MaterialStateColor.resolveWith(
                (states) {
                  return SobratColors.secondary;
                },
              ),
              headingRowHeight: 30.0,
              dataRowHeight: 30.0,
              columnSpacing: defaultPadding,
              columns: columns,
              rows: rows,
              sortAscending: sortAscending,
              sortColumnIndex: sortColumnIndex,
            ),
          ),
        ),
        if (showPagination)
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 30.0,
                  decoration: const BoxDecoration(
                    color: SobratColors.secondary,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // if ((currentPage ?? 1) > 0)
                      // Botão de Voltar
                      InkWell(
                        onTap: changePage == null
                            ? null
                            : currentPage == 0
                                ? null
                                : () => changePage!(currentPage! - 1),
                        mouseCursor: MouseCursor.defer,
                        child: Container(
                          margin: const EdgeInsets.only(right: defaultPadding),
                          decoration: (currentPage ?? 1) > 0
                              ? BoxDecoration(
                                  border: Border.all(
                                      color: Theme.of(context).primaryColor),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                )
                              : BoxDecoration(
                                  border: Border.all(
                                      color: SobratColors.headerTable),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                          child: Padding(
                            padding: const EdgeInsets.all(defaultPadding / 2),
                            child: Row(
                              children: [
                                TextBody(
                                  ' < ',
                                  color: (currentPage ?? 1) > 0
                                      ? Theme.of(context).primaryColor
                                      : SobratColors.headerTable,
                                  fontWeight: FontWeight.bold,
                                ),
                                TextBody(
                                  'Anterior',
                                  color: (currentPage ?? 1) > 0
                                      ? null
                                      : SobratColors.headerTable,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      for (int i = 1; i <= (totalPages ?? 1); i++)
                        if (((currentPage ?? 0) + 1) <= i + 3 &&
                            i <=
                                ((currentPage ?? 0) + 1) +
                                    3) // if pra limitar a quantidade de paginas a ser exibido na paginação (Os números)
                          ((currentPage ?? 0) + 1 != i)
                              ? InkWell(
                                  onTap: changePage == null ||
                                          ((currentPage ?? 0) + 1) == i
                                      ? null
                                      : () => changePage!(i - 1),
                                  mouseCursor: MouseCursor.defer,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: defaultPadding,
                                      right: defaultPadding,
                                    ),
                                    child: TextBody("$i"),
                                  ),
                                )
                              : Container(
                                  height: 20.0,
                                  width: 20.0,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    border: Border.all(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                  ),
                                  child: TextBody(
                                    "$i",
                                    color: Colors.white,
                                    // fontWeight: FontWeight.bold,
                                    textAlign: TextAlign.center,
                                  ),
                                ),

                      // if (((currentPage ?? 1) + 1) != (totalPages ?? 1))
                      // Botão de Voltar
                      InkWell(
                        onTap: changePage == null
                            ? null
                            : currentPage == totalPages! - 1
                                ? null
                                : () => changePage!(currentPage! + 1),
                        mouseCursor: MouseCursor.defer,
                        splashColor: Theme.of(context).primaryColor,
                        child: Container(
                          margin: const EdgeInsets.only(left: defaultPadding),
                          decoration: ((currentPage ?? 1) + 1) !=
                                  (totalPages ?? 1)
                              ? BoxDecoration(
                                  border: Border.all(
                                      color: Theme.of(context).primaryColor),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                )
                              : BoxDecoration(
                                  border: Border.all(
                                      color: SobratColors.headerTable),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                          child: Padding(
                            padding: const EdgeInsets.all(defaultPadding / 2),
                            child: Row(
                              children: [
                                TextBody(
                                  'Próximo',
                                  color: ((currentPage ?? 1) + 1) !=
                                          (totalPages ?? 1)
                                      ? null
                                      : SobratColors.headerTable,
                                ),
                                TextBody(
                                  ' > ',
                                  color: ((currentPage ?? 1) + 1) !=
                                          (totalPages ?? 1)
                                      ? null
                                      : SobratColors.headerTable,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
