import 'package:flutter/material.dart';
import '../layouts/grid_layout.dart';
import 'shimmer.dart';

class KBrandsShimmer extends StatelessWidget {
  const KBrandsShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return KGridLayout(
      mainAxisExtent: 80,
      itemCount: itemCount,
      itemBuilder: (_, __) => const KShimmerEffect(width: 300, height: 80),
    );
  }
}
