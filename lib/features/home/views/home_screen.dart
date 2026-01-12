import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mockgram/features/home/controllers/post_controller.dart';
import 'package:mockgram/features/home/controllers/story_controller.dart';
import 'package:mockgram/features/home/widgets/post_item_widget.dart';
import 'package:mockgram/features/home/widgets/story_item_widget.dart';
import 'package:mockgram/helpers/route_helper.dart';
import 'package:mockgram/utils/dimensions.dart';
import 'package:mockgram/utils/text_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,

      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        title: Text(
          'Instagram',
          style: instagramLogoSmallTextStyle.copyWith(
            color: theme.colorScheme.onSurface,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite_border,
              size: Dimensions.iconSizeXXLarge,
              color: theme.colorScheme.onSurface,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.send,
              size: Dimensions.iconSizeXXLarge,
              color: theme.colorScheme.onSurface,
            ),
            onPressed: () {},
          ),
        ],
      ),

      body: Column(
        children: [
          GetBuilder<StoryController>(
            init: StoryController(),
            builder: (controller) {
              return SizedBox(
                height: 110,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSizeDefault,
                  ),
                  itemCount: controller.stories.length,
                  itemBuilder: (context, index) {
                    return StoryItemWidget(
                      story: controller.stories[index],
                    );
                  },
                ),
              );
            },
          ),

          Divider(height: 1, color: theme.dividerColor),

          Expanded(
            child: GetBuilder<PostController>(
              init: PostController(),
              builder: (controller) {
                return ListView.builder(
                  itemCount: controller.posts.length,
                  itemBuilder: (context, index) {
                    return PostItemWidget(
                      post: controller.posts[index],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              Get.toNamed(RouteHelper.getHomeScreen());
              break;

            case 1:
            // Search
              break;

            case 2:
            // Add
              break;

            case 3:
            // Likes
              break;

            case 4:
              Get.offNamed(RouteHelper.getProfileScreen());
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: Dimensions.iconSizeXXLarge),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: Dimensions.iconSizeXXLarge),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined, size: Dimensions.iconSizeXXLarge),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border, size: Dimensions.iconSizeXXLarge),
            label: 'Likes',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: Dimensions.radiusLarge,
              backgroundImage: AssetImage('assets/images/profile.jpeg'),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}