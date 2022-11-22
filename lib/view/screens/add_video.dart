// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables, use_build_context_synchronously, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:tiktok/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok/view/screens/addcaption_screen.dart';

class addVideoScreen extends StatelessWidget {
  addVideoScreen({Key? key}) : super(key: key);
  videoPick(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Get.snackbar("Video Selected", video.path);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => addCaption_Screen(
                  videoFile: File(video.path), videoPath: video.path)));
    } else {
      Get.snackbar(
          "Error In Selecting Video", "Please Choose A Different Video File");
    }
  }

  showDialogOpt(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              children: [
                SimpleDialogOption(
                  onPressed: () => videoPick(ImageSource.gallery, context),
                  child: Text("Gallery"),
                ),
                SimpleDialogOption(
                  onPressed: () => videoPick(ImageSource.camera, context),
                  child: Text("Camera"),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Close"),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => showDialogOpt(context),
          child: Container(
            width: 190,
            height: 50,
            decoration: BoxDecoration(color: buttonColor),
            child: Center(
              child: Text(
                "Add Video",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
