import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../images/t_circular_image.dart';
import '../texts/t_brand_title_text.dart';

class KVerticalImageAndText extends StatelessWidget {
  const KVerticalImageAndText({
    super.key,
    this.onTap,
    required this.image,
    required this.title,
    this.backgroundColor,
    this.textColor = KColors.white,
  });

  final Color textColor;
  final String image, title;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: KSizes.spaceBtwItems),
        child: Column(
          children: [
            /// Circular Icon
            KCircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: KSizes.sm * 1.4,
              backgroundColor: backgroundColor,
              overlayColor: dark ? KColors.light : KColors.dark,
            ),
            const SizedBox(height: KSizes.spaceBtwItems / 2),

            /// Text
            SizedBox(
              width: 55,
              child: KBrandTitleText(title: title, color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
