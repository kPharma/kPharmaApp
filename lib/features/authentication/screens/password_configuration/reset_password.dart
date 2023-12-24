import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../login/login.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Appbar to go back OR close all screens and Goto LoginScreen()
      appBar: KAppBar(
        actions: [
          IconButton(
              onPressed: () => Get.offAll(const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(KSizes.defaultSpace),
          child: Column(
            children: [
              /// Image with 60% of screen width
              Image(
                image: const AssetImage(KImages.deliveredEmailIllustration),
                width: KHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: KSizes.spaceBtwSections),

              /// Title & SubTitle
              Text(KTexts.changeYourPasswordTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: KSizes.spaceBtwItems),
              Text('rawa.priv@gmail.com',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: KSizes.spaceBtwItems),
              Text(
                KTexts.changeYourPasswordSubTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: KSizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text(KTexts.done))),
              const SizedBox(height: KSizes.spaceBtwItems),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {}, child: const Text(KTexts.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
