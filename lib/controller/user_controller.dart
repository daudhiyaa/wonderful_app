import 'dart:developer';

import 'package:get/get.dart';
import 'package:wonderful_app/api/api_services.dart';

class UserController extends GetxController {
  var selectedUser = "Selected User Name".obs;
  var users = [].obs;
  var isLoading = true.obs;

  void setUsers(List<dynamic> data) {
    users.value = data;
  }

  void selectUser(String usn) {
    selectedUser.value = usn;
  }

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  Future<void> fetchUsers() async {
    try {
      final ApiService apiService = ApiService();
      isLoading(true);
      final response = await apiService.getUsers();
      users.assignAll(response['data'] ?? []);
    } catch (e) {
      log('Error fetching users data: $e');
    } finally {
      isLoading(false);
    }
  }

  String get usn => selectedUser.value;
}
