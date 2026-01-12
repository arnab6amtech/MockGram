import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mockgram/features/profile/controllers/profile_controller.dart';
import 'package:mockgram/features/profile/widget/edit_profile_button_widget.dart';
import 'package:mockgram/features/profile/widget/profile_header_widget.dart';
import 'package:mockgram/features/profile/widget/profile_highlights_widget.dart';
import 'package:mockgram/features/profile/widget/profile_info_widget.dart';
import 'package:mockgram/features/profile/widget/profile_post_item_widget.dart';
import 'package:mockgram/helpers/di_container.dart';
import 'package:mockgram/helpers/route_helper.dart';
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
    final theme = Theme.of(context);

    return GetBuilder<ProfileController>(
      init: sl<ProfileController>(),
      builder: (controller) {
        final profile = controller.profile;

        return Scaffold(
          backgroundColor: theme.colorScheme.surface,

          appBar: AppBar(
            backgroundColor: theme.colorScheme.surface,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.lock_outline,
                  color: theme.colorScheme.onSurface),
              onPressed: () {},
            ),
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  profile.username,
                  style: usernameAppBarTextStyle.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(Icons.keyboard_arrow_down,
                    color: theme.colorScheme.onSurface),
              ],
            ),
          ),

          body: NestedScrollView(
            headerSliverBuilder: (_, __) {
              return [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileHeaderWidget(profile: profile),
                      ProfileInfoWidget(profile: profile),
                      EditProfileButtonWidget(onPressed: () {}),
                      ProfileHighlightsWidget(
                        highlights: profile.highlights,
                      ),
                      _buildTabBar(theme),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              controller: _tabController,
              children: [
                _buildPostsGrid(profile),
                _buildTaggedGrid(theme),
              ],
            ),
          ),

          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: 0,
            onTap: (index) {
              switch (index) {
                case 0:
                  Get.offNamed(RouteHelper.getHomeScreen());
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
                  Get.toNamed(RouteHelper.getHomeScreen());
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
      },
    );
  }

  Widget _buildTabBar(ThemeData theme) {
    return TabBar(
      controller: _tabController,
      indicatorColor: theme.colorScheme.onSurface,
      tabs: const [
        Tab(icon: Icon(Icons.grid_on)),
        Tab(icon: Icon(Icons.person_pin_outlined)),
      ],
    );
  }

  Widget _buildPostsGrid(profile) {
    return GridView.builder(
      padding: const EdgeInsets.all(1),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemCount: profile.posts.length,
      itemBuilder: (_, index) {
        return ProfilePostItemWidget(
          post: profile.posts[index],
        );
      },
    );
  }

  Widget _buildTaggedGrid(ThemeData theme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person_pin_outlined, size: 80, color: theme.hintColor),
          const SizedBox(height: 16),
          Text('No Photos',
              style: emptyStateTextStyle.copyWith(
                color: theme.colorScheme.onSurface,
              )),
        ],
      ),
    );
  }
}
