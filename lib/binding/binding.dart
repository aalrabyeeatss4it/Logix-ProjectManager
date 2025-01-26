


import 'package:projectmanagers/Screen/Auth/Memper/member_controller.dart';
import 'package:projectmanagers/Screen/Auth/login/login_controller.dart';
import 'package:projectmanagers/Screen/ElectronicServices/ArchiveDocumentProject/add_archive_document_project_controller.dart';
import 'package:projectmanagers/Screen/ElectronicServices/CloseProject/add_close_project_controller.dart';
import 'package:projectmanagers/Screen/ElectronicServices/ExchangeRequest/add_request_exchange_controller.dart';
import 'package:projectmanagers/Screen/ElectronicServices/LessonsProject/add_lisince_project_controller.dart';
import 'package:projectmanagers/Screen/ElectronicServices/PurchaseRequest/add_request_purchase_controller.dart';
import 'package:projectmanagers/Screen/ElectronicServices/RequestCovenant/request_covenant_controller.dart';
import 'package:projectmanagers/Screen/ElectronicServices/ResourceProject/add_resource_project_controller.dart';
import 'package:projectmanagers/Screen/ElectronicServices/UpdatePlan/UpdatePlaneProject/update_plane_project_controller.dart';
import 'package:projectmanagers/Screen/ElectronicServices/UpdatePlan/update_plan_controller.dart';
import 'package:projectmanagers/Screen/ElectronicServices/UplodeReportProject/add_uplode_report_project_controller.dart';
import 'package:projectmanagers/Screen/ElectronicServices/electronic_services_controller.dart';
import 'package:projectmanagers/Screen/KeeperCovenant/AddKeeperCovenant/add_keeper_covenant_controller.dart';
import 'package:projectmanagers/Screen/KeeperCovenant/keeper_covenant_controller.dart';
import 'package:projectmanagers/Screen/MenuDrawer/profile/profile_controller.dart';
import 'package:projectmanagers/Screen/Notifcation/notifcation_controller.dart';
import 'package:projectmanagers/Screen/Projects/ProjectsDetails/DocumentLibrary/document_library_controller.dart';
import 'package:projectmanagers/Screen/Projects/ProjectsDetails/FinancialInformation/financial_information_controller.dart';
import 'package:projectmanagers/Screen/Projects/ProjectsDetails/TasksPerformed/tasks_performed_controller.dart';
import 'package:projectmanagers/Screen/Projects/ProjectsDetails/TechnicalInformation/technical_information_controller.dart';
import 'package:projectmanagers/Screen/Projects/ProjectsDetails/projects_details_controller.dart';
import 'package:projectmanagers/Screen/Projects/projects_controller.dart';
import 'package:projectmanagers/Screen/Reports/ArchivedDocumentsReport/archived_documents_report_controller.dart';
import 'package:projectmanagers/Screen/Reports/CompletionRateReport/completion_rate_report_controller.dart';
import 'package:projectmanagers/Screen/Reports/ReportOnCompletedTasks/report_completed_tasks_controller.dart';
import 'package:projectmanagers/Screen/Reports/reports_controller.dart';

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
class ArchivedDocumentsReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArchivedDocumentsReportController>(() => ArchivedDocumentsReportController(),
    );

  }
}
class CompletionRateReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompletionRateReportController>(() => CompletionRateReportController(),
    );

  }
}
class ReportOnCompletedTasksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportOnCompletedTasksController>(() => ReportOnCompletedTasksController(),
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
class AddKeeperCovenantBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddKeeperCovenantController>(() => AddKeeperCovenantController(),
    );

  }
}
class AddUpdatePlanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdatePlanController>(() => UpdatePlanController(),);

  }
}
class UpdatePlaneProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdatePlaneProjectController>(() => UpdatePlaneProjectController(),);

  }
}







//الخدمات الالكترونية
class ElectronicServicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ElectronicServicesController>(() => ElectronicServicesController(),
    );

  }
}
class AddCloseProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut< AddCloseProjectController>(() =>  AddCloseProjectController(),);

  }
}
class AddUplodeReportProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut< AddUplodeReportProjectController>(() =>  AddUplodeReportProjectController(),);

  }
}
class AddArchiveDocumentProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut< AddArchiveDocumentProjectController>(() =>  AddArchiveDocumentProjectController(),);

  }
}
class AddLessonsProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut< AddLessonsProjectController>(() =>  AddLessonsProjectController(),);

  }
}
class AddResourceProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut< AddResourceProjectController>(() =>  AddResourceProjectController(),);

  }
}
class RequestCovenantBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut< RequestCovenantController>(() =>  RequestCovenantController(),);

  }
}
class AddRequestExchangeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut< AddRequestExchangeController>(() =>  AddRequestExchangeController(),);

  }
}
class AddRequestPurchaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut< AddPurchaseRequestController>(() =>  AddPurchaseRequestController(),);

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



