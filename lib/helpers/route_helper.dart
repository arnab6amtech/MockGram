import 'package:get/get.dart';
import '../features/auth/views/login_screen.dart';
import '../features/home/views/home_screen.dart';
import '../features/profile/views/profile_screen.dart';

class RouteHelper {
  static const String home = '/';
  static const String login = '/login';
  static const String profile = '/profile';

  static String getHomeScreen() => home;
  static String getLoginScreen() => login;
  static String getProfileScreen() => profile;

  static List<GetPage> routes = [
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: profile, page: () => const ProfileScreen()),
  ];
}
