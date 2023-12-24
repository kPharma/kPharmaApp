import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../login/login.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Appbar close icon will first Logout the user & then redirect back to Login Screen()
      /// Reason: We will store the data when user enters the Register Button on Previous screen.
      /// Whenever the user opens the app, we will check if email is verified or not.
      /// If not verified we will always show this Verification screen.
      appBar: KAppBar(actions: [
        IconButton(
            onPressed: () => Get.offAll(const LoginScreen()),
            icon: const Icon(CupertinoIcons.clear))
      ]),
      body: SingleChildScrollView(
        // Padding to Give Default Equal Space on all sides in all screens.
        child: Padding(
          padding: const EdgeInsets.all(KSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(
                image: const AssetImage(KImages.deliveredEmailIllustration),
                width: KHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: KSizes.spaceBtwSections),

              /// Title & SubTitle
              Text(KTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: KSizes.spaceBtwItems),
              Text('rawa.priv@gmail.com',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: KSizes.spaceBtwItems),
              Text(KTexts.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: KSizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(
                          /// Success Screen
                          () => SuccessScreen(
                            image: KImages.staticSuccessIllustration,
                            title: KTexts.yourAccountCreatedTitle,
                            subTitle: KTexts.yourAccountCreatedSubTitle,
                            onPressed: () => Get.to(() => const LoginScreen()),
                          ),
                        ),
                    child: const Text(KTexts.tContinue)),
              ),
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
