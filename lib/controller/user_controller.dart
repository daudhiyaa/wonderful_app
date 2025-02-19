import 'dart:developer';

import 'package:get/get.dart';
import 'package:wonderful_app/api/api_services.dart';

class UserController extends GetxController {
  var selectedUser = "Selected User Name".obs;
  var users = [].obs;
  var isLoading = true.obs;
  var currentPage = 1.obs;
  var totalPages = 0.obs;

  String get usn => selectedUser.value;
  int get currPage => currentPage.value;
  int get maxPage => totalPages.value;

  void setUsers(List<dynamic> data) => users.value = data;
  void selectUser(String usn) => selectedUser.value = usn;
  void setCurrentPage(int page) => currentPage.value = page;
  void nextPage() => currentPage.value += 1;
  void setMaxPage(int mx) => totalPages.value = mx;

  @override
  void onInit() {
    fetchUsers(currPage);
    super.onInit();
  }

  Future<void> fetchUsers(int page) async {
    try {
      final ApiService apiService = ApiService();
      isLoading(true);
      final response = await apiService.getUsers(page, 11);
      users.addAll(response['data']);
      setMaxPage(response['total_pages']);
    } catch (e) {
      log('Error fetching users data: $e');
    } finally {
      isLoading(false);
    }
  }
}
