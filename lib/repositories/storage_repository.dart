import 'dart:convert';
import 'package:life_counter/models/player_model.dart';
import '../services/shared_preference_service.dart';

class LocalStorage {
  final SharedPreferenceService storageService;

  LocalStorage({required this.storageService});

  Future<void> saveNewProfile(PlayerModel player) async {
    player.id = await getNewId();
    List<String> resp = await storageService.readUserData();
    resp.add(json.encode(player));
    await storageService.saveUserData(resp, id: int.parse(player.id));
  }

  Future<void> updateProfile(PlayerModel player) async {
    List<String> resp = await storageService.readUserData();
    List<PlayerModel> listPlayerProfiles = resp.map((e) => PlayerModel.fromJson(json.decode(e))).toList();
    int index = listPlayerProfiles.indexWhere((e) => e.id == player.id);
    resp[index] = json.encode(player);
    await storageService.saveUserData(resp);
  }

  Future<void> deleteProfile(String id) async {
    List<String> resp = await storageService.readUserData();
    List<PlayerModel> listPlayerProfiles = resp.map((e) => PlayerModel.fromJson(json.decode(e))).toList();
    resp.removeAt(listPlayerProfiles.indexWhere((e) => e.id == id));
    await storageService.saveUserData(resp);
  }

  Future<bool> profileExists(String id) async {
    List<String> resp = await storageService.readUserData();
    List<PlayerModel> listPlayerProfiles = resp.map((e) => PlayerModel.fromJson(json.decode(e))).toList();
    int index = listPlayerProfiles.indexWhere((e) => e.id == id);
    if (index == -1) {
      return false;
    } else {
      return true;
    }
  }

  Future<List<PlayerModel>> getListProfiles() async {
    var resp = await storageService.readUserData();
    return resp.isNotEmpty ? resp.map((e) => PlayerModel.fromJson(json.decode(e))).toList() : [];
  }

  Future<String> getNewId() async {
    return (await storageService.readLastId() + 1).toString();
  }

  Future<void> deleteAll() async {
    await storageService.deleteAll();
  }
}
