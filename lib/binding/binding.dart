


import 'package:projectmanagers/Screen/Auth/Memper/member_controller.dart';
import 'package:projectmanagers/Screen/Auth/login/login_controller.dart';
import 'package:projectmanagers/Screen/MenuDrawer/profile/profile_controller.dart';
import 'package:projectmanagers/Screen/Notifcation/notifcation_controller.dart';
import 'package:projectmanagers/Screen/Projects/ProjectsDetails/DocumentLibrary/document_library_controller.dart';
import 'package:projectmanagers/Screen/Projects/ProjectsDetails/FinancialInformation/financial_information_controller.dart';
import 'package:projectmanagers/Screen/Projects/ProjectsDetails/TasksPerformed/tasks_performed_controller.dart';
import 'package:projectmanagers/Screen/Projects/ProjectsDetails/TechnicalInformation/technical_information_controller.dart';
import 'package:projectmanagers/Screen/Projects/ProjectsDetails/projects_details_controller.dart';
import 'package:projectmanagers/Screen/Projects/projects_controller.dart';
import 'package:projectmanagers/Screen/dashboard/ElectronicServices/electronic_services_controller.dart';
import 'package:projectmanagers/Screen/dashboard/KeeperCovenant/keeper_covenant_controller.dart';
import 'package:projectmanagers/Screen/dashboard/Reports/reports_controller.dart';

import '/apiservice/checkInterNet.dart';
import 'package:get/get.dart';



// Maine
class InternetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckInterNet>(
          () => CheckInterNet(),
    );
  }
}
class MemberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MemberController>(() => MemberController(),
    );

  }
}
class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(),
    );
  }
}

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController(),
    );

  }
}
class ChangPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController(),
    );

  }
}


class NotifcationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotifcationController>(() => NotifcationController(),
    );

  }
}




class ReportsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportsController>(() => ReportsController(),
    );

  }
}
class KeeperCovenantBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KeeperCovenantController>(() => KeeperCovenantController(),
    );

  }
}
class ElectronicServicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ElectronicServicesController>(() => ElectronicServicesController(),
    );

  }
}

class ProjectsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProjectsController>(() => ProjectsController(),
    );

  }
}
class ProjectsDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProjectsDetailsController>(() => ProjectsDetailsController(),
    );

  }
}
class FinancialInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FinancialInformationController>(() => FinancialInformationController(),
    );

  }
}
class DocumentLibraryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DocumentLibraryController>(() => DocumentLibraryController(),
    );

  }
}
class TechnicalInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TechnicalInformationController>(() => TechnicalInformationController(),
    );

  }
}
class TasksPerformedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TasksPerformedController>(() => TasksPerformedController(),
    );

  }
}



