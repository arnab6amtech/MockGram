import 'package:get/get.dart';
import 'package:mockgram/common/models/story_model.dart';

class StoryController extends GetxController {
  final List<StoryModel> stories = [
    StoryModel(
      username: 'Your Story',
      userImage: 'assets/images/profile.jpeg',
      isOwn: true,
    ),
    StoryModel(username: 'karennne', userImage: 'assets/images/spiderman.jpg'),
    StoryModel(username: 'zackjohn', userImage: 'assets/images/spiderman.jpg'),
    StoryModel(username: 'kieran_d', userImage: 'assets/images/spiderman.jpg'),
    StoryModel(username: 'craig_w', userImage: 'assets/images/spiderman.jpg'),
  ];
}
