import 'package:trading/features/analyzer/presentation/screens/analyzer_details_screen.dart';
import 'package:trading/features/analyzer/presentation/screens/analyzer_heat_map_screen.dart';
import 'package:trading/features/analyzer/presentation/screens/analyzer_test_screen.dart';
import 'package:trading/features/analyzer/presentation/screens/filter_screen.dart';
import 'package:trading/features/analyzer/presentation/screens/analyzer_screen.dart';
import 'package:trading/features/auth/presentation/screens/auth_flow_screen.dart';
import 'package:trading/features/chat/presentation/screens/chat_inbox_screen.dart';
import 'package:trading/features/chat/presentation/screens/chat_screen.dart';
import 'package:trading/features/common/presentation/screens/graph_chart_screen.dart';
import 'package:trading/features/compare/presentation/screens/compare_screens.dart';
import 'package:trading/features/compare/presentation/screens/comparison_screen.dart';
import 'package:trading/features/compare/presentation/screens/filter_prop_screeen.dart';
import 'package:trading/features/compare/presentation/screens/firm_details_screen.dart';
import 'package:trading/features/copier/presentation/screens/advance_setting_screen.dart';
import 'package:trading/features/copier/presentation/screens/calculate_risk_screen.dart';
import 'package:trading/features/copier/presentation/screens/copier_screen.dart';
import 'package:trading/features/copier/presentation/screens/edit_slave_screen.dart';
import 'package:trading/features/copier/presentation/screens/edit_template_screen.dart';
import 'package:trading/features/copier/presentation/screens/map_symbol_screen.dart';
import 'package:trading/features/copier/presentation/screens/master_account_screen.dart';
import 'package:trading/features/copier/presentation/screens/slave_account_screen.dart';
import 'package:trading/features/copier/presentation/screens/trading_hour_screen.dart';
import 'package:trading/features/dashboard_account/presentation/screens/account_management_screen.dart';
import 'package:trading/features/dashboard_account/presentation/screens/account_screen.dart';
import 'package:trading/features/dashboard_account/presentation/screens/add_account_screen.dart';
import 'package:trading/features/dashboard_account/presentation/screens/equity_protector_screen.dart';
import 'package:trading/features/dashboard_account/presentation/screens/dashboard_screen.dart';
import 'package:trading/features/dashboard_account/presentation/screens/tranding_symbol_screen.dart';
import 'package:trading/features/nav_bar/presentation/screens/main_nab_bar_screen.dart';
import 'package:trading/features/profile_screen/presentation/screens/profile_screen.dart';
import 'package:trading/features/sentiments/presentation/screens/sentiments_screen.dart';
import 'package:trading/features/splash/presentation/screens/splash_screen.dart';
import 'package:get/get.dart';

///=========================App Routes=========================

class AppRoutes {
  static const String splashScreen = "/splashScreen";
  static const String authFlowScreen = "/authFlow";
  static const String accountScreen = "/accountScreen";
  static const String analyzerScreen = "/analyzerScreen";
  static const String analyzerTestScreen = "/analyzerTestScreen";
  static const String analyzerDetailsScreen = "/analyzerDetailsScreen";
  static const String analyzerHeatMapScreen = "/analyzerHeatMapScreen";
  static const String filterScreen = "/filterScreen";

  static const String mainNavScreen = "/mainNavScreen";

  static const String sentimentsScreen = "/sentimentsScreen";
  static const String graphChartScreen = "/graphChartScreen";
  static const String dashboardScreen = "/dashboardScreen";
  static const String equityProtectorScreen = '/equityProtectorScreen';
  static const String tradingSymbolScreen = '/tradingSymbolScreen';
  static const String addAccountScreen = '/addAccountScreen';
  static const String accountManagementScreen = "/accountManagementScreen";

  ///compare section ========================================================
  static const String compareScreen = "/compareScreen";
  static const String comparisonScreen = "/comparisonScreen";
  static const String filterPropScreen = "/filterPropScreen";
  static const String firmDetailsScreen = "/firmDetailsScreen";

  ///copier section ========================================================
  static const String copierScreen = "/copierScreen";
  static const String advanceSettingScreen = "/advanceSettingScreen";
  static const String calculateRiskScreen = "/calculateRiskScreen";
  static const String editSlaveScreen = "/editSlaveScreen";
  static const String editTemplateScreen = "/editTemplateScreen";
  static const String mapSymbolScreen = "/mapSymbolScreen";
  static const String masterAccountScreen = "/masterAccountScreen";
  static const String slaveAccountScreen = "/slaveAccountScreen";
  static const String tradingHourScreen = "/tradingHourScreen";

  ///chat===========================================================
  static const String chatScreen = "/chatScreen";
  static const String chatInboxScreen = "/chatInboxScreen";

  ///profile section ========================================================
  static const String profileScreen = "/profileScreen";

  static List<GetPage> routes = [
    ///===========================Authentication==========================
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: authFlowScreen, page: () => AuthFlowScreen()),
    GetPage(name: mainNavScreen, page: () => MainNavScreen()),

    GetPage(name: accountScreen, page: () => AccountScreen()),
    GetPage(name: analyzerTestScreen, page: () => AnalyzerTestScreen()),
    GetPage(name: analyzerDetailsScreen, page: () => AnalyzerDetailsScreen()),
    GetPage(name: analyzerHeatMapScreen, page: () => AnalyzerHeatmapScreen()),
    GetPage(name: sentimentsScreen, page: () => SentimentsScreen()),
    GetPage(name: graphChartScreen, page: () => GraphChartScreen()),
    GetPage(name: dashboardScreen, page: () => DashboardScreen()),
    GetPage(name: equityProtectorScreen, page: () => EquityProtectorScreen()),
    GetPage(name: tradingSymbolScreen, page: () => TradingSymbolScreen()),
    GetPage(name: addAccountScreen, page: () => AddAccountScreen()),
    GetPage(name: filterScreen, page: () => FilterScreen()),
    GetPage(
      name: accountManagementScreen,
      page: () => AccountManagementScreen(),
    ),

    ///copier section===================
    GetPage(name: copierScreen, page: () => CopierScreen()),
    GetPage(name: advanceSettingScreen, page: () => AdvanceSettingScreen()),
    GetPage(name: calculateRiskScreen, page: () => CalculateRiskScreen()),
    GetPage(name: editSlaveScreen, page: () => EditSlaveScreen()),
    GetPage(name: editTemplateScreen, page: () => EditTemplateScreen()),
    GetPage(name: mapSymbolScreen, page: () => MapSymbolScreen()),
    GetPage(name: masterAccountScreen, page: () => MasterAccountScreen()),
    GetPage(name: slaveAccountScreen, page: () => SlaveAccountScreen()),
    GetPage(name: tradingHourScreen, page: () => TradingHourScreen()),

    ///compare section===================
    GetPage(name: compareScreen, page: () => CompareScreen()),
    GetPage(name: comparisonScreen, page: () => ComparisonScreen()),
    GetPage(name: filterPropScreen, page: () => FilterPropScreen()),
    GetPage(name: firmDetailsScreen, page: () => FirmDetailsScreen()),

    ///chat===============================================
    GetPage(name: chatScreen, page: () => ChatScreen()),
    GetPage(name: chatInboxScreen, page: () => ChatInboxScreen()),

    ///profile section===================
    GetPage(name: profileScreen, page: () => ProfileScreen()),

    ///test===============================================
    GetPage(name: analyzerScreen, page: () => AnalyzerScreen()),
  ];
}
