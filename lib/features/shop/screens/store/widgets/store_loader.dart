import 'package:flutter/material.dart';

import '../../../../../common/widgets/shimmers/boxes_shimmer.dart';
import '../../../../../common/widgets/shimmers/brands_shimmer.dart';
import '../../../../../common/widgets/shimmers/list_tile_shimmer.dart';
import '../../../../../common/widgets/shimmers/shimmer.dart';
import '../../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../../utils/constants/sizes.dart';

class KStoreShimmerLoader extends StatelessWidget {
  const KStoreShimmerLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(KSizes.defaultSpace),
        child: Column(
          children: [
            SizedBox(height: KSizes.spaceBtwSections),
            // AppBar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                KShimmerEffect(width: 100, height: 15),
                KShimmerEffect(width: 55, height: 55, radius: 55),
              ],
            ),
            SizedBox(height: KSizes.spaceBtwSections * 2),
            // Search
            KShimmerEffect(width: double.infinity, height: 55),
            SizedBox(height: KSizes.spaceBtwSections),

            // Heading
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                KShimmerEffect(width: 100, height: 15),
                KShimmerEffect(width: 80, height: 12),
              ],
            ),
            SizedBox(height: KSizes.spaceBtwSections),

            // Brands
            KBrandsShimmer(),
            SizedBox(height: KSizes.spaceBtwSections * 2),

            // Categories
            Row(
              children: [
                Expanded(child: KShimmerEffect(width: 100, height: 15)),
                SizedBox(width: KSizes.spaceBtwItems),
                Expanded(child: KShimmerEffect(width: 100, height: 15)),
                SizedBox(width: KSizes.spaceBtwItems),
                Expanded(child: KShimmerEffect(width: 100, height: 15)),
                SizedBox(width: KSizes.spaceBtwItems),
                Expanded(child: KShimmerEffect(width: 100, height: 15)),
              ],
            ),
            SizedBox(height: KSizes.spaceBtwSections),

            // Category Brands
            KListTileShimmer(),
            SizedBox(height: KSizes.spaceBtwSections),
            KBoxesShimmer(),
            SizedBox(height: KSizes.spaceBtwSections),

            // Products
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                KShimmerEffect(width: 100, height: 15),
                KShimmerEffect(width: 80, height: 12),
              ],
            ),
            SizedBox(height: KSizes.spaceBtwSections),

            KVerticalProductShimmer(),
            SizedBox(height: KSizes.spaceBtwSections * 3),
          ],
        ),
      ),
    );
  }
}
