import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../images/t_circular_image.dart';
import '../texts/t_brand_title_text.dart';

/// A widget that displays an image with text below it in a vertical arrangement.
class KVerticalImageAndText extends StatelessWidget {
  /// Constructor for [KVerticalImageAndText].
  const KVerticalImageAndText({
    Key? key,
    this.onTap,
    required this.image,
    required this.title,
    this.backgroundColor,
    this.isNetworkImage = true,
    this.textColor = KColors.white,
  }) : super(key: key);

  /// The image asset path or URL.
  final String image;

  /// The text to be displayed below the image.
  final String title;

  /// The color of the text.
  final Color textColor;

  /// Flag indicating whether the image is loaded from the network.
  final bool isNetworkImage;

  /// The background color of the widget.
  final Color? backgroundColor;

  /// Callback function when the widget is tapped.
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: KSizes.spaceBtwItems),
        child: Column(
          children: [
            KCircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: KSizes.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: KHelperFunctions.isDarkMode(context)
                  ? KColors.light
                  : KColors.dark,
            ),
            const SizedBox(height: KSizes.spaceBtwItems / 2),
            SizedBox(
                width: 55,
                child: KBrandTitleText(title: title, color: textColor)),
          ],
        ),
      ),
    );
  }
}
