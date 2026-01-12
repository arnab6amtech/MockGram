import 'package:get/get.dart';
import 'package:mockgram/features/profile/model/profile_model.dart';

class ProfileController extends GetxController {
  final List<ProfileModel> profiles = [
    ProfileModel(
      username: 'jacob_w',
      displayName: 'Jacob West',
      bio: 'Digital goodies designer @pixsellz\nEverything is designed.',
      profileImage: 'assets/profile.jpg',
      postsCount: 54,
      followersCount: 834,
      followingCount: 162,
      highlights: [
        HighlightModel(title: 'New', coverImage: 'assets/images/cat.jpg'),
        HighlightModel(title: 'Friends', coverImage: 'assets/images/cat.jpg'),
        HighlightModel(title: 'Sport', coverImage: 'assets/images/cat.jpg'),
        HighlightModel(title: 'Design', coverImage: 'assets/images/cat.jpg'),
      ],
      posts: List.generate(
        9,
            (index) => ProfilePostModel(
          id: 'post_$index',
          imageUrl: 'assets/images/cat.jpg',
          caption: 'Post $index',
          likes: 1000 + index * 100,
          comments: 50 + index * 5,
          timestamp: DateTime.now().subtract(Duration(days: index)),
          hasMultipleImages: index == 7,
        ),
      ),
    ),
  ];


  ProfileModel get profile => profiles.first;
}

