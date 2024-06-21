import 'dart:convert';
import '1-util.dart';

Future<String> getUserId() async {
  String userDataJson = await fetchUserData();
  Map<String, dynamic> userData = jsonDecode(userDataJson);
  return userData['id'];
}