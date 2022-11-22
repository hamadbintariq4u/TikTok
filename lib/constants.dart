// ignore_for_file: prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:tiktok/view/screens/add_video.dart';
import 'package:tiktok/view/screens/display_screen.dart';
import 'package:tiktok/view/screens/search_screen.dart';

import 'view/screens/profile_screen.dart';

getRandomColor() => [
      Colors.blueAccent,
      Colors.redAccent,
      Colors.greenAccent,
    ][Random().nextInt(3)];

// COLORS
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

var pageindex = [
  DisplayVideo_Screen(),
  SearchScreen(),
  addVideoScreen(),
  Text('Messages'),
  ProfileScreen(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];
