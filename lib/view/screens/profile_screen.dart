// ignore_for_file: unnecessary_import, unused_import, must_be_immutable, prefer_const_constructors, unused_local_variable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/controller/auth_controller.dart';
import 'package:tiktok/controller/profile_controller.dart';
import 'package:tiktok/view/screens/home_page.dart';
import 'package:tiktok/view/screens/display_screen.dart';
import 'package:tiktok/view/widgets/customAddIcon.dart';

class ProfileScreen extends StatefulWidget {
  String uid;
  ProfileScreen({Key? key, required this.uid}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController profileController = Get.put(ProfileController());
  final AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();

    profileController.updateUseId(widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          appBar: AppBar(
            title: Text('@${profileController.user["name"]}'),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  Get.snackbar("TikTok Clone Yt App", "Current Version 1.0");
                },
                icon: Icon(Icons.info_outline_rounded),
              )
            ],
          ),
          body: profileController.user.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: SafeArea(
                    child: Column(children: [
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 70,
                            backgroundImage: NetworkImage(
                              profileController.user['profilePic'],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                profileController.user['followers'],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Followers",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400))
                            ],
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                profileController.user['following'],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Followings",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400))
                            ],
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                profileController.user['likes'],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Likes",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400))
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      InkWell(
                        onTap: () {
                          if (widget.uid ==
                              FirebaseAuth.instance.currentUser!.uid) {
                            authController.signOut();
                          } else {
                            profileController.followUser();
                          }
                        },
                        child: Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white60, width: 0.6),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Text(widget.uid ==
                                      FirebaseAuth.instance.currentUser!.uid
                                  ? "Sign Out"
                                  : profileController.user['isFollowing']
                                      ? "Following"
                                      : "Follow")),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        indent: 30,
                        endIndent: 30,
                        thickness: 2,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.75,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                          itemCount:
                              profileController.user['thumbnails'].length,
                          itemBuilder: (context, index) {
                            String thumbnail =
                                profileController.user['thumbnails'][index];

                            return InkWell(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(thumbnail),
                                  ),
                                ),
                              ),
                            );
                          })
                    ]),
                  ),
                ));
    });
  }
}
