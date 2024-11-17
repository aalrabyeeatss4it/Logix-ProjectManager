


import 'package:projectmanagers/Screen/Auth/Memper/member_controller.dart';
import 'package:projectmanagers/Screen/Auth/login/login_controller.dart';
import 'package:projectmanagers/Screen/MenuDrawer/profile/profile_controller.dart';

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

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(),
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
class ChangPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController(),
    );

  }
}






// class NewissuedBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<NewissuedController>(() => NewissuedController(),
//     );
//
//   }
// }
// class NewarrivalBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<NewarrivalController>(() => NewarrivalController(),
//     );
//
//   }
// }
// class FastOutgoingBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<FastOutgoingController>(() => FastOutgoingController(),
//     );
//
//   }
// }
// class FastIncomingBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<FastIncomingController>(() => FastIncomingController(),
//     );
//
//   }
// }
// class FilesArchivingBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<FilesArchivingController>(() => FilesArchivingController(),
//     );
//
//   }
// }








// Inquiries
// class InquiriesBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<InquiriesController>(() => InquiriesController(),
//     );
//
//   }
// }
// class SearchInTheExportBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<SearchInTheExportController>(() => SearchInTheExportController(),
//     );
//
//   }
// }
// class SearchInTheExportDetailsBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<SearchInTheExportDetailsController>(() => SearchInTheExportDetailsController(),
//     );
//
//   }
// }
//
//
// class SearchInWordBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<SearchInWordController>(() => SearchInWordController(),
//     );
//
//   }
// }
// class SearchInWordDetailsBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<SearchInWordDetailsController>(() => SearchInWordDetailsController(),
//     );
//
//   }
// }
//
//
// class GeneralInquiryBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<GeneralInquiryController>(() => GeneralInquiryController(),
//     );
//
//   }
// }
// class GeneralInquiryDetailsBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<GeneralInquiryDetailsController>(() => GeneralInquiryDetailsController(),
//     );
//
//   }
// }
// class SearchTheArchiveBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<SearchTheArchiveController>(() => SearchTheArchiveController(),
//     );
//
//   }
// }
// class SearchTheArchiveDetailsBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<SearchTheArchiveDetailsController>(() => SearchTheArchiveDetailsController(),
//     );
//
