// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ranck_game_libras/app/model/menu/menu_model.dart';
// import 'package:ranck_game_libras/app/modules/cadastros/cargo/pages/cargo_list_page.dart';
// import 'package:ranck_game_libras/app/modules/cadastros/cidade/pages/cidade_list_page.dart';
// import 'package:ranck_game_libras/app/modules/cadastros/clientes/pages/cliente_list_page.dart';
// import 'package:ranck_game_libras/app/modules/cadastros/colaborador/pages/colaborador_list_page.dart';
// import 'package:ranck_game_libras/app/modules/cadastros/cultivo/pages/cultivo_list_page.dart';
// import 'package:ranck_game_libras/app/modules/cadastros/cultura/pages/cultura_list_page.dart';
// import 'package:ranck_game_libras/app/modules/cadastros/departamento/pages/departamento_list_page.dart';
// import 'package:ranck_game_libras/app/modules/cadastros/laboratorio/pages/laboratorio_list_page.dart';
// import 'package:ranck_game_libras/app/modules/cadastros/outro_servico/pages/outro_servico_list_page.dart';
// import 'package:ranck_game_libras/app/modules/cadastros/padrao_perfil_profundidade/pages/padrao_perfil_profundidade_list_page.dart';
// import 'package:ranck_game_libras/app/modules/cadastros/participacao/pages/participacao_list_page.dart';
// import 'package:ranck_game_libras/app/modules/cadastros/perfil_profundidade/pages/perfil_profundidade_list_page.dart';
// import 'package:ranck_game_libras/app/modules/cadastros/regiao/pages/regiao_list_page.dart';
// import 'package:ranck_game_libras/app/modules/cadastros/safra/pages/safra_list_page.dart';
// import 'package:ranck_game_libras/app/modules/cadastros/servico/pages/servico_list_page.dart';
// import 'package:ranck_game_libras/app/modules/cadastros/tipo_analise/pages/tipo_analise_list_page.dart';
// import 'package:ranck_game_libras/app/modules/cadastros/uf/pages/uf_list_page.dart';
// import 'package:ranck_game_libras/app/modules/comercial/cotacao/pages/cotacao_list_page.dart';
// import 'package:ranck_game_libras/app/modules/dashboard/pages/dashboard_page.dart';
// import 'package:ranck_game_libras/app/modules/fitotecnia/acompanhar_proposta/pages/acompanhar_proposta_list_page.dart';
// import 'package:ranck_game_libras/app/modules/fitotecnia/atividade/pages/atividade_list_page.dart';
// import 'package:ranck_game_libras/app/modules/fitotecnia/planejamento_safra/pages/planejamento_safra_list_page.dart';
// import 'package:ranck_game_libras/app/modules/fitotecnia/programacao_visita/pages/programacao_visita_list_page.dart';
// import 'package:ranck_game_libras/app/modules/fitotecnia/proposta/pages/proposta_list_page.dart';
// import 'package:ranck_game_libras/app/modules/initial/initial_controller.dart';
// import 'package:ranck_game_libras/app/modules/usuario/controller/usuario_controller.dart';
// import 'package:ranck_game_libras/app/modules/webview/pages/webview_page.dart';

// var menuItems = <MenuModel>[
//   MenuModel(
//     icon: Icons.add_to_photos_outlined,
//     title: 'Painel de Informações',
//     onTap: () => Get.find<InitialController>().setCurrentPage(
//       const DashboardPage(),
//     ),
//     tiles: [],
//   ),
//   MenuModel(
//     icon: Icons.add,
//     title: 'Cadastros',
//     tiles: [
//       MenuModel(
//         title: "Laboratórios",
//         tiles: [],
//         onTap: () => Get.find<InitialController>().setCurrentPage(
//           const LaboratorioListPage(),
//         ),
//       ),
//       MenuModel(
//         title: "Departamentos",
//         tiles: [],
//         onTap: () => Get.find<InitialController>().setCurrentPage(
//           const DepartamentoListPage(),
//         ),
//       ),
//       MenuModel(
//         title: "Cargos",
//         tiles: [],
//         onTap: () => Get.find<InitialController>().setCurrentPage(
//           const CargoListPage(),
//         ),
//       ),
//       MenuModel(
//         title: "Regiões",
//         tiles: [],
//         onTap: () => Get.find<InitialController>().setCurrentPage(
//           const RegiaoListPage(),
//         ),
//       ),
//       MenuModel(
//         title: "Clientes",
//         tiles: [],
//         onTap: () => Get.find<InitialController>().setCurrentPage(
//           const ClienteListPage(),
//         ),
//       ),
//       MenuModel(
//         title: "Colaboradores",
//         tiles: [],
//         onTap: () => Get.find<InitialController>().setCurrentPage(
//           const ColaboradorListPage(),
//         ),
//       ),
//       MenuModel(
//         title: "Perfis",
//         tiles: [],
//         onTap: () => Get.find<InitialController>().setCurrentPage(
//           const PerfilProfundidadeListPage(),
//         ),
//       ),
//       MenuModel(
//         title: "Participações",
//         tiles: [],
//         onTap: () => Get.find<InitialController>().setCurrentPage(
//           const ParticipacaoListPage(),
//         ),
//       ),
//       MenuModel(
//         title: "Padrões de Perfis",
//         tiles: [],
//         onTap: () => Get.find<InitialController>().setCurrentPage(
//           const PadraoPerfilProfundidadeListPage(),
//         ),
//       ),
//       MenuModel(
//         title: "Atividades",
//         tiles: [],
//         onTap: () => Get.find<InitialController>().setCurrentPage(
//           const AtividadeListPage(),
//         ),
//       ),
//       MenuModel(
//         title: "Serviços",
//         tiles: [],
//         onTap: () => Get.find<InitialController>().setCurrentPage(
//           const ServicoListPage(),
//         ),
//       ),
//       MenuModel(
//         title: "Outros Serviços",
//         tiles: [],
//         onTap: () => Get.find<InitialController>().setCurrentPage(
//           const OutroServicoListPage(),
//         ),
//       ),
//       MenuModel(
//         title: "Tipos de Análise",
//         tiles: [],
//         onTap: () => Get.find<InitialController>().setCurrentPage(
//           const TipoAnaliseListPage(),
//         ),
//       ),
//       MenuModel(
//         title: "Safras",
//         tiles: [],
//         onTap: () => Get.find<InitialController>().setCurrentPage(
//           const SafraListPage(),
//         ),
//       ),
//       MenuModel(
//         title: "Culturas",
//         tiles: [],
//         onTap: () => Get.find<InitialController>().setCurrentPage(
//           const CulturaListPage(),
//         ),
//       ),
//       MenuModel(
//         title: "Cultivar/Híbrido",
//         tiles: [],
//         onTap: () => Get.find<InitialController>().setCurrentPage(
//           const CultivoListPage(),
//         ),
//       ),
//       MenuModel(
//         title: "Ufs",
//         tiles: [],
//         onTap: () => Get.find<InitialController>().setCurrentPage(
//           const UfListPage(),
//         ),
//       ),
//       MenuModel(
//         title: "Cidades",
//         tiles: [],
//         onTap: () => Get.find<InitialController>().setCurrentPage(
//           const CidadeListPage(),
//         ),
//       ),
//     ],
//   ),
//   MenuModel(
//     icon: Icons.add,
//     title: 'Fitotecnia',
//     tiles: [
//       // MenuModel(
//       //   title: "Primeiro Mapa",
//       //   tiles: [],
//       //   // onTap: () => Get.toNamed(AppRoutes.PRIMEIRO_MAPA)
//       //   onTap: () => Get.find<InitialController>().setCurrentPage(
//       //     PrimeiroMapa(),
//       //   ),
//       // ),
//       MenuModel(
//         title: "Proposta",
//         tiles: [],
//         onTap: () => Get.find<InitialController>().setCurrentPage(
//           const PropostaListPage(),
//         ),
//       ),
//       MenuModel(
//         title: "Acompanhar Proposta",
//         tiles: [],
//         onTap: () => Get.find<InitialController>().setCurrentPage(
//           const AcompanharPropostaListPage(),
//         ),
//       ),
//       MenuModel(
//         title: "Planejamento de Safra",
//         tiles: [],
//         onTap: () => Get.find<InitialController>().setCurrentPage(
//           const PlanejamentoSafraListPage(),
//         ),
//       ),
//       MenuModel(
//         title: "Cotação",
//         tiles: [],
//         onTap: () => Get.find<InitialController>().setCurrentPage(
//           const CotacaoListPage(),
//         ),
//       ),
//       MenuModel(
//         title: "Programação de Visitas",
//         tiles: [],
//         onTap: () => Get.find<InitialController>().setCurrentPage(
//           const ProgramacaoVisitaListPage(),
//         ),
//       ),
//     ],
//   ),
//   MenuModel(
//     icon: Icons.add,
//     title: 'Testes Geolocalização',
//     tiles: [
//       MenuModel(
//         title: "WebView",
//         tiles: [],
//         onTap: () => Get.find<InitialController>().setCurrentPage(
//           const WebViewPage(),
//         ),
//       ),
//     ],
//   ),
//   MenuModel(
//     icon: Icons.logout,
//     title: 'Sair',
//     onTap: () => Get.find<UsuarioController>().logout(),
//     tiles: [],
//   ),
// ];
