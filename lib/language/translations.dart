import '/language/utils/langs/ar.dart';
import '/language/utils/langs/en.dart';
import 'package:get/get.dart';


class Translation extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'ar': ar,
      };
}
