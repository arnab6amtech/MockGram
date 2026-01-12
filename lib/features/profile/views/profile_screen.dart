import 'package:flutter/material.dart';
import 'package:mockgram/features/profile/model/profile_model.dart';
import 'package:mockgram/features/profile/widget/edit_profile_button_widget.dart';
import 'package:mockgram/features/profile/widget/profile_header_widget.dart';
import 'package:mockgram/features/profile/widget/profile_highlights_widget.dart';
import 'package:mockgram/features/profile/widget/profile_info_widget.dart';
import 'package:mockgram/utils/dimensions.dart';
import 'package:mockgram/utils/text_style.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final ProfileModel profile = ProfileModel(
    username: 'jacob_w',
    displayName: 'Jacob West',
    bio: 'Digital goodies designer @pixsellz\nEverything is designed.',
    profileImage: 'assets/profile.jpg',
    postsCount: 54,
    followersCount: 834,
    followingCount: 162,
    highlights: [
      HighlightModel(title: 'New', coverImage: 'assets/new.jpg'),
      HighlightModel(title: 'Friends', coverImage: 'assets/friends.jpg'),
      HighlightModel(title: 'Sport', coverImage: 'assets/sport.jpg'),
      HighlightModel(title: 'Design', coverImage: 'assets/design.jpg'),
    ],
    posts: List.generate(
      9,
      (index) => ProfilePostModel(
        id: 'post_$index',
        imageUrl: 'https://via.placeholder.com/400',
        caption: 'Post $index',
        likes: 1000 + index * 100,
        comments: 50 + index * 5,
        timestamp: DateTime.now().subtract(Duration(days: index)),
        hasMultipleImages: index == 7,
      ),
    ),
  );

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.lock_outline, color: Colors.black),
          onPressed: () {},
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(profile.username, style: usernameAppBarTextStyle),
            const SizedBox(width: 4),
            const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.black,
              size: Dimensions.iconSizeMedium,
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.add_box_outlined, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileHeaderWidget(profile: profile),
                  ProfileInfoWidget(profile: profile),
                  EditProfileButtonWidget(onPressed: () {}),
                  ProfileHighlightsWidget(highlights: profile.highlights),
                  _buildTabBar(),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [_buildPostsGrid(), _buildTaggedGrid()],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      indicatorColor: Colors.black,
      indicatorWeight: 1,
      tabs: [
        Tab(
          icon: Icon(Icons.grid_on, color: Colors.black, size: 28),
        ),
        Tab(
          icon: Icon(
            Icons.person_pin_outlined,
            color: Colors.grey[400],
            size: 28,
          ),
        ),
      ],
    );
  }

  Widget _buildPostsGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(1),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemCount: profile.posts.length,
      itemBuilder: (context, index) {
        return _buildPostItem(profile.posts[index]);
      },
    );
  }

  Widget _buildPostItem(ProfilePostModel post) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(post.imageUrl, fit: BoxFit.cover),
        if (post.hasMultipleImages)
          const Positioned(
            top: 8,
            right: 8,
            child: Icon(Icons.collections, color: Colors.white, size: 20),
          ),
      ],
    );
  }

  Widget _buildTaggedGrid() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.person_pin_outlined, size: 80, color: Colors.grey),
          const SizedBox(height: 16),
          Text(
            'No Photos',
            style: emptyStateTextStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      currentIndex: 4,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined, size: 28),
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
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
