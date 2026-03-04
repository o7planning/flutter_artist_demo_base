import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_demo_base/config/storage/my_demo_storage_structure.dart';
import 'package:flutter_artist_demo_base/middleware/auth_middleware.dart';
import 'package:flutter_artist_demo_base/shelves_basic/01a/currency01a_screen.dart';
import 'package:flutter_artist_demo_base/shelves_basic/02a/song02a_screen.dart';
import 'package:flutter_artist_demo_base/shelves_basic/03a/employee03a_screen.dart';
import 'package:flutter_artist_demo_base/shelves_basic/08a/cat_product08a_screen.dart';
import 'package:flutter_artist_demo_base/shelves_basic/11a/supplier11a_screen.dart';
import 'package:flutter_artist_demo_base/shelves_basic/12a/country12a_screen.dart';
import 'package:flutter_artist_demo_base/shelves_basic/14a/teacher14a_screen.dart';
import 'package:flutter_artist_demo_base/shelves_basic/15a/teacher15a_screen.dart';
import 'package:flutter_artist_demo_base/shelves_basic/25a/system_log25a_screen.dart';
import 'package:flutter_artist_demo_base/shelves_basic/26a/supplier26a_screen.dart';
import 'package:flutter_artist_demo_base/shelves_basic/27a/supplier27a_screen.dart';
import 'package:flutter_artist_demo_base/shelves_basic/33a/employee33a_screen.dart';
import 'package:flutter_artist_demo_base/shelves_basic/36a/employment_history36a_screen.dart';
import 'package:flutter_artist_demo_base/shelves_basic/40a/employee40a_screen.dart';
import 'package:flutter_artist_demo_base/shelves_basic/42a/note42a_screen.dart';
import 'package:flutter_artist_demo_base/shelves_basic/43a/customer43a_screen.dart';
import 'package:flutter_artist_demo_base/shelves_basic/48a/country48a_screen.dart';
import 'package:flutter_artist_demo_base/shelves_basic/49a/currency49a_screen.dart';
import 'package:flutter_artist_demo_base/shelves_basic/59a/employee59a_screen.dart';
import 'package:flutter_artist_demo_base/shelves_basic/70a/system_report70a_screen.dart';
import 'package:flutter_artist_demo_base/shelves_basic/71a/supplier71a_screen.dart';
import 'package:flutter_artist_demo_base/shelves_basic/77a/product77a_screen.dart';
import 'package:flutter_artist_demo_base/shelves_basic/96a/sales_order96a_screen.dart';
import 'package:flutter_artist_demo_base/shelves_basic/configuration/configuration_screen.dart';
import 'package:flutter_artist_dio/rest_debug_screen.dart';
import 'package:flutter_artist_getx_adapter/flutter_artist_getx_adapter.dart';
import 'package:get/get.dart';
import 'package:universal_html/js.dart' as js;

import 'activities/login/login_screen.dart';
import 'adapter/global_data_adapter_impl.dart';
import 'adapter/login_logout_adapter_impl.dart';
import 'adapter/notification_adapter_impl.dart';
import 'dashboard/action_examples_screen.dart';
import 'dashboard/advanced_examples_screen.dart';
import 'dashboard/basic_examples_screen.dart.dart';
import 'dashboard/bonus_examples_screen.dart';
import 'dashboard/dashboard_screen.dart';
import 'dashboard/event_examples_screen.dart';
import 'dashboard/filter_examples_screen.dart';
import 'dashboard/form_examples_screen.dart';
import 'dashboard/pagination_examples_screen.dart';
import 'dashboard/sorting_examples_screen.dart';
import 'dashboard/state_examples_screen.dart';

Future<void> initGlobalsDependencies() async {
  ///
  /// Configure FlutterArtist Adaptor:
  ///
  await FlutterArtist.config(
    storageStructure: MyDemoStorageStructure(),
    coreFeaturesAdapter: GetxFlutterArtistCoreFeaturesAdapter(),
    localeAdapter: GetxFlutterArtistLocaleAdapter(
      supportedLocales: const [Locale("en", "US"), Locale("vi", "VN")],
    ),
    notificationAdapter: NotificationAdapterImpl(),
    loginLogoutAdapter: LoginLogoutAdapterImpl(),
    globalDataAdapter: GlobalDataAdapterImpl(),
    showRestDebugDialog: (BuildContext context) {
      bool isSystemUser = FlutterArtist.loggedInUser?.isSystemUser ?? false;
      showRestDebugDialog(
        context,
        showJson: isSystemUser,
        showToken: isSystemUser,
      );
    },
    maxStoredLogEntryCount: 20,
    notificationFetchPeriodInSeconds: 24 * 60 * 60,
    codeFlowRetentionPeriodInSeconds: 20,
    debugOptions: DebugOptions(),
    consoleDebugOptions: ConsoleDebugOptions(
      enabled: true,
      navigatorObserver: false,
      routeAware: false,
      globalManager: false,
      dataLoad: false,
    ),
  );
}

Future<void> main() async {
  Get.isLogEnable = false;
  await initGlobalsDependencies();
  //
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    _hideHtmlLoadingProgress();
    //
    return GetMaterialApp(
      title: 'Flutter Artist Demo',
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
      ),
      navigatorObservers: [FlutterArtist.navigatorObserver],
      initialRoute: BasicExamplesScreen.routeName,
      // Fix Error: https://github.com/jonataslaw/getx/issues/3425
      builder: (context, child) {
        return Overlay(initialEntries: [OverlayEntry(builder: (_) => child!)]);
      },
      getPages: [
        GetPage(
          name: LoginScreen.routeName,
          middlewares: [],
          page: () => const LoginScreen(),
        ),
        GetPage(
          name: DashboardScreen.routeName,
          middlewares: [AuthMiddleware()],
          page: () => const DashboardScreen(),
        ),
        GetPage(
          name: BasicExamplesScreen.routeName,
          middlewares: [AuthMiddleware()],
          page: () => const BasicExamplesScreen(),
        ),
        GetPage(
          name: FilterExamplesScreen.routeName,
          middlewares: [AuthMiddleware()],
          page: () => const FilterExamplesScreen(),
        ),
        GetPage(
          name: FormExamplesScreen.routeName,
          middlewares: [AuthMiddleware()],
          page: () => const FormExamplesScreen(),
        ),
        GetPage(
          name: PaginationExamplesScreen.routeName,
          middlewares: [AuthMiddleware()],
          page: () => const PaginationExamplesScreen(),
        ),
        GetPage(
          name: ActionExamplesScreen.routeName,
          middlewares: [AuthMiddleware()],
          page: () => const ActionExamplesScreen(),
        ),
        GetPage(
          name: EventExamplesScreen.routeName,
          middlewares: [AuthMiddleware()],
          page: () => const EventExamplesScreen(),
        ),
        GetPage(
          name: SortingExamplesScreen.routeName,
          middlewares: [AuthMiddleware()],
          page: () => const SortingExamplesScreen(),
        ),
        GetPage(
          name: StateExamplesScreen.routeName,
          middlewares: [AuthMiddleware()],
          page: () => const StateExamplesScreen(),
        ),
        GetPage(
          name: AdvancedExamplesScreen.routeName,
          middlewares: [AuthMiddleware()],
          page: () => const AdvancedExamplesScreen(),
        ),
        GetPage(
          name: BonusExamplesScreen.routeName,
          middlewares: [AuthMiddleware()],
          page: () => const BonusExamplesScreen(),
        ),

        GetPage(
          name: ConfigurationScreen.routeName,
          middlewares: [AuthMiddleware()],
          page: () => const ConfigurationScreen(),
        ),

        // *********************************************************************
        // *********************************************************************
        // *********************************************************************
        // *********************************************************************

        // .
        GetPage(
          name: Currency01aScreen.routeName,
          middlewares: [AuthMiddleware()],
          page: () => const Currency01aScreen(),
        ),
        // .
        GetPage(
          name: Song02aScreen.routeName,
          page: () => const Song02aScreen(),
        ),

        GetPage(
          name: CatProduct08aScreen.routeName,
          page: () => const CatProduct08aScreen(),
        ),
        GetPage(
          name: Employee03aScreen.routeName,
          middlewares: [AuthMiddleware()],
          page: () => const Employee03aScreen(),
        ),
        GetPage(
          name: Supplier11aScreen.routeName,
          middlewares: [AuthMiddleware()],
          page: () => const Supplier11aScreen(),
        ),
        GetPage(
          name: Country12aScreen.routeName,
          middlewares: [AuthMiddleware()],
          page: () => const Country12aScreen(),
        ),

        GetPage(
          name: Teacher14aScreen.routeName,
          middlewares: [AuthMiddleware()],
          page: () => const Teacher14aScreen(),
        ),
        // .
        GetPage(
          name: Teacher15aScreen.routeName,
          middlewares: [AuthMiddleware()],
          page: () => const Teacher15aScreen(),
        ),

        GetPage(
          name: SystemLog25aScreen.routeName,
          middlewares: [AuthMiddleware()],
          page: () => const SystemLog25aScreen(),
        ),
        GetPage(
          name: Supplier26aScreen.routeName,
          middlewares: [AuthMiddleware()],
          page: () => const Supplier26aScreen(),
        ),
        GetPage(
          name: Supplier27aScreen.routeName,
          middlewares: [AuthMiddleware()],
          page: () => const Supplier27aScreen(),
        ),

        GetPage(
          name: Employee33aScreen.routeName,
          middlewares: [AuthMiddleware()],
          page: () => const Employee33aScreen(),
        ),
        GetPage(
          name: EmpEmploymentHistory36aScreen.routeName,
          middlewares: [AuthMiddleware()],
          page: () => const EmpEmploymentHistory36aScreen(),
        ),

        GetPage(
          name: Employee40aScreen.routeName,
          middlewares: [AuthMiddleware()],
          page: () => const Employee40aScreen(),
        ),
        GetPage(
          name: Note42aScreen.routeName,
          middlewares: [AuthMiddleware()],
          page: () => const Note42aScreen(),
        ),
        GetPage(
          name: Customer43aScreen.routeName,
          middlewares: [AuthMiddleware()],
          page: () => const Customer43aScreen(),
        ),

        GetPage(
          name: Country48aScreen.routeName,
          middlewares: [AuthMiddleware()],
          page: () => const Country48aScreen(),
        ),
        GetPage(
          name: Currency49aScreen.routeName,
          middlewares: [AuthMiddleware()],
          page: () => const Currency49aScreen(),
        ),
        GetPage(
          name: Employee59aScreen.routeName,
          middlewares: [AuthMiddleware()],
          page: () => const Employee59aScreen(),
        ),
        GetPage(
          name: SystemReport70aScreen.routeName,
          middlewares: [AuthMiddleware()],
          page: () => const SystemReport70aScreen(),
        ),
        GetPage(
          name: Supplier71aScreen.routeName,
          middlewares: [AuthMiddleware()],
          page: () => const Supplier71aScreen(),
        ),
        GetPage(
          name: Product77aScreen.routeName,
          middlewares: [AuthMiddleware()],
          page: () => const Product77aScreen(),
        ),

        GetPage(
          name: SalesOrder96aScreen.routeName,
          page: () => SalesOrder96aScreen(),
        ),

        // *********************************************************************
        // *********************************************************************
        // *********************************************************************
        // *********************************************************************
        // GetPage(
        //   name: Employee04aScreen.routeName,
        //   middlewares: [AuthMiddleware()],
        //   page: () => const Employee04aScreen(),
        // ),
        // // .
        // GetPage(
        //   name: AppUser06aScreen.routeName,
        //   middlewares: [AuthMiddleware()],
        //   page: () => const AppUser06aScreen(),
        // ),
        //
        // GetPage(
        //   name: Demo07aScreen.routeName,
        //   middlewares: [AuthMiddleware()],
        //   page: () => const Demo07aScreen(),
        // ),
        //
        // //
        // GetPage(
        //   name: CatProduct13aScreen.routeName,
        //   middlewares: [AuthMiddleware()],
        //   page: () => const CatProduct13aScreen(),
        // ),
        //
        // // .
        // GetPage(
        //   name: Product17aScreen.routeName,
        //   middlewares: [AuthMiddleware()],
        //   page: () => const Product17aScreen(),
        // ),
        // GetPage(
        //   name: Employee20aScreen.routeName,
        //   middlewares: [AuthMiddleware()],
        //   page: () => const Employee20aScreen(),
        // ),
        // GetPage(
        //   name: Employee21aScreen.routeName,
        //   middlewares: [AuthMiddleware()],
        //   page: () => const Employee21aScreen(),
        // ),
        // GetPage(
        //   name: Employee22aScreen.routeName,
        //   middlewares: [AuthMiddleware()],
        //   page: () => const Employee22aScreen(),
        // ),
        // GetPage(
        //   name: SystemReport24aScreen.routeName,
        //   middlewares: [AuthMiddleware()],
        //   page: () => const SystemReport24aScreen(),
        // ),
        //
        // GetPage(
        //   name: Supplier27bScreen.routeName,
        //   middlewares: [AuthMiddleware()],
        //   page: () => const Supplier27bScreen(),
        // ),
        // // .
        // GetPage(
        //   name: Demo28aScreen.routeName,
        //   middlewares: [AuthMiddleware()],
        //   page: () => const Demo28aScreen(),
        // ),
        // GetPage(
        //   name: Demo29aScreen.routeName,
        //   middlewares: [AuthMiddleware()],
        //   page: () => const Demo29aScreen(),
        // ),
        // GetPage(
        //   name: Demo30aScreen.routeName,
        //   middlewares: [AuthMiddleware()],
        //   page: () => const Demo30aScreen(),
        // ),
        //
        // GetPage(
        //   name: CompanyExt31aScreen.routeName,
        //   middlewares: [AuthMiddleware()],
        //   page: () => const CompanyExt31aScreen(),
        // ),
        // // .
        // GetPage(
        //   name: Employee32aScreen.routeName,
        //   middlewares: [AuthMiddleware()],
        //   page: () => const Employee32aScreen(),
        // ),
        // .

        //
        // GetPage(
        //   name: Currency37aScreen.routeName,
        //   middlewares: [AuthMiddleware()],
        //   page: () => const Currency37aScreen(),
        // ),
        // //
        // GetPage(
        //   name: Currency38aScreen.routeName,
        //   middlewares: [AuthMiddleware()],
        //   page: () => const Currency38aScreen(),
        // ),
        // // .
        // GetPage(
        //   name: CdeDiagram39aScreen.routeName,
        //   middlewares: [AuthMiddleware()],
        //   page: () => const CdeDiagram39aScreen(),
        // ),
        //
        // // .
        // GetPage(
        //   name: BookExt41aScreen.routeName,
        //   middlewares: [AuthMiddleware()],
        //   page: () => const BookExt41aScreen(),
        // ),
        //
        // GetPage(
        //   name: Employee44aScreen.routeName,
        //   middlewares: [AuthMiddleware()],
        //   page: () => const Employee44aScreen(),
        // ),
        //
        // GetPage(
        //   name: Demo50aScreen.routeName,
        //   middlewares: [AuthMiddleware()],
        //   page: () => const Demo50aScreen(),
        // ),
        // GetPage(
        //   name: SystemLog51aScreen.routeName,
        //   middlewares: [AuthMiddleware()],
        //   page: () => const SystemLog51aScreen(),
        // ),
        // GetPage(
        //   name: BestSelling52aScreen.routeName,
        //   middlewares: [AuthMiddleware()],
        //   page: () => const BestSelling52aScreen(),
        // ),
        // GetPage(
        //   name: Country54aScreen.routeName,
        //   middlewares: [AuthMiddleware()],
        //   page: () => const Country54aScreen(),
        // ),
        // GetPage(
        //   name: Song56aScreen.routeName,
        //   page: () => const Song56aScreen(),
        // ),
        //
        // GetPage(
        //   name: Employee59bScreen.routeName,
        //   middlewares: [AuthMiddleware()],
        //   page: () => const Employee59bScreen(),
        // ),
        // GetPage(
        //   name: Employee59cScreen.routeName,
        //   middlewares: [AuthMiddleware()],
        //   page: () => const Employee59cScreen(),
        // ),
        // GetPage(
        //   name: EmpEmploymentHistory60aScreen.routeName,
        //   middlewares: [AuthMiddleware()],
        //   page: () => const EmpEmploymentHistory60aScreen(),
        // ),
        // GetPage(
        //   name: Country61aScreen.routeName,
        //   middlewares: [AuthMiddleware()],
        //   page: () => const Country61aScreen(),
        // ),
        // GetPage(
        //   name: Demo64aScreen.routeName,
        //   middlewares: [AuthMiddleware()],
        //   page: () => const Demo64aScreen(),
        // ),
        // GetPage(
        //   name: Demo65aScreen.routeName,
        //   middlewares: [AuthMiddleware()],
        //   page: () => const Demo65aScreen(),
        // ),
        // GetPage(
        //   name: Demo69aScreen.routeName,
        //   middlewares: [AuthMiddleware()],
        //   page: () => const Demo69aScreen(),
        // ),
        //
        // GetPage(
        //   name: Supplier71bScreen.routeName,
        //   middlewares: [AuthMiddleware()],
        //   page: () => const Supplier71bScreen(),
        // ),
        //
        // GetPage(
        //   name: Demo79aScreen.routeName,
        //   middlewares: [AuthMiddleware()],
        //   page: () => const Demo79aScreen(),
        // ),
        // GetPage(
        //   name: Demo82aScreen.routeName,
        //   middlewares: [AuthMiddleware()],
        //   page: () => const Demo82aScreen(),
        // ),
        // GetPage(
        //   name: ProjectContributor84aScreen.routeName,
        //   middlewares: [AuthMiddleware()],
        //   page: () => const ProjectContributor84aScreen(),
        // ),
        // GetPage(
        //   name: FootballPlayer86aScreen.routeName,
        //   middlewares: [AuthMiddleware()],
        //   page: () => const FootballPlayer86aScreen(),
        // ),
        // GetPage(
        //   name: ProjectContributor98aScreen.routeName,
        //   middlewares: [AuthMiddleware()],
        //   page: () => const ProjectContributor98aScreen(),
        // ),
      ],
    );
  }
}

void _hideHtmlLoadingProgress() {
  try {
    // Call "hideProgress" function in "web/index.html" to hide Loading progress.
    js.context.callMethod('hideProgress', []);
  } catch (e) {}
}
