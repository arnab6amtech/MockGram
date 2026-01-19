import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mockgram/helpers/di_container.dart';
import 'package:mockgram/theme/app_theme.dart';

import 'helpers/route_helper.dart';

void main() async {
  // Get.put(StoryController());
  // Get.put(PostController());
  // Get.put(ProfileController());
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialRoute: RouteHelper.getHomeScreen(),
      getPages: RouteHelper.routes,
    );
  }
}

/// This is for testing pull request
