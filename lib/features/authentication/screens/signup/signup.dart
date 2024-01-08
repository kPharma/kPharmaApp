import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:provider/provider.dart';
import '/features/authentication/screens/signup/signup_view_model.dart'; // Adjust this import path as necessary
import 'package:kPharma/features/authentication/screens/signup/widgets/signup_form.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignupViewModel(),
      child: Consumer<SignupViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: const KAppBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(KSizes.defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(KTexts.signupTitle,
                        style: Theme.of(context).textTheme.headlineMedium),
                    KSignupForm(viewModel: viewModel),
                    const SizedBox(height: KSizes.spaceBtwSections),
                    KFormDivider(dividerText: KTexts.orSignUpWith.capitalize!),
                    const SizedBox(height: KSizes.spaceBtwSections),
                    const KSocialButtons()
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
