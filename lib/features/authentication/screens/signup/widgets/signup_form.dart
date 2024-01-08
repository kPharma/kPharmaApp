import 'package:kPharma/features/authentication/screens/signup/signup_view_model.dart';
import 'package:kPharma/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../verify_email.dart';

class KSignupForm extends StatelessWidget {
  const KSignupForm({
    super.key,
    required SignupViewModel viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          /// First & Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: KTexts.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: KSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: KTexts.lastName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(height: KSizes.spaceBtwInputFields),

          /// Username
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: KTexts.username,
                prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: KSizes.spaceBtwInputFields),

          /// Email
          TextFormField(
            decoration: const InputDecoration(
                labelText: KTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(height: KSizes.spaceBtwInputFields),

          /// Phone Number
          TextFormField(
            decoration: const InputDecoration(
                labelText: KTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(height: KSizes.spaceBtwInputFields),

          /// Password
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: KTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(height: KSizes.spaceBtwSections),

          /// Terms&Conditions Checkbox
          const KTermsAndConditionCheckbox(),
          const SizedBox(height: KSizes.spaceBtwSections),

          /// Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(() => const VerifyEmailScreen()),
              child: const Text(KTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
