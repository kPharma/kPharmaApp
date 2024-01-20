import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/signup_controller.dart';
import 'terms_conditions_checkbox.dart';

class KSignupForm extends StatelessWidget {
  const KSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          const SizedBox(height: KSizes.spaceBtwSections),

          /// First & Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      KValidator.validateEmptyText('First name', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: KTexts.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: KSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      KValidator.validateEmptyText('Last name', value),
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
            controller: controller.username,
            validator: KValidator.validateUsername,
            expands: false,
            decoration: const InputDecoration(
                labelText: KTexts.username,
                prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: KSizes.spaceBtwInputFields),

          /// Email
          TextFormField(
            controller: controller.email,
            validator: KValidator.validateEmail,
            decoration: const InputDecoration(
                labelText: KTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(height: KSizes.spaceBtwInputFields),

          /// Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: KValidator.validatePhoneNumber,
            decoration: const InputDecoration(
                labelText: KTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(height: KSizes.spaceBtwInputFields),

          /// Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: KValidator.validatePassword,
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: KTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value =
                      !controller.hidePassword.value,
                  icon: const Icon(Iconsax.eye_slash),
                ),
              ),
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
                onPressed: () => controller.signup(),
                child: const Text(KTexts.createAccount)),
          ),
        ],
      ),
    );
  }
}
