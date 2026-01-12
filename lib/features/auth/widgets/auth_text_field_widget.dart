import 'package:flutter/material.dart';
import 'package:mockgram/utils/dimensions.dart';

class AuthTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool obscureText;

  const AuthTextFieldWidget({
    super.key,
    required this.controller,
    this.hintText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: theme.textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurface.withOpacity(0.4), // subtle hint color
        ),
        filled: true,
        fillColor: colorScheme.surfaceVariant.withOpacity(0.1), // subtle background

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusMedium),
          borderSide: BorderSide(
            color: colorScheme.onSurface.withOpacity(0.2),
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusMedium),
          borderSide: BorderSide(
            color: colorScheme.primary, // accent color when focused
          ),
        ),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSizeLarge,
          vertical: Dimensions.paddingSizeMedium2,
        ),
      ),
      style: theme.textTheme.bodyMedium, // text style inside the field
    );
  }
}
