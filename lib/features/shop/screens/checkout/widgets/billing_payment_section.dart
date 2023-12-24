import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/checkout_controller.dart';

class KBillingPaymentSection extends StatelessWidget {
  const KBillingPaymentSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;
    return Column(
      children: [
        KSectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          showActionButton: true,
          onPressed: () {
            controller.selectPaymentMethod(context);
          },
        ),
        const SizedBox(height: KSizes.spaceBtwItems / 2),
        Obx(
          () => Row(
            children: [
              KRoundedContainer(
                width: 60,
                height: 35,
                backgroundColor: KHelperFunctions.isDarkMode(context)
                    ? KColors.light
                    : KColors.white,
                padding: const EdgeInsets.all(KSizes.sm),
                child: Image(
                    image: AssetImage(
                        controller.selectedPaymentMethod.value.image),
                    fit: BoxFit.contain),
              ),
              const SizedBox(width: KSizes.spaceBtwItems / 2),
              Text(controller.selectedPaymentMethod.value.name,
                  style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        ),
      ],
    );
  }
}
