import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../../common/widgets/products/cart/bottom_add_to_cart_widget.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../models/product_model.dart';
import '../checkout/checkout.dart';
import '../product_reviews/product_reviews.dart';
import 'widgets/product_attributes.dart';
import 'widgets/product_detail_image_slider.dart';
import 'widgets/product_meta_data.dart';
import 'widgets/rating_share_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 1 - Product Image Slider
            KProducKImageslider(product: product),

            /// 2 - Product Details
            Container(
              padding: const EdgeInsets.only(
                  right: KSizes.defaultSpace,
                  left: KSizes.defaultSpace,
                  bottom: KSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// - Rating & Share
                  const KRatingAndShare(),

                  /// - Price, Title, Stock, & Brand
                  KProductMetaData(product: product),
                  const SizedBox(height: KSizes.spaceBtwSections / 2),

                  /// -- Attributes
                  // If Product has no variations do not show attributes as well.
                  if (product.productVariations != null &&
                      product.productVariations!.isNotEmpty)
                    KProductAttributes(product: product),
                  if (product.productVariations != null &&
                      product.productVariations!.isNotEmpty)
                    const SizedBox(height: KSizes.spaceBtwSections),

                  /// -- Checkout Button
                  SizedBox(
                    width: KDeviceUtils.getScreenWidth(context),
                    child: ElevatedButton(
                        child: const Text('Checkout'),
                        onPressed: () => Get.to(() => const CheckoutScreen())),
                  ),
                  const SizedBox(height: KSizes.spaceBtwSections),

                  /// - Description
                  const KSectionHeading(
                      title: 'Description', showActionButton: false),
                  const SizedBox(height: KSizes.spaceBtwItems),
                  // Read more package
                  ReadMoreText(
                    product.description!,
                    trimLines: 2,
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: KSizes.spaceBtwSections),

                  /// - Reviews
                  const Divider(),
                  const SizedBox(height: KSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const KSectionHeading(
                          title: 'Reviews (199)', showActionButton: false),
                      IconButton(
                        icon: const Icon(Iconsax.arrow_right_3, size: 18),
                        onPressed: () => Get.to(
                            () => const ProductReviewsScreen(),
                            fullscreenDialog: true),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: KBottomAddToCart(product: product),
    );
  }
}
