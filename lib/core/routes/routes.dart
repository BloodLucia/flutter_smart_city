import 'package:get/get.dart';
import 'package:smart_city_getx/features/app/binding.dart';
import 'package:smart_city_getx/features/auth/binding.dart';

import '../../features/app/view.dart';
import '../../features/auth/login_page.dart';
import '../../features/home/view.dart';
import '../../features/modules/modules.dart';

class AppRoutes {
  static List<GetPage> pages = [
    GetPage(
      name: '/login',
      page: () => const LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: '/app',
      page: () => const AppPage(),
      binding: ApplicationBinding(),
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
