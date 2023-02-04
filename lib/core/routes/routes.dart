import 'package:get/get.dart';

import '../../features/app/view.dart';
import '../../features/auth/view/login_view.dart';
import '../../features/home/view.dart';
import '../../features/modules/modules.dart';
import 'names.dart';

class AppRoutes {
  static List<GetPage> pages = [
    GetPage(
      name: RouteNames.SIGN_IN,
      page: () => LoginView(),
    ),
    GetPage(
      name: '/app',
      page: () => const AppPage(),
    ),
    GetPage(
      name: '/home',
      page: () => const HomePage(),
    ),

    /// 停哪儿
    GetPage(
      name: '/park',
      page: () => const ParkPage(),
    ),

    /// 城市地铁
    GetPage(
      name: '/metro_query',
      page: () => const MetroQueryPage(),
    ),

    /// 智慧巴士
    GetPage(
      name: '/bus_query',
      page: () => const BusQueryPage(),
    ),

    /// 门诊预约
    GetPage(
      name: '/outpatient',
      page: () => const OutpatientPage(),
    ),

    /// 智慧交管
    GetPage(
      name: '/traffic',
      page: () => const TrafficPage(),
    ),

    /// 生活缴费
    GetPage(
      name: '/living_expenses',
      page: () => const LivingExpenses(),
    ),

    /// 外卖订餐
    GetPage(
      name: '/takeout',
      page: () => const TakeOutPage(),
    ),
  ];
}
