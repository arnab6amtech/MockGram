import 'package:flutter/material.dart';
import 'package:mockgram/features/profile/model/profile_model.dart';
import 'package:mockgram/utils/dimensions.dart';

class ProfilePostItemWidget extends StatelessWidget {
  final ProfilePostModel post;

  const ProfilePostItemWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(post.imageUrl, fit: BoxFit.cover),
        if (post.hasMultipleImages)
          const Positioned(
            top: 8,
            right: 8,
            child: Icon(Icons.collections, color: Colors.white, size: Dimensions.iconSizeMedium),
          ),
      ],
    );
  }
}
