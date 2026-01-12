import 'package:flutter/material.dart';
import 'package:mockgram/common/models/post_model.dart';
import 'package:mockgram/common/models/story_model.dart';
import 'package:mockgram/features/home/widgets/post_item_widget.dart';
import 'package:mockgram/features/home/widgets/story_item_widget.dart';
import 'package:mockgram/utils/text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<StoryModel> stories = [
    StoryModel(username: 'Your Story', userImage: 'assets/user.jpg', isOwn: true),
    StoryModel(username: 'karennne', userImage: 'assets/karen.jpg'),
    StoryModel(username: 'zackjohn', userImage: 'assets/zack.jpg'),
    StoryModel(username: 'kieran_d', userImage: 'assets/kieran.jpg'),
    StoryModel(username: 'craig_w', userImage: 'assets/craig.jpg'),
  ];

  final List<PostModel> posts = [
    PostModel(
      username: 'joshua_l',
      userImage: 'assets/joshua.jpg',
      location: 'Tokyo, Japan',
      postImages: [
        'assets/tokyo1.jpg',
        'assets/tokyo2.jpg',
        'assets/tokyo3.jpg',
      ],
      likes: 44686,
      likedBy: 'craig_love',
      caption: 'The game in Japan was amazing and I want to share some photos',
      isVerified: true,
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Instagram',
          style: instagramLogoSmallTextStyle,
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.favorite_border, color: Colors.black, size: 28),
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 18,
                    minHeight: 18,
                  ),
                  child: const Text(
                    '9',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.black, size: 28),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: stories.length,
              itemBuilder: (context, index) {
                return StoryItemWidget(story: stories[index]);

              },
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {

                return PostItemWidget(post: posts[index]);

              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 28),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 28),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined, size: 28),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border, size: 28),
            label: 'Likes',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 14,
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

}