import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/image_text/image_text_vertical.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../controllers/dummy_data.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = KHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: KAppBar(
        title:
            Text('Search', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('Cancel'))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(KSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Search bar & Filter Button
              Row(
                children: [
                  /// Search
                  Expanded(
                    child: TextFormField(
                      autofocus: true,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.search_normal),
                          hintText: 'Search'),
                    ),
                  ),
                  const SizedBox(width: KSizes.spaceBtwItems),

                  /// Filter
                  OutlinedButton(
                    onPressed: () => filterModalBottomSheet(context),
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.grey)),
                    child: const Icon(Iconsax.setting, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: KSizes.spaceBtwSections),

              /// Brands
              const KSectionHeading(title: 'Brands', showActionButton: false),
              Wrap(
                children: KDummyData.brands
                    .map((brand) => Padding(
                          padding: const EdgeInsets.only(top: KSizes.md),
                          child: KVerticalImageAndText(
                            image: brand.image,
                            title: brand.name,
                            textColor: KHelperFunctions.isDarkMode(context)
                                ? KColors.white
                                : KColors.dark,
                            backgroundColor:
                                KHelperFunctions.isDarkMode(context)
                                    ? KColors.darkerGrey
                                    : KColors.light,
                          ),
                        ))
                    .toList(),
              ),
              const SizedBox(height: KSizes.spaceBtwSections),

              /// Categories
              const KSectionHeading(
                  title: 'Categories', showActionButton: false),
              const SizedBox(height: KSizes.spaceBtwItems),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (_, __) =>
                      const SizedBox(height: KSizes.spaceBtwItems),
                  itemCount: KDummyData.categories.length,
                  shrinkWrap: true,
                  itemBuilder: (_, index) => Row(
                        children: [
                          Image(
                            width: 25,
                            height: 25,
                            color: isDark ? KColors.white : KColors.dark,
                            image:
                                AssetImage(KDummyData.categories[index].image),
                          ),
                          const SizedBox(width: KSizes.spaceBtwItems / 2),
                          Text(KDummyData.categories[index].name)
                        ],
                      )),
              const SizedBox(height: KSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> filterModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          left: KSizes.defaultSpace,
          right: KSizes.defaultSpace,
          top: KSizes.defaultSpace,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Heading
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const KSectionHeading(
                      title: 'Filter', showActionButton: false),
                  IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Iconsax.close_square))
                ],
              ),
              const SizedBox(height: KSizes.spaceBtwSections / 2),

              /// Sort
              Text('Sort by', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: KSizes.spaceBtwItems / 2),

              KGridLayout(
                mainAxisExtent: 20,
                itemCount: KDummyData.sortingFilters.length,
                itemBuilder: (_, index) => Row(
                  children: [
                    const Icon(Icons.circle_outlined, size: 18),
                    const SizedBox(width: KSizes.spaceBtwItems / 2),
                    Flexible(
                        child: Text(KDummyData.sortingFilters[index].name,
                            overflow: TextOverflow.ellipsis, maxLines: 1)),
                  ],
                ),
              ),
              const SizedBox(height: KSizes.spaceBtwSections),

              /// Categories

              Text('Category', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: KSizes.spaceBtwItems),
              KGridLayout(
                mainAxisExtent: 20,
                itemCount: KDummyData.categories.length,
                itemBuilder: (_, index) => InkWell(
                  onTap: () {},
                  splashColor: KHelperFunctions.isDarkMode(context)
                      ? KColors.darkerGrey
                      : Colors.grey,
                  child: Row(
                    children: [
                      const Icon(Icons.circle_outlined, size: 18),
                      const SizedBox(width: KSizes.spaceBtwItems / 2),
                      Flexible(
                          child: Text(KDummyData.categories[index].name,
                              overflow: TextOverflow.ellipsis, maxLines: 1)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: KSizes.spaceBtwSections),

              /// Sort by Radios
              Text('Pricing', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: KSizes.spaceBtwItems / 2),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                          decoration:
                              const InputDecoration(hintText: '\$ Lowest'))),
                  const SizedBox(width: KSizes.spaceBtwItems),
                  Expanded(
                      child: TextFormField(
                          decoration:
                              const InputDecoration(hintText: '\$ Highest'))),
                ],
              ),
              const SizedBox(height: KSizes.spaceBtwSections),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text('Apply'))),
              const SizedBox(height: KSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
