import 'package:get_it/get_it.dart';
import 'package:mockgram/features/home/controllers/post_controller.dart';
import 'package:mockgram/features/home/controllers/story_controller.dart';
import 'package:mockgram/features/profile/controllers/profile_controller.dart';

final sl = GetIt.instance;

Future<void> init() async {

  sl.registerLazySingleton<StoryController>(() => StoryController());
  sl.registerLazySingleton<PostController>(() => PostController());
  sl.registerLazySingleton<ProfileController>(() => ProfileController());
}