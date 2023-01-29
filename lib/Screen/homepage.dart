import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/Screen/login.dart';
import 'package:to_do_app/Screen/profile.dart';
import 'package:to_do_app/Screen/timer.dart';
import 'package:to_do_app/Widget/alltasks.dart';
import 'package:to_do_app/Widget/todotask.dart';
import '../utils/app_style.dart';
import '../Widget/bottombar.dart';

import 'add.dart';
import 'calnder.dart';
import '../firebase.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _pages = [
    HomePage(),
    const AddToDo(),
    const Timer(),
    const Calander(),
    const ProfileManagement(),
  ];

  int _pageindex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    dataFirebase.getAllData();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Container(
            height: size.height * 0.18,
            width: double.infinity,
            decoration: BoxDecoration(
              color: style.green,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                  ),
                ),
                Text(
                  'Welcome',
                  style: style.textStyleWhite,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.login,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Get.off(() => const Login());
                  },
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            DateFormat.MMMMEEEEd().format(DateTime.now()).toString(),
            style: style.textStyleBlack,
          ),
        ),
        AllTasks(),
      ],
    );
  }
}

Widget taskRow(String text, String text2, String type) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: style.textStyle,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {},
          child: Text(
            text2,
            style: style.headLine3,
          ),
        ),
      ),
    ],
  );
}
