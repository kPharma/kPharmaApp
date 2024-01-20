import 'package:flutter/material.dart';
import 'shimmer.dart';

import '../../../utils/constants/sizes.dart';

class KListTileShimmer extends StatelessWidget {
  const KListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            KShimmerEffect(width: 50, height: 50, radius: 50),
            SizedBox(width: KSizes.spaceBtwItems),
            Column(
              children: [
                KShimmerEffect(width: 100, height: 15),
                SizedBox(height: KSizes.spaceBtwItems / 2),
                KShimmerEffect(width: 80, height: 12),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
