import 'package:kPharma/data/repositories/product/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../common/widgets/products/product_cards/product_card_horizontal.dart';
import '../../../../common/widgets/shimmers/horizontal_product_shimmer.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';
import '../../controllers/categories_controller.dart';
import '../../models/category_model.dart';
import '../all_products/all_products.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: KAppBar(showBackArrow: true, title: Text(category.name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(KSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const KRoundedImage(
                  width: double.infinity,
                  imageUrl: KImages.promoBanner3,
                  applyImageRadius: true),
              const SizedBox(height: KSizes.spaceBtwSections),

              /// Sub Categories
              FutureBuilder(
                future: controller.getSubCategories(category.id),
                builder: (_, snapshot) {
                  /// Handle Loader, No Record, OR Error Message
                  const loader = KHorizontalProductShimmer();
                  final widget = KCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot, loader: loader);
                  if (widget != null) return widget;

                  /// Record found.
                  final subCategories = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: subCategories.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      final subCategory = subCategories[index];

                      /// Fetch Category Products
                      return FutureBuilder(
                        future: controller.getCategoryProducts(
                            categoryId: subCategory.id),
                        builder: (_, snapshot) {
                          /// Handle Loader, No Record, OR Error Message
                          final widget =
                              KCloudHelperFunctions.checkMultiRecordState(
                                  snapshot: snapshot, loader: loader);
                          if (widget != null) return widget;

                          /// Congratulations 🎊 Record found.
                          final products = snapshot.data!;
                          return Column(
                            children: [
                              /// Sub Category Heading
                              KSectionHeading(
                                title: subCategory.name,
                                showActionButton: true,
                                onPressed: () => Get.to(() => AllProducts(
                                      title: subCategory.name,
                                      future: ProductRepository.instance
                                          .getProductsForCategory(
                                              categoryId: subCategory.id,
                                              limit: -1),
                                    )),
                              ),
                              const SizedBox(height: KSizes.spaceBtwItems / 2),

                              /// Sub Category Products
                              SizedBox(
                                height: 120,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: products.length,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                          width: KSizes.spaceBtwItems),
                                  itemBuilder: (context, index) =>
                                      KProductCardHorizontal(
                                          product: products[index]),
                                ),
                              ),
                              const SizedBox(height: KSizes.spaceBtwSections),
                            ],
                          );
                        },
                      );
                    },
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
