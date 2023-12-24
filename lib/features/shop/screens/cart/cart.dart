import 'package:kPharma/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/cart_controller.dart';
import '../checkout/checkout.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      /// -- AppBar
      appBar: KAppBar(
          showBackArrow: true,
          title:
              Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(KSizes.defaultSpace),

          /// -- Items in Cart
          child: KCartItems(),
        ),
      ),

      /// -- Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(KSizes.defaultSpace),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Get.to(() => const CheckoutScreen()),
            child:
                Obx(() => Text('Checkout ${controller.totalCartPrice.value}')),
          ),
        ),
      ),
    );
  }
}
