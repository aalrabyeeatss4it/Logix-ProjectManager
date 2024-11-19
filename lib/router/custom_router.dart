
import 'package:projectmanagers/Screen/Auth/Memper/Member_screen.dart';
import 'package:projectmanagers/Screen/Auth/login/login_screen.dart';
import 'package:projectmanagers/Screen/Examploe/examole_screen.dart';
import 'package:projectmanagers/Screen/MenuDrawer/profile/change_password_screen.dart';
import 'package:projectmanagers/Screen/MenuDrawer/profile/prpfile_screen.dart';
import 'package:projectmanagers/Screen/card_wizard_overlap.dart';
import 'package:projectmanagers/Screen/dashboard/dashboard_screen.dart';
import 'package:projectmanagers/Screen/splash_screen.dart';
import 'package:projectmanagers/binding/binding.dart';
import 'package:projectmanagers/router/route_constants.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class Pages {
  static List<GetPage> pages() {
    return [
      GetPage(
        transition: Transition.native,
        transitionDuration: Duration(milliseconds: 400),
        name: RoutingApp.Exampole,
        page: () => ExamoleScreen(),
      ),

      GetPage(
        transition: Transition.native,
        transitionDuration: Duration(milliseconds: 400),
        name: RoutingApp.splashRoute,
        page: () => SplashScreen(),
      ),
      GetPage(
        transition: Transition.native,
        transitionDuration: Duration(milliseconds: 400),
        name: RoutingApp.cardWizardOverlapScreenRoute,
        page: () => CardWizardOverlapRoute(),
      ),

      GetPage(
          transition: Transition.native,
          transitionDuration: Duration(milliseconds: 400),
          name: RoutingApp.member_screen,
          page: () => MemberScreen(),
          bindings: [
            MemberBinding(),
          ]
      ),
      GetPage(
          transition: Transition.native,
          transitionDuration: Duration(milliseconds: 400),
          name: RoutingApp.login_route,
          page: () => LoginScreen(),
          bindings: [
            LoginBinding(),
          ]
      ),


      GetPage(
          transition: Transition.native,
          transitionDuration: Duration(milliseconds: 400),
          name: RoutingApp.profile_screen,
          page: () => ProfileScreen(),
          bindings: [
            ProfileBinding(),
          ]
      ),
      GetPage(
          transition: Transition.native,
          transitionDuration: Duration(milliseconds: 400),
          name: RoutingApp.change_password_screen,
          page: () => ChangPasswordScreen(),
          bindings: [
            ChangPasswordBinding(),
          ]
      ),

      GetPage(
        transition: Transition.native,
        transitionDuration: Duration(milliseconds: 400),
        name: RoutingApp.dashboardRoute,
        page: () => DashboardScreen(pageIndex: 0,),
      ),




    ];
  }
}
