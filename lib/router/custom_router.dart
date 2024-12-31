
import 'package:projectmanagers/Screen/Auth/Memper/Member_screen.dart';
import 'package:projectmanagers/Screen/Auth/login/login_screen.dart';
import 'package:projectmanagers/Screen/Examploe/examole_screen.dart';
import 'package:projectmanagers/Screen/MenuDrawer/profile/change_password_screen.dart';
import 'package:projectmanagers/Screen/MenuDrawer/profile/prpfile_screen.dart';
import 'package:projectmanagers/Screen/Notifcation/notifcation_screen.dart';
import 'package:projectmanagers/Screen/Projects/ProjectsDetails/DocumentLibrary/document_library_screen.dart';
import 'package:projectmanagers/Screen/Projects/ProjectsDetails/FinancialInformation/financial_information_screen.dart';
import 'package:projectmanagers/Screen/Projects/ProjectsDetails/TasksPerformed/tasks_performed_screen.dart';
import 'package:projectmanagers/Screen/Projects/ProjectsDetails/TechnicalInformation/technical_information_screen.dart';
import 'package:projectmanagers/Screen/Projects/ProjectsDetails/projects_details_screen.dart';
import 'package:projectmanagers/Screen/Projects/projects_screen.dart';
import 'package:projectmanagers/Screen/card_wizard_overlap.dart';
import 'package:projectmanagers/Screen/dashboard/ElectronicServices/electronic_services_screen.dart';
import 'package:projectmanagers/Screen/dashboard/KeeperCovenant/AddKeeperCovenant/add_keeper_covenant_screen.dart';
import 'package:projectmanagers/Screen/dashboard/KeeperCovenant/keeper_covenant_screen.dart';
import 'package:projectmanagers/Screen/dashboard/Reports/reports_screen.dart';
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
          name: RoutingApp.notfcations_screen,
          page: () => NotifcationScreen(),
          bindings: [
            NotifcationBinding(),
          ]
      ),

      GetPage(
        transition: Transition.native,
        transitionDuration: Duration(milliseconds: 400),
        name: RoutingApp.dashboardRoute,
        page: () => DashboardScreen(pageIndex: 0,),
      ),



      GetPage(
          transition: Transition.native,
          transitionDuration: Duration(milliseconds: 400),
          name: RoutingApp.notfcations_screen,
          page: () => NotifcationScreen(),
          bindings: [
            NotifcationBinding(),
          ]
      ),
      GetPage(
          transition: Transition.native,
          transitionDuration: Duration(milliseconds: 400),
          name: RoutingApp.electronic_services_screen,
          page: () => ElectronicServicesScreen(),
          bindings: [
            ElectronicServicesBinding(),
          ]
      ),
      GetPage(
          transition: Transition.native,
          transitionDuration: Duration(milliseconds: 400),
          name: RoutingApp.keeper_covenant_screen,
          page: () => KeeperCovenantScreen(),
          bindings: [
            KeeperCovenantBinding(),
          ]
      ),
      GetPage(
          transition: Transition.native,
          transitionDuration: Duration(milliseconds: 400),
          name: RoutingApp.add_keeper_covenant_screen,
          page: () => AddKeeperCovenantScreen(),
          bindings: [
            AddKeeperCovenantBinding(),
          ]
      ),
      GetPage(
          transition: Transition.native,
          transitionDuration: Duration(milliseconds: 400),
          name: RoutingApp.reports_screen,
          page: () => ReportsScreen(),
          bindings: [
            ReportsBinding(),
          ]
      ),

      GetPage(
          transition: Transition.native,
          transitionDuration: Duration(milliseconds: 400),
          name: RoutingApp.projects_screen,
          page: () => ProjectsScreen(),
          bindings: [
            ProjectsBinding(),
          ]
      ),
      GetPage(
          transition: Transition.native,
          transitionDuration: Duration(milliseconds: 400),
          name: RoutingApp.projects_details_screen,
          page: () => ProjectsDetailsScreen(),
          bindings: [
            ProjectsDetailsBinding(),
          ]
      ),
      GetPage(
          transition: Transition.native,
          transitionDuration: Duration(milliseconds: 400),
          name: RoutingApp.financial_information_screen,
          page: () => FinancialInformationScreen(),
          bindings: [
            FinancialInformationBinding(),
          ]
      ),
      GetPage(
          transition: Transition.native,
          transitionDuration: Duration(milliseconds: 400),
          name: RoutingApp.document_library_screen,
          page: () => DocumentLibraryScreen(),
          bindings: [
            DocumentLibraryBinding(),
          ]
      ),
      GetPage(
          transition: Transition.native,
          transitionDuration: Duration(milliseconds: 400),
          name: RoutingApp.technical_information_screen,
          page: () => TechnicalInformationScreen(),
          bindings: [
            TechnicalInformationBinding(),
          ]
      ),
      GetPage(
          transition: Transition.native,
          transitionDuration: Duration(milliseconds: 400),
          name: RoutingApp.tasks_performed_screen,
          page: () => TasksPerformedScreen(),
          bindings: [
            TasksPerformedBinding(),
          ]
      ),



    ];
  }
}
