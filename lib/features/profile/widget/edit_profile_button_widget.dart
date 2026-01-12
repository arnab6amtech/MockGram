import 'package:flutter/material.dart';
import 'package:mockgram/utils/dimensions.dart';
import 'package:mockgram/utils/text_style.dart';

class EditProfileButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const EditProfileButtonWidget({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSizeLarge,
        vertical: Dimensions.paddingSizeMedium1,
      ),
      child: SizedBox(
        width: double.infinity,
        height: 32,
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.grey[300]!),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
            ),
          ),
          child: Text(
            'Edit Profile',
            style: buttonTextStyle,
          ),
        ),
      ),
    );
  }
}
