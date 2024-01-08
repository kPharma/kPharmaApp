import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'forget_password_view_model.dart'; // Adjust this import path as necessary
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import 'package:kPharma/features/authentication/screens/password_configuration/reset_password.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ForgetPasswordViewModel(),
      child: Consumer<ForgetPasswordViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: KAppBar(actions: [
              IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(CupertinoIcons.clear))
            ]),
            body: Padding(
              padding: const EdgeInsets.all(KSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Headings
                  Text(KTexts.forgetPasswordTitle,
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: KSizes.spaceBtwItems),
                  Text(KTexts.forgetPasswordSubTitle,
                      style: Theme.of(context).textTheme.labelMedium),
                  const SizedBox(height: KSizes.spaceBtwSections * 2),

                  // Text field
                  TextField(
                    decoration: const InputDecoration(
                        labelText: KTexts.email,
                        prefixIcon: Icon(Iconsax.direct_right)),
                    onChanged: (value) => viewModel.setEmail(value),
                  ),
                  const SizedBox(height: KSizes.spaceBtwSections),

                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        bool success =
                            await viewModel.submitPasswordResetRequest();
                        if (success) {
                          Get.to(() => const ResetPassword());
                        } else {
                          // Handle failure (e.g., show a message)
                        }
                      },
                      child: const Text(KTexts.submit),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
