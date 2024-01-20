import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../common/widgets/products/cart/billing_amount_section.dart';
import '../../../../common/widgets/products/cart/coupon_code.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../../utils/helpers/pricing_calculator.dart';
import '../../../../utils/popups/loaders.dart';
import '../../controllers/dummy_data.dart';
import '../../controllers/product/cart_controller.dart';
import '../../controllers/product/order_controller.dart';
import '../cart/widgets/cart_items.dart';
import 'widgets/billing_address_section.dart';
import 'widgets/billing_payment_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    final orderController = Get.put(OrderController());
    final totalAmount = KPricingCalculator.calculateTotalPrice(subTotal, 'US');
    final dark = KHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const KAppBar(title: Text('Order Review'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(KSizes.defaultSpace),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// -- Items in Cart
              const KCartItems(showAddRemoveButtons: false),
              const SizedBox(height: KSizes.spaceBtwSections),

              /// -- Coupon TextField
              const KCouponCode(),
              const SizedBox(height: KSizes.spaceBtwSections),

              /// -- Billing Section
              KRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(KSizes.md),
                backgroundColor: dark ? KColors.black : KColors.white,
                child: Column(
                  children: [
                    /// Pricing
                    KBillingAmountSection(subTotal: subTotal),
                    const SizedBox(height: KSizes.spaceBtwItems),

                    /// Divider
                    const Divider(),
                    const SizedBox(height: KSizes.spaceBtwItems),

                    /// Payment Methods
                    const KBillingPaymentSection(),
                    const SizedBox(height: KSizes.spaceBtwSections),

                    /// Address
                    KBillingAddressSection(
                      name: KDummyData.user.fullName,
                      phoneNumber: KDummyData.user.formattedPhoneNo,
                      address: KDummyData.user.addresses.toString(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: KSizes.spaceBtwSections),
            ],
          ),
        ),
      ),

      /// -- Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(KSizes.defaultSpace),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: subTotal > 0
                ? () => orderController.processOrder(totalAmount)
                : () => KLoaders.warningSnackBar(
                    title: 'Empty Cart',
                    message: 'Add items in the cart in order to proceed.'),
            child: Text('Checkout \$$totalAmount'),
          ),
        ),
      ),
    );
  }
}
