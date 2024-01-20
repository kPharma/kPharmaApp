import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';
import 'shimmer.dart';

class KHorizontalProductShimmer extends StatelessWidget {
  const KHorizontalProductShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: KSizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) =>
            const SizedBox(width: KSizes.spaceBtwItems),
        itemBuilder: (_, __) => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Image
            KShimmerEffect(width: 120, height: 120),
            SizedBox(width: KSizes.spaceBtwItems),

            /// Text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: KSizes.spaceBtwItems / 2),
                KShimmerEffect(width: 160, height: 15),
                SizedBox(height: KSizes.spaceBtwItems / 2),
                KShimmerEffect(width: 110, height: 15),
                SizedBox(height: KSizes.spaceBtwItems / 2),
                KShimmerEffect(width: 80, height: 15),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
