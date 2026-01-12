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
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSizeSmall2,
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(
                  Dimensions.paddingSizeExtraSmall2,
                ),
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
                      ? Border.all(
                    color: theme.dividerColor,
                    width: Dimensions.paddingSizeExtraSmall,
                  )
                      : null,
                ),
                child: Container(
                  padding: const EdgeInsets.all(
                    Dimensions.paddingSizeExtraSmall,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: Dimensions.radiusCircular,
                    backgroundImage: AssetImage(
                      story.userImage,
                    ),
                  ),
                ),
              ),

              if (story.isOwn)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(
                      Dimensions.paddingSizeExtraSmall,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: theme.colorScheme.surface,
                        width: Dimensions.borderWidthDefault,
                      ),
                    ),
                    child: Icon(
                      Icons.add_circle,
                      color: theme.colorScheme.primary,
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
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: storyUsernameTextStyle.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight:
                story.isOwn ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
