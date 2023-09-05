import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  SharedPreferenceService() {
    init();
  }

  late SharedPreferences sharedPreferences;
  static String valueSharedPreferences = 'playersProfile';
  static String lastId = 'last_player_id';

  static Future<SharedPreferences> init() async {
    try {
      return await SharedPreferences.getInstance();
    } catch (err) {
      SharedPreferences.setMockInitialValues({});
      return SharedPreferences.getInstance();
    }
  }

  Future<bool> saveUserData(value, {id}) async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (id == null || (id != null && await sharedPreferences.setInt(lastId, id))) {
      return await sharedPreferences.setStringList(valueSharedPreferences, value);
    } else {
      return false;
    }
  }

  Future<List<String>> readUserData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getStringList(valueSharedPreferences) ?? [];
  }

  Future<int> readLastId() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(lastId) ?? 0;
  }

  Future<void> deleteAll() async {
    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}
