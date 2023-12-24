import 'package:kPharma/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:kPharma/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:kPharma/home_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../common/widgets/products/cart/billing_amount_section.dart';
import '../../../../common/widgets/products/cart/coupon_code.dart';
import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../../utils/helpers/pricing_calculator.dart';
import '../../controllers/cart_controller.dart';
import '../../controllers/dummy_data.dart';
import '../cart/widgets/cart_items.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
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
            onPressed: () => Get.to(
              () => SuccessScreen(
                image: KImages.successfulPaymentIcon,
                title: 'Payment Success!',
                subTitle: 'Your item will be shipped soon!',
                onPressed: () => Get.offAll(() => const HomeMenu()),
              ),
            ),
            child: Text(
                'Checkout \$${KPricingCalculator.calculateTotalPrice(subTotal, 'US')}'),
          ),
        ),
      ),
    );
  }
}
