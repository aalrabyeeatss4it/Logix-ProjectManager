
import 'package:projectmanagers/Screen/Auth/Memper/Member_screen.dart';
import 'package:projectmanagers/Screen/Auth/login/login_screen.dart';
import 'package:projectmanagers/Screen/Examploe/examole_screen.dart';
import 'package:projectmanagers/Screen/MenuDrawer/profile/change_password_screen.dart';
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
        name: RoutingApp.cardWizardOverlapScreenRoute,
        page: () => CardWizardOverlapRoute(),
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
          name: RoutingApp.member_screen,
          page: () => MemberScreen(),
          bindings: [
            MemberBinding(),
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
          name: RoutingApp.login_route,
          page: () => LoginScreen(),
          bindings: [
            LoginBinding(),
          ]
      ),
      GetPage(
        transition: Transition.native,
        transitionDuration: Duration(milliseconds: 400),
        name: RoutingApp.dashboardRoute,
        page: () => DashboardScreen(pageIndex: 0,),
      ),



      // InternalMessaging

      // GetPage(
      //     transition: Transition.native,
      //     transitionDuration: Duration(milliseconds: 400),
      //     name: RoutingApp.fast_outgoing_screen,
      //     page: () => FastOutgoingScreen(),
      //     bindings: [
      //       FastOutgoingBinding(),
      //     ]
      // ),
      // GetPage(
      //     transition: Transition.native,
      //     transitionDuration: Duration(milliseconds: 400),
      //     name: RoutingApp.fast_incoming_screen,
      //     page: () => FastIncomingScreen(),
      //     bindings: [
      //       FastIncomingBinding(),
      //     ]
      // ),
      //
      //
      //
      // GetPage(
      //     transition: Transition.native,
      //     transitionDuration: Duration(milliseconds: 400),
      //     name: RoutingApp.new_issued,
      //     page: () => NewissuedScreen(),
      //     bindings: [
      //       NewissuedBinding(),
      //     ]
      // ),
      // GetPage(
      //     transition: Transition.native,
      //     transitionDuration: Duration(milliseconds: 400),
      //     name: RoutingApp.new_arrival,
      //     page: () => NewarrivalScreen(),
      //     bindings: [
      //       NewarrivalBinding(),
      //     ]
      // ),
      // GetPage(
      //     transition: Transition.native,
      //     transitionDuration: Duration(milliseconds: 400),
      //     name: RoutingApp.files_archiving_screen,
      //     page: () => FilesArchivingScreen(),
      //     bindings: [
      //       FilesArchivingBinding(),
      //     ]
      // ),
      // GetPage(
      //     transition: Transition.native,
      //     transitionDuration: Duration(milliseconds: 400),
      //     name: RoutingApp.archiving_screen,
      //     page: () => ArchivingScreen(),
      // ),
      //
      //
      // // Inquiries
      // GetPage(
      //     transition: Transition.native,
      //     transitionDuration: Duration(milliseconds: 400),
      //     name: RoutingApp.inquiries_screen,
      //     page: () => InquiriesScreen(),
      //     bindings: [
      //       InquiriesBinding(),
      //     ]
      // ),
      // GetPage(
      //     transition: Transition.native,
      //     transitionDuration: Duration(milliseconds: 400),
      //     name: RoutingApp.search_in_export_screen,
      //     page: () => SearchInTheExportScreen(),
      //     bindings: [
      //       SearchInTheExportBinding(),
      //     ]
      // ),
      // GetPage(
      //     transition: Transition.native,
      //     transitionDuration: Duration(milliseconds: 400),
      //     name: RoutingApp.search_in_export_details_screen,
      //     page: () => SearchInTheExportDetailsScreen(),
      //     bindings: [
      //       SearchInTheExportDetailsBinding(),
      //     ]
      // ),
      //
      // GetPage(
      //     transition: Transition.native,
      //     transitionDuration: Duration(milliseconds: 400),
      //     name: RoutingApp.search_in_word_screen,
      //     page: () => SearchInWordScreen(),
      //     bindings: [
      //       SearchInWordBinding(),
      //     ]
      // ),
      // GetPage(
      //     transition: Transition.native,
      //     transitionDuration: Duration(milliseconds: 400),
      //     name: RoutingApp.search_in_word_details_screen,
      //     page: () => SearchInWordDetailsScreen(),
      //     bindings: [
      //       SearchInWordDetailsBinding(),
      //     ]
      // ),
      //
      // GetPage(
      //     transition: Transition.native,
      //     transitionDuration: Duration(milliseconds: 400),
      //     name: RoutingApp.general_inquiry_screen,
      //     page: () => GeneralInquiryScreen(),
      //     bindings: [
      //       GeneralInquiryBinding(),
      //     ]
      // ),
      // GetPage(
      //     transition: Transition.native,
      //     transitionDuration: Duration(milliseconds: 400),
      //     name: RoutingApp.general_inquiry_details_screen,
      //     page: () => GeneralInquiryDetailsScreen(),
      //     bindings: [
      //       GeneralInquiryDetailsBinding(),
      //     ]
      // ),
      //
      // GetPage(
      //     transition: Transition.native,
      //     transitionDuration: Duration(milliseconds: 400),
      //     name: RoutingApp.search_the_archive_screen,
      //     page: () => SearchTheArchiveScreen(),
      //     bindings: [
      //       SearchTheArchiveBinding(),
      //     ]
      // ),
      // GetPage(
      //     transition: Transition.native,
      //     transitionDuration: Duration(milliseconds: 400),
      //     name: RoutingApp.search_the_archive_details_screen,
      //     page: () => SearchTheArchiveDetailsScreen(),
      //     bindings: [
      //       SearchTheArchiveDetailsBinding(),
      //     ]
      // ),







    ];
  }
}
