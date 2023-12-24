import 'package:kPharma/features/shop/screens/home/widgets/header_categories.dart';
import 'package:kPharma/features/shop/screens/home/widgets/header_search_container.dart';
import 'package:kPharma/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:kPharma/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/device/device_utility.dart';
import '../../controllers/dummy_data.dart';
import '../../controllers/home_controller.dart';
import '../all_products/all_products.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final featuredProducts = controller.getFeaturedProducts();
    final popularProducts = controller.getPopularProducts();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            const KPrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// -- Appbar
                  KHomeAppBar(),
                  SizedBox(height: KSizes.spaceBtwSections),

                  /// -- Searchbar
                  KSearchContainer(
                      text: 'Pharmacy Search :)', showBorder: false),
                  SizedBox(height: KSizes.spaceBtwSections),

                  /// -- Categories
                  KHeaderCategories(),
                  SizedBox(height: KSizes.spaceBtwSections * 2),
                ],
              ),
            ),

            /// -- Body
            Container(
              padding: const EdgeInsets.all(KSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// -- Promo Slider 1
                  const KPromoSlider(banners: [
                    KImages.promoBanner1,
                    KImages.promoBanner2,
                    KImages.promoBanner3
                  ]),
                  const SizedBox(height: KSizes.spaceBtwSections),

                  /// -- Popular Products
                  KSectionHeading(
                    title: KTexts.popularProducts,
                    onPressed: () => Get.to(() => AllProducts(
                        title: KTexts.popularProducts,
                        products: KDummyData.products)),
                  ),
                  const SizedBox(height: KSizes.spaceBtwItems),
                  KGridLayout(
                    itemCount: featuredProducts.length,
                    itemBuilder: (_, index) =>
                        KProductCardVertical(product: featuredProducts[index]),
                  ),
                  const SizedBox(height: KSizes.spaceBtwSections * 2),

                  /// -- Promo Slider 2
                  const KPromoSlider(banners: [
                    KImages.banner2,
                    KImages.banner3,
                    KImages.banner4
                  ]),
                  const SizedBox(height: KSizes.spaceBtwSections),

                  /// -- Popular Products
                  KSectionHeading(
                      title: KTexts.popularProducts,
                      onPressed: () => Get.to(() => AllProducts(
                          title: KTexts.popularProducts,
                          products: KDummyData.products))),
                  const SizedBox(height: KSizes.spaceBtwItems),
                  KGridLayout(
                    itemCount: popularProducts.length,
                    itemBuilder: (_, index) =>
                        KProductCardVertical(product: popularProducts[index]),
                  ),
                  SizedBox(
                      height: KDeviceUtils.getBottomNavigationBarHeight() +
                          KSizes.defaultSpace),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
