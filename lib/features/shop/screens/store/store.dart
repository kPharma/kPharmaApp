import 'package:kPharma/features/shop/controllers/categories_controller.dart';
import 'package:kPharma/home_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../common/widgets/shimmers/brands_shimmer.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../controllers/brand_controller.dart';
import '../brand/all_brands.dart';
import '../brand/brand.dart';
import '../home/widgets/header_search_container.dart';
import 'widgets/category_tab.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    final brandController = Get.put(BrandController());
    final dark = KHelperFunctions.isDarkMode(context);
    return PopScope(
      canPop: false,
      // Intercept the back button press and redirect to Home Screen
      onPopInvoked: (value) async => Get.offAll(const HomeMenu()),
      child: DefaultTabController(
        length: categories.length,
        child: Scaffold(
          /// -- Appbar -- Tutorial [Section # 3, Video # 7]
          appBar: KAppBar(
            title: Text('Store',
                style: Theme.of(context).textTheme.headlineMedium),
            actions: const [KCartCounterIcon()],
          ),
          body: NestedScrollView(
            /// -- Header -- Tutorial [Section # 3, Video # 7]
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  pinned: true,
                  floating: true,
                  // Space between Appbar and TabBar. WithIn this height we have added [Search bar] and [Featured brands]
                  expandedHeight: 440,
                  automaticallyImplyLeading: false,
                  backgroundColor: dark ? KColors.black : KColors.white,

                  /// -- Search & Featured Store
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(KSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        /// -- Search bar
                        const SizedBox(height: KSizes.spaceBtwItems),
                        const KSearchContainer(
                            text: 'Search in Store',
                            showBorder: true,
                            showBackground: false,
                            padding: EdgeInsets.zero),
                        const SizedBox(height: KSizes.spaceBtwSections),

                        /// -- Featured Brands
                        KSectionHeading(
                            title: 'Featured Brands',
                            onPressed: () =>
                                Get.to(() => const AllBrandsScreen())),
                        const SizedBox(height: KSizes.spaceBtwItems / 1.5),

                        /// -- Brands
                        Obx(
                          () {
                            // Check if categories are still loading
                            if (brandController.isLoading.value)
                              return const KBrandsShimmer();

                            // Check if there are no featured categories found
                            if (brandController.featuredBrands.isEmpty) {
                              return Center(
                                  child: Text('No Data Found!',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .apply(color: Colors.white)));
                            } else {
                              /// Data Found
                              return KGridLayout(
                                itemCount: 4,
                                mainAxisExtent: 80,
                                itemBuilder: (_, index) {
                                  final brand =
                                      brandController.featuredBrands[index];
                                  return KBrandCard(
                                    brand: brand,
                                    showBorder: true,
                                    onTap: () =>
                                        Get.to(() => BrandScreen(brand: brand)),
                                  );
                                },
                              );
                            }
                          },
                        ),
                        const SizedBox(height: KSizes.spaceBtwSections),
                      ],
                    ),
                  ),

                  /// -- TABS
                  bottom: KTabBar(
                      tabs: categories
                          .map((e) => Tab(child: Text(e.name)))
                          .toList()),
                )
              ];
            },

            /// -- TabBar Views
            body: TabBarView(
              children: categories
                  .map((category) => KCategoryTab(category: category))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
