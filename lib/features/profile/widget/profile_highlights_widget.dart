import 'package:flutter/material.dart';
import 'package:mockgram/features/profile/model/profile_model.dart';
import 'package:mockgram/utils/dimensions.dart';
import 'package:mockgram/utils/text_style.dart';

class ProfileHighlightsWidget extends StatelessWidget {
  final List<HighlightModel> highlights;

  const ProfileHighlightsWidget({
    super.key,
    required this.highlights,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeMedium1),
        itemCount: highlights.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const _NewHighlightItem();
          }
          return _HighlightItem(highlight: highlights[index - 1]);
        },
      ),
    );
  }
}

class _NewHighlightItem extends StatelessWidget {
  const _NewHighlightItem();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey[300]!, width: 1),
            ),
            child: const Icon(
              Icons.add,
              size: Dimensions.iconSizeXXXLarge,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 6),
          Text('New', style: highlightTitleTextStyle),
        ],
      ),
    );
  }
}

class _HighlightItem extends StatelessWidget {
  final HighlightModel highlight;

  const _HighlightItem({required this.highlight});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey[300]!,
                width: Dimensions.borderWidthThin,
              ),
            ),
            child: ClipOval(
              child: Image.network(
                highlight.coverImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(highlight.title, style: highlightTitleTextStyle),
        ],
      ),
    );
  }
}
