import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wonderful_app/components/appbar.dart';
import 'package:wonderful_app/controller/user_controller.dart';
import 'package:wonderful_app/themes/colors.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  final userController = Get.find<UserController>();
  final ScrollController scrollController = ScrollController();

  void _scrollController() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (userController.currPage < userController.maxPage) {
        userController.nextPage();
        userController.fetchUsers(userController.currPage);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollController);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(title: 'Third Screen', centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Obx(() {
          if (userController.users.isEmpty) {
            return const Center(child: Text("No users found"));
          }

          return ListView.separated(
            physics: AlwaysScrollableScrollPhysics(),
            controller: scrollController,
            separatorBuilder: (_, __) => Divider(height: 1),
            itemCount: userController.users.length,
            itemBuilder: (context, index) {
              final user = userController.users[index];
              return Obx(() {
                bool isSelected =
                    userController.selectedUser.value ==
                    "${user['first_name']} ${user['last_name']}";

                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user['avatar']),
                  ),
                  title: Text(
                    "${user['first_name']} ${user['last_name']}",
                    style: TextStyle(
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected ? AppColors.textLink : Colors.black,
                    ),
                  ),
                  subtitle: Text(user['email']),
                  tileColor:
                      isSelected
                          ? AppColors.textLink.withAlpha(50)
                          : Colors.transparent,
                  onTap: () {
                    userController.selectUser(
                      "${user['first_name']} ${user['last_name']}",
                    );
                  },
                );
              });
            },
          );
        }),
      ),
    );
  }
}

class LoadingState extends StatelessWidget {
  const LoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 10),
          Text('Fetching Data...'),
        ],
      ),
    );
  }
}
