import 'package:flutter/material.dart';
import 'package:mockgram/common/models/story_model.dart';
import 'package:mockgram/utils/dimensions.dart';
import 'package:mockgram/utils/text_style.dart';

class StoryItemWidget extends StatelessWidget {
  final StoryModel story;

  const StoryItemWidget({
    super.key,
    required this.story,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall2),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: story.isOwn
                      ? null
                      : const LinearGradient(
                          colors: [
                            Color(0xFFFBAA47),
                            Color(0xFFD91A46),
                            Color(0xFFA60F93),
                          ],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        ),
                  border: story.isOwn
                      ? Border.all(color: Colors.grey, width: Dimensions.paddingSizeExtraSmall)
                      : null,
                ),
                child: Container(
                  padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const CircleAvatar(
                    radius: Dimensions.radiusCircular,
                    backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150',
                    ),
                  ),
                ),
              ),

              if (story.isOwn)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: Dimensions.borderWidthDefault,
                      ),
                    ),
                    child: const Icon(
                      Icons.add_circle,
                      color: Color(0xFF3797F0),
                      size: Dimensions.iconSizeMedium,
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(height: 6),

          SizedBox(
            width: 70,
            child: Text(
              story.username,
              style: storyUsernameTextStyle,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
