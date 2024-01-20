import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../features/shop/controllers/product/product_controller.dart';
import '../../../../features/shop/models/product_model.dart';
import '../../../../features/shop/screens/product_detail/product_detail.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../styles/shadows.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../images/t_rounded_image.dart';
import '../../texts/t_brand_title_text_with_verified_icon.dart';
import '../../texts/t_product_price_text.dart';
import '../../texts/t_product_title_text.dart';
import '../favourite_icon/favourite_icon.dart';
import '../product_cards/product_card_add_to_card_button.dart';

class KProductCardVertical extends StatelessWidget {
  const KProductCardVertical(
      {super.key, required this.product, this.isNetworkImage = true});

  final ProductModel product;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    final productController = ProductController.instance;
    final salePercentage = productController.calculateSalePercentage(
        product.price, product.salePrice);
    final dark = KHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),

      /// Container with side paddings, color, edges, radius and shadow.
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [KShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(KSizes.productImageRadius),
          color: dark ? KColors.darkerGrey : KColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Thumbnail, Wishlist Button, Discount Tag
            KRoundedContainer(
              height: 180,
              width: 180,
              padding: const EdgeInsets.all(KSizes.sm),
              backgroundColor: dark ? KColors.dark : KColors.light,
              child: Stack(
                children: [
                  /// -- Thumbnail Image
                  Center(
                      child: KRoundedImage(
                          imageUrl: product.thumbnail,
                          applyImageRadius: true,
                          isNetworkImage: isNetworkImage)),

                  /// -- Sale Tag
                  if (salePercentage != null)
                    Positioned(
                      top: 12,
                      child: KRoundedContainer(
                        radius: KSizes.sm,
                        backgroundColor: KColors.secondary.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: KSizes.sm, vertical: KSizes.xs),
                        child: Text('$salePercentage%',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: KColors.black)),
                      ),
                    ),

                  /// -- Favourite Icon Button
                  Positioned(
                    top: 0,
                    right: 0,
                    child: KFavouriteIcon(productId: product.id),
                  ),
                ],
              ),
            ),
            const SizedBox(height: KSizes.spaceBtwItems / 2),

            /// -- Details
            Padding(
              padding: const EdgeInsets.only(left: KSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  KProductTitleText(title: product.title, smallSize: true),
                  const SizedBox(height: KSizes.spaceBtwItems / 2),
                  KBrandTitleWithVerifiedIcon(
                      title: product.brand!.name,
                      brandTextSize: TexKSizes.small),
                ],
              ),
            ),

            /// Price & Add to cart button
            /// Use Spacer() to utilize all the space and set the price and cart button at the bottom.
            /// This usually happens when Product title is in single line or 2 lines (Max)
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Pricing
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Actual Price if sale price not null
                      if (product.productType ==
                              ProductType.single.toString() &&
                          product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: KSizes.sm),
                          child: Text(
                            product.price.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),

                      /// Price, Show sale price as main price if sale exist.
                      Padding(
                        padding: const EdgeInsets.only(left: KSizes.sm),
                        child: KProductPriceText(
                            price: ProductController.instance
                                .getProductPrice(product)),
                      ),
                    ],
                  ),
                ),

                /// Add to cart
                ProductCardAddToCartButton(product: product),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
