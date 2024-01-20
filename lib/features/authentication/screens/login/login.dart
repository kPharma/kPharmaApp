import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: KSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              ///  Header
              const KLoginHeader(),

              /// Form
              const KLoginForm(),

              /// Divider
              KFormDivider(dividerText: KTexts.orSignInWith.capitalize!),
              const SizedBox(height: KSizes.spaceBtwSections),

              /// Footer
              const KSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
