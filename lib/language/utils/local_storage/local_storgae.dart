import 'package:get_storage/get_storage.dart';
import 'package:projectmanagers/Constants/Constants.dart';

class LocalStorage {

  /// Write
  void saveLanguageToDisk (String langusage)async{
    await stg.write('lang', langusage);
  }

  /// Read
  Future<String> get languageSelected async{
    return await stg.read('lang')??"ar";
  }
}