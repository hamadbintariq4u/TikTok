// ignore_for_file: prefer_const_constructors, must_be_immutable, unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/controller/search_user_controller.dart';
import 'package:tiktok/model/user.dart';
import 'package:tiktok/view/widgets/text_input.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  TextEditingController searchQuery = TextEditingController();
  final SearchController searchController = Get.put(SearchController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
            title: TextFormField(
          controller: searchQuery,
          onChanged: (value) {
            searchController.searchUser(value);
          },
        )),
        body: searchController.searchedUsers.isEmpty
            ? Center(
                child: Text("Search Users!"),
              )
            : ListView.builder(
                itemCount: searchController.searchedUsers.length,
                itemBuilder: (context, index) {
                  myUser user = searchController.searchedUsers[index];
                  return ListTile(
                    onTap: () {
                      Get.snackbar(
                        "You Clicked ${user.name}",
                        "Opening Profile page on it",
                      );
                    },
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.profilePhoto),
                    ),
                    title: Text(user.name),
                  );
                },
              ),
      );
    });
  }
}
