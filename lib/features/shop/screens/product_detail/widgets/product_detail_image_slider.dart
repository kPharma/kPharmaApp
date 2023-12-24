import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../common/widgets/products/favourite_icon/favourite_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/product_controller.dart';
import '../../../models/product_model.dart';

class KProducKImageslider extends StatelessWidget {
  const KProducKImageslider({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final isDark = KHelperFunctions.isDarkMode(context);
    final images = controller.getAllProducKImages(product);
    return KCurvedEdgesWidget(
      child: Container(
        color: isDark ? KColors.darkerGrey : KColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(KSizes.defaultSpace * 2),
                child: Center(
                  child: Obx(() {
                    final image = controller.selectedProductImage.value.isEmpty
                        ? product.thumbnail
                        : controller.selectedProductImage.value;
                    return GestureDetector(
                        onTap: () => controller.showEnlargedImage(image),
                        child: Image(
                            image: AssetImage(image), fit: BoxFit.contain));
                  }),
                ),
              ),
            ),

            /// Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: KSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: images.length,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: KSizes.spaceBtwItems),
                  itemBuilder: (_, index) {
                    return Obx(
                      () {
                        final imageSelected =
                            controller.selectedProductImage.value ==
                                images[index];
                        return KRoundedImage(
                          width: 80,
                          fit: BoxFit.contain,
                          imageUrl: images[index],
                          padding: const EdgeInsets.all(KSizes.sm),
                          backgroundColor:
                              isDark ? KColors.dark : KColors.white,
                          onPressed: () => controller
                              .selectedProductImage.value = images[index],
                          border: Border.all(
                              color: imageSelected
                                  ? KColors.primary
                                  : Colors.transparent),
                        );
                      },
                    );
                  },
                ),
              ),
            ),

            /// Appbar Icons
            KAppBar(
                showBackArrow: true,
                actions: [KFavouriteIcon(productId: product.id)]),
          ],
        ),
      ),
    );
  }
}
