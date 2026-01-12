import 'package:flutter/material.dart';
import 'package:mockgram/features/auth/widgets/auth_button_widget.dart';
import 'package:mockgram/features/auth/widgets/auth_text_field_widget.dart';
import 'package:mockgram/utils/dimensions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeLarge,
          ),
          child: Column(
            children: [
              // Back button
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: theme.iconTheme.color,
                  ),
                  onPressed: () {},
                ),
              ),

              const Spacer(flex: 1),

              Text(
                'Instagram',
                style: textTheme.headlineLarge?.copyWith(
                  color: colorScheme.primary,
                ),
              ),

              const SizedBox(height: Dimensions.spacingXXLarge),

              // Username TextField
              AuthTextFieldWidget(controller: _usernameController),

              const SizedBox(height: Dimensions.spacingMedium2),

              AuthTextFieldWidget(
                controller: _passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: Dimensions.spacingLarge),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot password?',
                    style: textTheme.labelLarge?.copyWith(
                      color: colorScheme.primary,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: Dimensions.spacingLarge),


              AuthButtonWidget(
                text: 'Log in',
                onPressed: () {},
              ),

              const SizedBox(height: Dimensions.spacingExtraLarge),

              SizedBox(
                width: double.infinity,
                child: TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.facebook,
                    color: colorScheme.primary,
                    size: Dimensions.iconSizeMedium,
                  ),
                  label: Text(
                    'Log in with Facebook',
                    style: textTheme.labelLarge?.copyWith(
                      color: colorScheme.primary,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: Dimensions.spacingExtraLarge),

              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSizeLarge,
                    ),
                    child: Text(
                      'OR',
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),

              const SizedBox(height: Dimensions.spacingExtraLarge),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Sign up.',
                      style: textTheme.labelLarge?.copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),

              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
