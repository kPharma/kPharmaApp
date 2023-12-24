import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class KTermsAndConditionCheckbox extends StatelessWidget {
  const KTermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Wrap in a Sized box to remove extra padding
        SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(value: true, onChanged: (value) {})),
        const SizedBox(width: KSizes.md),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: '${KTexts.iAgreeTo} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: KTexts.privacyPolicy,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: KHelperFunctions.isDarkMode(context)
                          ? KColors.white
                          : KColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: KHelperFunctions.isDarkMode(context)
                          ? KColors.white
                          : KColors.primary,
                    ),
              ),
              TextSpan(
                  text: ' ${KTexts.and} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: KTexts.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: KHelperFunctions.isDarkMode(context)
                          ? KColors.white
                          : KColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: KHelperFunctions.isDarkMode(context)
                          ? KColors.white
                          : KColors.primary,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
