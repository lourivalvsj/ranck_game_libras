import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ranck_game_libras/app/widgets/cancel-button.dart';
import 'package:ranck_game_libras/app/widgets/primary-button.dart';
import 'package:ranck_game_libras/app/widgets/text-body.dart';
import 'package:ranck_game_libras/utils/constants.dart';
import 'package:ranck_game_libras/utils/responsive.dart';

class Utils {
  static List<T> modelBuilder<M, T>(
          List<M> models, T Function(int index, M model) builder) =>
      models
          .asMap()
          .map<int, T>((index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();

  //###########
  // Converte a data para formato correto
  // para enviar pro back ou para exibir no sistema
  //###########
  static convertDate(String date) {
    try {
      return date
          .split(RegExp(r"(/|-)"))
          .reversed
          .join(date.contains("/") ? "-" : "/");
    } catch (e) {
      return "";
    }
  }

  /// Converter o valor de uma String com `R$`
  static double converterMoedaParaDouble(String valor) {
    assert(valor.isNotEmpty);
    final value = double.tryParse(
        valor.replaceAll(RegExp(r'[^0-9,]+'), '').replaceAll(',', '.'));
    return value ?? 0;
  }

  /// Converter o valor de uma String com `%`
  static double converterPercentualParaDouble(String valor) {
    assert(valor.isNotEmpty);
    final value = double.tryParse(
        valor.replaceAll(RegExp(r'[^0-9,]+'), '').replaceAll(',', '.'));
    return value ?? 0;
  }

  static double widthConteudo(BuildContext context) {
    return Responsive.isDesktop(context)
        ? MediaQuery.of(context).size.width - widthDrawer
        : MediaQuery.of(context).size.width;
  }

  static String unAccent2(String value) {
    String aAcent = "[áãàâä]";
    String a2Acent = "[ÁÂÀÂÄ]";
    String eAcent = "[éèêë]";
    String e2Acent = "[ÉÈÊË]";
    String iAcent = "[íìîï]";
    String i2Acent = "[ÍÌÎÏ]";
    String oAcent = "[óõòôö]";
    String o2Acent = "[ÓÕÒÔÖ]";
    String uAcent = "[úùûü]";
    String u2Acent = "[ÚÙÛÜ]";
    value = value.replaceAll(RegExp(aAcent), "a");
    value = value.replaceAll(RegExp(a2Acent), "A");
    value = value.replaceAll(RegExp(eAcent), "e");
    value = value.replaceAll(RegExp(e2Acent), "E");
    value = value.replaceAll(RegExp(iAcent), "i");
    value = value.replaceAll(RegExp(i2Acent), "I");
    value = value.replaceAll(RegExp(oAcent), "o");
    value = value.replaceAll(RegExp(o2Acent), "O");
    value = value.replaceAll(RegExp(uAcent), "u");
    value = value.replaceAll(RegExp(u2Acent), "U");
    value = value.replaceAll("ç", "c");

    return value;
  }

  // static Future<dynamic> showDocument(Arquivo arquivo) async {
  //   if (arquivo.extension == 'jpg' || arquivo.extension == 'png') {
  //     Uint8List base64 = base64Decode(arquivo.base64);
  //     return Get.defaultDialog(
  //       barrierDismissible: true,
  //       title: arquivo.name,
  //       content: Container(
  //         constraints: BoxConstraints(
  //           maxHeight: Get.height * 0.80,
  //           maxWidth: Get.width * 0.70,
  //         ),
  //         child: SingleChildScrollView(
  //           child: Column(
  //             children: [
  //               Image.memory(
  //                 base64,
  //                 fit: BoxFit.scaleDown,
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     );
  //   }
  // }

  // static showFolder(String? title, List<Arquivo>? documents) {
  //   return Get.defaultDialog(
  //     barrierDismissible: true,
  //     title: title ?? '',
  //     content: SizedBox(
  //       height: Get.height * 0.80,
  //       width: Get.width * 0.70,
  //       child: documents == null || documents.isEmpty
  //           ? Center(
  //               child: TextBody('Nenhum arquivo carregado...'),
  //             )
  //           : _buildArquivos(documents),
  //     ),
  //   );
  // }

  // static Widget _buildArquivos(List<Arquivo> documents) {
  //   return GridView.builder(
  //     gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
  //       maxCrossAxisExtent: 200,
  //       childAspectRatio: 3 / 2,
  //       crossAxisSpacing: 20,
  //       mainAxisSpacing: 20,
  //     ),
  //     itemCount: documents.length,
  //     itemBuilder: (context, index) => CardArquivo(
  //       icon: documents[index].extension == 'pdf'
  //           ? Icons.picture_as_pdf
  //           : Icons.image,
  //       color: documents[index].extension == 'pdf' ? Colors.red : Colors.blue,
  //       arquivo: documents[index],
  //     ),
  //     // children: [
  //     //   for (int i = 0; i < documents.length; i++)
  //     //     ListTile(
  //     //       title: Text(documents[i].name),
  //     //       subtitle: Text(documents[i].extension),
  //     //     ),
  //     // ],
  //   );
  // }

  static showConfirmation({
    required String? title,
    required String? message,
    required void Function() onPressed,
    String? textButton,
  }) {
    RxBool confirm = false.obs;

    Get.defaultDialog(
      barrierDismissible: false,
      title: title ?? 'Confirmação',
      content: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextBody(message ?? 'Você realmente deseja confirmar essa ação?'),
            ],
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          Row(
            children: [
              Obx(() => Checkbox(
                    value: confirm.value,
                    onChanged: (value) => confirm(value),
                  )),
              TextBody('Confirmar a ação'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: defaultPadding * 3),
            child: Row(
              children: [
                const CancelButton(),
                Obx(() => PrimaryButton(
                      enable: confirm.value,
                      onPressed: () {
                        onPressed();
                        Get.back();
                      },
                      // onPressed: confirm.value ? onPressed : () {},
                      child: Text(
                        textButton ?? 'CONFIRMAR',
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
