import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import 'shimmer.dart';

class KBoxesShimmer extends StatelessWidget {
  const KBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: KShimmerEffect(width: 150, height: 110)),
            SizedBox(width: KSizes.spaceBtwItems),
            Expanded(child: KShimmerEffect(width: 150, height: 110)),
            SizedBox(width: KSizes.spaceBtwItems),
            Expanded(child: KShimmerEffect(width: 150, height: 110)),
          ],
        )
      ],
    );
  }
}
