import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/controllers/product_controller.dart';
import '../../../../features/shop/models/product_model.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import 'add_remove_cart_button.dart';

class KBottomAddToCart extends StatelessWidget {
  const KBottomAddToCart({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final productController = ProductController.instance;
    productController.initializeAlreadyAddedProductCount(product);
    final dark = KHelperFunctions.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: KSizes.defaultSpace, vertical: KSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? KColors.darkerGrey : KColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(KSizes.cardRadiusLg),
          topRight: Radius.circular(KSizes.cardRadiusLg),
        ),
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Add OR Remove Cart Product Icon Buttons
            KProductQuantityWithAddRemoveButton(
              quantity: productController.cartQuantity.value,
              add: () => productController.cartQuantity.value += 1,
              // Disable remove when cart count is less then 1
              remove: () => productController.cartQuantity.value < 1
                  ? null
                  : productController.cartQuantity.value -= 1,
            ),
            // Add to cart button
            ElevatedButton(
              onPressed: productController.cartQuantity.value < 1
                  ? null
                  : () => productController.addProductToCart(product),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(KSizes.md),
                backgroundColor: KColors.black,
                side: const BorderSide(color: KColors.black),
              ),
              child: const Row(
                children: [
                  Icon(Iconsax.shopping_bag),
                  SizedBox(width: KSizes.spaceBtwItems / 2),
                  Text('Add to Bag')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
