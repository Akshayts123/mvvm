

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lilac_mvvm_user/view/user/screens/user_list_screen.dart';

import 'core/app_theme.dart';
import 'di.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightAppTheme,
      home: const UserListScreen(),
    );
  }
}
