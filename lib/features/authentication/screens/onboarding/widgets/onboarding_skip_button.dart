import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../controllers/onboarding/onboarding_controller.dart';

class KOnBoardingSkipButton extends StatelessWidget {
  const KOnBoardingSkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    return Positioned(
      top: KDeviceUtils.geKAppBarHeight(),
      right: KSizes.defaultSpace,
      child:
          TextButton(onPressed: controller.skipPage, child: const Text('Skip')),
    );
  }
}
