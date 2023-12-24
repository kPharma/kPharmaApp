import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../personalization/screens/profile/profile.dart';

class KHomeAppBar extends StatelessWidget {
  const KHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            Text(KTexts.homeAppbarSubTitle,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: KColors.white)),
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
