import 'package:kPharma/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Custom Appbar
      appBar: KAppBar(actions: [
        IconButton(
            onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear))
      ]),
      body: Padding(
        padding: const EdgeInsets.all(KSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(KTexts.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: KSizes.spaceBtwItems),
            Text(KTexts.forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: KSizes.spaceBtwSections * 2),

            /// Text field
            const TextField(
              decoration: InputDecoration(
                  labelText: KTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right)),
            ),
            const SizedBox(height: KSizes.spaceBtwSections),

            /// Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const ResetPassword()),
                child: const Text(KTexts.submit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
