import 'package:ranck_game_libras/utils/constants.dart';

class BackRoutes {
  static const baseUrl = https ? URL_BACK : URL_LOCAL;

  static const URL_BACK = 'https://back.sobrat.solutys.com.br';
  // static const URL_LOCAL = '177.73.50.74:36378';
  static const URL_LOCAL = 'http://192.168.3.8:8080';
  // static const URL_LOCAL = 'http://192.168.3.20:8080';
  // static const URL_LOCAL =
  //     'http://back.fenix.local.com:8080'; //IP Back Lucas Local
  // static const URL_LOCAL = 'front.fenix.local.com:8080'; //IP Back Lucas Local
  // static const URL_LOCAL = 'http://localhost:8080';

  // Login
  static const LOGIN = '/auth'; // Login

  // SignIn
  static const SIGNIN = '/auth/signin'; // Login

  // Uf
  static const UF_ALL = '/person/uf/all';
  static const UF_SAVE = '/person/uf/save';
  static const UF_UPDATE = '/person/uf/update';
  static const UF_DELETE = '/person/uf/delete';
  static const UF_SHOW = '/person/uf/findbyid';

  // User
  static const ME = '/user/me';
  static const LOGOUT = '/user/logout';
  static const USER_UPDATE = '/user/update';

  // Solicitation
  static const SOLICITATION_ALL_BY_TOKEN = '/solicitation/findbytoken';
  static const SOLICITATION_ALL = '/solicitation/all';
  static const SOLICITATION_SAVE = '/solicitation/save';

  // PriceUnit
  static const PRICE_UNIT_ALL = '/priceunit/all';
  // Category
  static const CATEGORY_ALL = '/service/category/all';

  // SubCategory
  static const SUB_CATEGORY_ALL = '/service/subcategory/all';
  static const SUB_CATEGORY_BY_CATEGORY = '/service/subcategory/findByCategory';

  // Type Address
  static const TYPE_ADDRESS_ALL = '/person/typeaddress/all';
  static const TYPE_ADDRESS_FILTER = '/person/typeaddress/filter';
  static const TYPE_ADDRESS_DELETE = '/person/typeaddress/delete';

  // Type Email
  static const TYPE_EMAIL_ALL = '/person/typeemail/all';
  static const TYPE_EMAIL_FILTER = '/person/typeemail/filter';
  static const TYPE_EMAIL_DELETE = '/person/typeemail/delete';

  // Service
  static const SERVICE_ALL = '/service/all';
  static const SERVICE_FILTER = '/service/filter';
  static const SERVICE_DELETE = '/service/delete';

  // service
  static const SERVICE_USER_ALL = '/serviceuser/all';
  static const SERVICE_USER_FILTER = '/serviceuser/filterByServiceUserDTO';
  static const SERVICE_USER_DELETE = '/serviceuser/delete';

  // My Services
  static const MY_SERVICES_ALL = '/serviceuser/myservices';

  // Evaluation
  static const EVALUATION_ALL = '/evaluation/all';
  static const EVALUATION_FILTER = '/evaluation/filter';
  static const EVALUATION_DELETE = '/evaluation/delete';

  // Status Service
  static const STATUS_ALL_BY_SOLICITATION = '/solicitation/status';
  static const STATUS_FILTER = '/status/filter';
  static const STATUS_DELETE = '/status/delete';

  // Payment
  static const PAYMENT_METHOD_ALL = '/payment/paymentmethod/all';
  static const PAYMENT_CREATE_PIX = '/mercadopago/payment/create/pix';

  // Solicitation
  static const ADDRESS_ALL_BY_TOKEN = '/person/address/findbytoken';
}
