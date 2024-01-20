import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/products/cart/add_remove_cart_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/t_product_price_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/product/cart_controller.dart';

class KCartItems extends StatelessWidget {
  const KCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final cartItems = cartController.cartItems;
    return Obx(
      () {
        return ListView.separated(
          shrinkWrap: true,
          itemCount: cartItems.length,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) =>
              const SizedBox(height: KSizes.spaceBtwSections),
          itemBuilder: (context, index) {
            return Obx(
              () {
                final item = cartItems[index];
                return Column(
                  children: [
                    /// -- Cart Items
                    KCartItem(item: item),
                    if (showAddRemoveButtons)
                      const SizedBox(height: KSizes.spaceBtwItems),

                    /// -- Add Remove Buttons and Price Total
                    if (showAddRemoveButtons)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// -- Add Remove Buttons
                          Row(
                            children: [
                              // Use to add space to the left of Buttons as image space.
                              const SizedBox(width: 70),

                              /// Add Remove Buttons
                              KProductQuantityWithAddRemoveButton(
                                width: 32,
                                height: 32,
                                iconSize: KSizes.md,
                                quantity: item.quantity,
                                addBackgroundColor: KColors.primary,
                                removeForegroundColor:
                                    KHelperFunctions.isDarkMode(context)
                                        ? KColors.white
                                        : KColors.black,
                                removeBackgroundColor:
                                    KHelperFunctions.isDarkMode(context)
                                        ? KColors.darkerGrey
                                        : KColors.light,
                                add: () => cartController.addOneToCart(item),
                                remove: () =>
                                    cartController.removeOneFromCart(item),
                              ),
                            ],
                          ),

                          /// -- Product total price
                          KProductPriceText(
                              price: (item.price * item.quantity)
                                  .toStringAsFixed(1)),
                        ],
                      )
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
