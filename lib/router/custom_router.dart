
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
import 'package:projectmanagers/Screen/dashboard/ElectronicServices/ArchiveDocumentProject/add_archive_document_project_screen.dart';
import 'package:projectmanagers/Screen/dashboard/ElectronicServices/CloseProject/add_close_project_screen.dart';
import 'package:projectmanagers/Screen/dashboard/ElectronicServices/ExchangeRequest/add_request_exchange_screen.dart';
import 'package:projectmanagers/Screen/dashboard/ElectronicServices/ExchangeRequest/item_request_exchang_screen.dart';
import 'package:projectmanagers/Screen/dashboard/ElectronicServices/LessonsProject/add_lisince_project_screen.dart';
import 'package:projectmanagers/Screen/dashboard/ElectronicServices/PurchaseRequest/add_request_purchase_screen.dart';
import 'package:projectmanagers/Screen/dashboard/ElectronicServices/PurchaseRequest/item_request_purchase_screen.dart';
import 'package:projectmanagers/Screen/dashboard/ElectronicServices/RequestCovenant/request_covenant_screen.dart';
import 'package:projectmanagers/Screen/dashboard/ElectronicServices/ResourceProject/add_resource_project_screen.dart';
import 'package:projectmanagers/Screen/dashboard/ElectronicServices/UpdatePlan/UpdatePlaneProject/update_plane_project_screen.dart';
import 'package:projectmanagers/Screen/dashboard/ElectronicServices/UpdatePlan/update_plan_screen.dart';
import 'package:projectmanagers/Screen/dashboard/ElectronicServices/UplodeReportProject/add_uplode_report_project_screen.dart';
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


      //الخدمات الالكترونية
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
          name: RoutingApp.add_close_project_screen,
          page: () => AddCloseProjectScreen(),
          bindings: [
            AddCloseProjectBinding(),
          ]
      ),
      GetPage(
          transition: Transition.native,
          transitionDuration: Duration(milliseconds: 400),
          name: RoutingApp.add_uplode_report_project_screen,
          page: () => AddUplodeReportProjectScreen(),
          bindings: [
            AddUplodeReportProjectBinding(),
          ]
      ),
      GetPage(
          transition: Transition.native,
          transitionDuration: Duration(milliseconds: 400),
          name: RoutingApp.add_archive_document_project_screen,
          page: () => AddArchiveDocumentProjectScreen(),
          bindings: [
            AddArchiveDocumentProjectBinding(),
          ]
      ),
      GetPage(
          transition: Transition.native,
          transitionDuration: Duration(milliseconds: 400),
          name: RoutingApp.add_lisince_project_screen,
          page: () => AddLessonsProjectScreen(),
          bindings: [
            AddLessonsProjectBinding(),
          ]
      ),
      GetPage(
          transition: Transition.native,
          transitionDuration: Duration(milliseconds: 400),
          name: RoutingApp.add_resource_project_screen,
          page: () => AddResourceProjectScreen(),
          bindings: [
            AddResourceProjectBinding(),
          ]
      ),
      GetPage(
          transition: Transition.native,
          transitionDuration: Duration(milliseconds: 400),
          name: RoutingApp.add_request_covenant_screen,
          page: () => RequestCovenantScreen(),
          bindings: [
            RequestCovenantBinding(),
          ]
      ),
      GetPage(
          transition: Transition.native,
          transitionDuration: Duration(milliseconds: 400),
          name: RoutingApp.add_request_exchang_screen,
          page: () => AddRequestExchangeScreen(),
          bindings: [
            AddRequestExchangeBinding(),
          ]
      ),
      GetPage(
          transition: Transition.native,
          transitionDuration: Duration(milliseconds: 400),
          name: RoutingApp.add_request_purchase_screen,
          page: () => AddPurchaseRequestScreen(),
          bindings: [
            AddRequestPurchaseBinding(),
          ]
      ),
      GetPage(
          transition: Transition.native,
          transitionDuration: Duration(milliseconds: 400),
          name: RoutingApp.item_add_request_purchase_screen,
          page: () => ItemsPurchaseRequestScreen(),

      ),
      GetPage(
          transition: Transition.native,
          transitionDuration: Duration(milliseconds: 400),
          name: RoutingApp.item_add_request_exchang_screen,
          page: () => ItemsExchangRequestScreen(),

      ),
      GetPage(
          transition: Transition.native,
          transitionDuration: Duration(milliseconds: 400),
          name: RoutingApp.add_update_plan_screen,
          page: () => UpdatePlanScreen(),
          bindings: [
            AddUpdatePlanBinding(),
          ]
      ),
      GetPage(
          transition: Transition.native,
          transitionDuration: Duration(milliseconds: 400),
          name: RoutingApp.update_plan_project_screen,
          page: () => UpdatePlaneProjectScreen(),
          bindings: [
            UpdatePlaneProjectBinding(),
          ]
      ),




      //حافظة العهد
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
