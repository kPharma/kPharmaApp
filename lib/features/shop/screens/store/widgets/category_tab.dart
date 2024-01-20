import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/cloud_helper_functions.dart';
import '../../../controllers/categories_controller.dart';
import '../../../models/category_model.dart';
import '../../all_products/all_products.dart';
import 'category_brands.dart';

class KCategoryTab extends StatelessWidget {
  const KCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(KSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Category Brands
              CategoryBrands(category: category),
              const SizedBox(height: KSizes.spaceBtwSections * 2),

              /// -- Category Products You May Like
              FutureBuilder(
                future: controller.getCategoryProducts(categoryId: category.id),
                builder: (context, snapshot) {
                  /// Helper Function: Handle Loader, No Record, OR ERROR Message
                  final response = KCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot,
                      loader: const KVerticalProductShimmer());
                  if (response != null) return response;

                  /// Record Found!
                  final products = snapshot.data!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      KSectionHeading(
                        title: 'You might like',
                        showActionButton: true,
                        onPressed: () => Get.to(AllProducts(
                          title: category.name,
                          future: controller.getCategoryProducts(
                              categoryId: category.id, limit: -1),
                        )),
                      ),
                      const SizedBox(height: KSizes.spaceBtwItems),
                      KGridLayout(
                        itemCount: products.length < 4 ? products.length : 4,
                        itemBuilder: (_, index) => KProductCardVertical(
                            product: products[index], isNetworkImage: true),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: KSizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
