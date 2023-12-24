import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/pricing_calculator.dart';

class KBillingAmountSection extends StatelessWidget {
  const KBillingAmountSection({super.key, required this.subTotal});

  final double subTotal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// -- Sub Total
        Row(
          children: [
            Expanded(
                child: Text('Subtotal',
                    style: Theme.of(context).textTheme.bodyMedium)),
            Text('\$$subTotal', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: KSizes.spaceBtwItems / 2),

        /// -- Shipping Fee
        Row(
          children: [
            Expanded(
                child: Text('Shipping Fee',
                    style: Theme.of(context).textTheme.bodyMedium)),
            Text(
              '\$${KPricingCalculator.calculateShippingCost(subTotal, 'US')}',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        const SizedBox(height: KSizes.spaceBtwItems / 2),

        /// -- Tax Fee
        Row(
          children: [
            Expanded(
                child: Text('Tax Fee',
                    style: Theme.of(context).textTheme.bodyMedium)),
            Text(
              '\$${KPricingCalculator.calculateTax(subTotal, 'US')}',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        const SizedBox(height: KSizes.spaceBtwItems),

        /// -- Order Total
        Row(
          children: [
            Expanded(
                child: Text('Order Total',
                    style: Theme.of(context).textTheme.titleMedium)),
            Text('\$${KPricingCalculator.calculateTotalPrice(subTotal, 'US')}',
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
