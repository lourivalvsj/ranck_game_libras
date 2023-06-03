import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DropdownQtdItemPaginacao extends StatelessWidget {
  @override
  final double? width;
  final String? name;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function? onTap;
  final Function(int) onChanged;
  final void Function()? loadDropdown;
  final void Function(String)? onFieldSubmitted;
  final TextEditingController? controller;
  final bool autofocus;
  final bool obscureText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool validator;
  final bool show;
  final bool enabled;
  final bool showLabel;
  final bool autoFocus;
  final List<int>? items;
  final int? selectedItem;
  final bool awaitingSelection;
  final bool cleanItems;
  final Future<List<int>?>? futureItems;

  DropdownQtdItemPaginacao({
    super.key,
    this.width,
    this.name,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    required this.onChanged,
    this.onFieldSubmitted,
    this.autofocus = false,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.inputFormatters,
    this.validator = true,
    this.show = false,
    this.enabled = true,
    this.showLabel = true,
    this.autoFocus = false,
    this.items,
    this.selectedItem,
    this.awaitingSelection = false,
    this.cleanItems = false,
    this.futureItems,
    this.loadDropdown,
  });

  selectedQtde(String qtde) {
    onChanged(int.parse(qtde));
  }

  List<String> opcoes = [
    "20",
    "50",
    "100",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      width: 80,
      child: DropdownButtonFormField(
        iconSize: 15,
        isDense: true,
        decoration: const InputDecoration(),
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: Colors.black),

        items: opcoes.map<DropdownMenuItem<String>>(
          (String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                overflow: TextOverflow.ellipsis,
                // style: TextStyle(
                //   fontSize: 8.0,
                // ),
              ),
            );
          },
        ).toList(),
        // dropdownSearchTextAlignVertical:
        //     const TextAlignVertical(y: 0.6),
        value: selectedItem.toString(),
        onChanged: (String? newValue) {
          selectedQtde(
            newValue!,
          );
        },
        validator: (value) => (validator)
            ? (value == null)
                ? 'Selecione uma opção...'
                : null
            : null,
      ),
    );
  }
}
