import 'package:flutter/material.dart';
import 'package:mockgram/features/profile/model/profile_model.dart';
import 'package:mockgram/utils/dimensions.dart';
import 'package:mockgram/utils/text_style.dart';

class ProfileInfoWidget extends StatelessWidget {
  final ProfileModel profile;

  const ProfileInfoWidget({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            profile.displayName,
            style: profileDisplayNameTextStyle,
          ),
          const SizedBox(height: 2),
          Text(
            profile.bio,
            style: profileBioTextStyle,
          ),
        ],
      ),
    );
  }
}
