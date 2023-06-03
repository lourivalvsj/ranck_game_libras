import 'package:flutter/services.dart';
import 'package:ranck_game_libras/utils/utils.dart';

class NoSpecialCharacterAndAccent extends TextInputFormatter {
  String permit;
  bool accent;
  bool isDigits;
  bool isLower;
  NoSpecialCharacterAndAccent({
    this.permit = '',
    this.accent = false,
    this.isDigits = false,
    this.isLower = false,
  });
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = StringBuffer();
    String source = "[^a-zA-Z0-9 $permit]+";
    String digits = "[^0-9$permit]+";
    String accents = "ÁÃÀÂÉÈÊÍÎÌÓÒÔÕÚÙÛ";

    String newValue2 = newValue.text;
    //Remove Espaços duplicados
    while (newValue2.contains(RegExp(r" {2}"))) {
      newValue2 = newValue2.replaceAll(RegExp(r" {2}"), " ");
    }

    if (isDigits) {
      source = digits;
    } else {
      if (accent) {
        source += accents;
      } else {
        newValue2 = Utils.unAccent2(newValue2);
      }
    }

    newText.write(newValue2
        .replaceAll(RegExp(source), "")
        .replaceAll(RegExp(r" {2}"), " "));
    return TextEditingValue(
      text: isLower ? newText.toString() : newText.toString().toUpperCase(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
