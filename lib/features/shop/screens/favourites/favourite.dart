import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/icons/t_circular_icon.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../controllers/product_controller.dart';
import '../store/store.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        title:
            Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          KCircularIcon(
              icon: Iconsax.add,
              onPressed: () => Get.to(() => const StoreScreen()))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(KSizes.defaultSpace),
          child: Column(
            children: [
              /// Products Grid
              Obx(() {
                final products = ProductController.instance.favoriteProducts();
                return KGridLayout(
                  itemCount: products.length,
                  itemBuilder: (_, index) =>
                      KProductCardVertical(product: products[index]),
                );
              }),
              SizedBox(
                  height: KDeviceUtils.getBottomNavigationBarHeight() +
                      KSizes.defaultSpace),
            ],
          ),
        ),
      ),
    );
  }
}
