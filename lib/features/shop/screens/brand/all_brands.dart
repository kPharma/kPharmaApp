import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/brand_controller.dart';
import 'brand.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    final brands = controller.getAllBrands();
    return Scaffold(
      appBar: const KAppBar(showBackArrow: true, title: Text('Brand')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(KSizes.defaultSpace),
          child: Column(
            children: [
              /// Sub Categories
              const KSectionHeading(title: 'Brands', showActionButton: false),
              const SizedBox(height: KSizes.spaceBtwItems),

              /// -- Brands
              KGridLayout(
                itemCount: brands.length,
                mainAxisExtent: 80,
                itemBuilder: (_, index) {
                  final brand = brands[index];
                  return KBrandCard(
                    brand: brand,
                    showBorder: true,
                    onTap: () => Get.to(() => BrandScreen(brand: brand)),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
