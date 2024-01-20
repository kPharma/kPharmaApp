import 'package:kPharma/common/widgets/shimmers/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../personalization/controllers/user_controller.dart';
import '../../../../personalization/screens/profile/profile.dart';

class KHomeAppBar extends StatelessWidget {
  const KHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());

    return KAppBar(
      title: GestureDetector(
        onTap: () => Get.to(() => const ProfileScreen()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(KTexts.homeAppbarTitle,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: KColors.grey)),
            Obx(
              () {
                // Check if user Profile is still loading
                if (userController.profileLoading.value) {
                  // Display a shimmer loader while user profile is being loaded
                  return const KShimmerEffect(width: 80, height: 15);
                } else {
                  // Check if there are no record found
                  if (userController.user.value.id.isEmpty) {
                    // Display a message when no data is found
                    return Text(
                      'Your Name',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: KColors.white),
                    );
                  } else {
                    // Display User Name
                    return Text(
                      userController.user.value.fullName,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: KColors.white),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
      actions: const [
        KCartCounterIcon(
            iconColor: KColors.white,
            counterBgColor: KColors.black,
            counterTextColor: KColors.white)
      ],
    );
  }
}
