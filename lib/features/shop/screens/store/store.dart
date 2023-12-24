import 'package:kPharma/features/shop/screens/store/widgets/category_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../controllers/dummy_data.dart';
import '../../controllers/store_controller.dart';
import '../brand/all_brands.dart';
import '../brand/brand.dart';
import '../home/widgets/header_search_container.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StoreController());
    final categories = controller.getFeaturedCategories();
    final dark = KHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        /// -- Appbar -- Tutorial [Section # 3, Video # 7]
        appBar: KAppBar(
          title:
              Text('Store', style: Theme.of(context).textTheme.headlineMedium),
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
                          text: 'Pharmacy Search :)',
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
                      KGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          final brand = KDummyData.brands[index];
                          return KBrandCard(
                            brand: brand,
                            showBorder: true,
                            onTap: () =>
                                Get.to(() => BrandScreen(brand: brand)),
                          );
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
    );
  }
}
