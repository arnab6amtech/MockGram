import 'package:flutter/material.dart';
import 'package:mockgram/features/profile/model/profile_model.dart';
import 'package:mockgram/utils/dimensions.dart';
import 'package:mockgram/utils/text_style.dart';

class ProfileHeaderWidget extends StatelessWidget {
  final ProfileModel profile;

  const ProfileHeaderWidget({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSizeLarge,
        vertical: Dimensions.paddingSizeMedium1,
      ),
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFBAA47),
                  Color(0xFFD91A46),
                  Color(0xFFA60F93),
                ],
              ),
            ),
            padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall2),
            child: Container(
              padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall2),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const CircleAvatar(
                radius: Dimensions.radiusCircularLarge,
                backgroundImage: AssetImage('assets/images/profile.jpeg'),
              ),
            ),
          ),
          const SizedBox(width: 20),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _StatColumn(profile.postsCount.toString(), 'Posts'),
                _StatColumn(profile.followersCount.toString(), 'Followers'),
                _StatColumn(profile.followingCount.toString(), 'Following'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatColumn extends StatelessWidget {
  final String count;
  final String label;

  const _StatColumn(this.count, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(count, style: profileStatsCountTextStyle),
        const SizedBox(height: 2),
        Text(label, style: profileStatsLabelTextStyle),
      ],
    );
  }
}
