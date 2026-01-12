import 'package:flutter/material.dart';
import 'package:mockgram/common/models/post_model.dart';
import 'package:mockgram/utils/dimensions.dart';
import 'package:mockgram/utils/text_style.dart';

class PostItemWidget extends StatefulWidget {
  final PostModel post;

  const PostItemWidget({
    super.key,
    required this.post,
  });

  @override
  State<PostItemWidget> createState() => _PostItemWidgetState();
}

class _PostItemWidgetState extends State<PostItemWidget> {
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final post = widget.post;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeMedium1,
            vertical: Dimensions.paddingSizeMedium,
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
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
                child: Container(
                  padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const CircleAvatar(
                    radius: Dimensions.radiusLarge,
                    backgroundImage: AssetImage('assets/images/profile.jpeg'),
                  ),
                ),
              ),
              const SizedBox(width: 10),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(post.username, style: usernameTextStyle),
                        if (post.isVerified) ...[
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.verified,
                            color: Color(0xFF3797F0),
                            size: Dimensions.iconSizeExtraSmall,
                          ),
                        ],
                      ],
                    ),
                    Text(post.location, style: locationTextStyle),
                  ],
                ),
              ),

              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        ),

        Stack(
          children: [
            GestureDetector(
              onTapDown: (details) {
                final width = MediaQuery.of(context).size.width;

                if (details.localPosition.dx < width / 2) {
                  if (_currentImageIndex > 0) setState(() => _currentImageIndex--);
                } else {
                  if (_currentImageIndex < post.postImages.length - 1)
                    setState(() => _currentImageIndex++);
                }
              },
              child: SizedBox(
                width: double.infinity,
                height: 400,
                child: Image.asset(
                  post.postImages[_currentImageIndex],
                  fit: BoxFit.cover,
                ),
              ),
            ),

            if (post.postImages.length > 1)
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSizeMedium,
                    vertical: Dimensions.paddingSizeSmall2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${_currentImageIndex + 1}/${post.postImages.length}',
                    style: postCounterTextStyle,
                  ),
                ),
              ),
          ],
        ),
        if (post.postImages.length > 1)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                post.postImages.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraSmall),
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == _currentImageIndex
                        ? const Color(0xFF3797F0)
                        : Colors.grey[300],
                  ),
                ),
              ),
            ),
          ),

        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeMedium1,
            vertical: Dimensions.paddingSizeDefault,
          ),
          child: Row(
            children: const [
              _PostActionIcon(Icons.favorite_border, Dimensions.iconSizeXXLarge),
              SizedBox(width: 16),
              _PostActionIcon(Icons.mode_comment_outlined, Dimensions.iconSizeExtraLarge),
              SizedBox(width: 16),
              _PostActionIcon(Icons.send, Dimensions.iconSizeExtraLarge),
              Spacer(),
              _PostActionIcon(Icons.bookmark_border, Dimensions.iconSizeXXLarge),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeMedium1),
          child: RichText(
            text: TextSpan(
              style: likesTextStyle.copyWith(color:Colors.black),
              children: [
                const TextSpan(text: 'Liked by '),
                TextSpan(text: post.likedBy, style: likesTextStyle.copyWith(color:Colors.black),),
                const TextSpan(text: ' and '),
                TextSpan(
                  text:
                      '${post.likes.toString().replaceAllMapped(RegExp(r"(\d{1,3})(?=(\d{3})+(?!\d))"), (m) => "${m[1]},")} others',
                  style: likesTextStyle.copyWith(color:Colors.black),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeMedium1,
            vertical: Dimensions.paddingSizeSmall,
          ),
          child: RichText(
            text: TextSpan(
              style: captionTextStyle.copyWith(color: Colors.black),
              children: [
                TextSpan(text: post.username, style: captionUsernameTextStyle.copyWith(color: Colors.black)),
                TextSpan(text: ' ${post.caption}'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

class _PostActionIcon extends StatelessWidget {
  final IconData icon;
  final double size;

  const _PostActionIcon(this.icon, this.size);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, size: size),
      onPressed: () {},
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
    );
  }
}
