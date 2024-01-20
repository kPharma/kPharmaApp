import 'package:flutter/material.dart';
import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/images/t_circular_image.dart';
import '../../../../../common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import '../../../../../common/widgets/texts/t_product_price_text.dart';
import '../../../../../common/widgets/texts/t_product_title_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/product/product_controller.dart';
import '../../../models/product_model.dart';

class KProductMetaData extends StatelessWidget {
  const KProductMetaData({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = ProductController.instance
        .calculateSalePercentage(product.price, product.salePrice);
    final darkMode = KHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
          children: [
            /// -- Sale Tag
            if (salePercentage != null)
              Row(
                children: [
                  KRoundedContainer(
                    backgroundColor: KColors.secondary,
                    radius: KSizes.sm,
                    padding: const EdgeInsets.symmetric(
                        horizontal: KSizes.sm, vertical: KSizes.xs),
                    child: Text('$salePercentage%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: KColors.black)),
                  ),
                  const SizedBox(width: KSizes.spaceBtwItems)
                ],
              ),

            // Actual Price if sale price not null.
            if ((product.productVariations == null ||
                    product.productVariations!.isEmpty) &&
                product.salePrice > 0.0)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.price.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .apply(decoration: TextDecoration.lineThrough),
                  ),
                  const SizedBox(width: KSizes.spaceBtwItems)
                ],
              ),

            // Price, Show sale price as main price if sale exist.
            KProductPriceText(
                price: controller.getProductPrice(product), isLarge: true),
          ],
        ),
        const SizedBox(height: KSizes.spaceBtwItems / 1.5),
        KProductTitleText(title: product.title),
        const SizedBox(height: KSizes.spaceBtwItems / 1.5),
        Row(
          children: [
            const KProductTitleText(title: 'Stock : ', smallSize: true),
            Text(controller.getProductStockStatus(product),
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: KSizes.spaceBtwItems / 2),

        /// Brand
        Row(
          children: [
            KCircularImage(
              image: product.brand!.image,
              width: 32,
              height: 32,
              overlayColor: darkMode ? KColors.white : KColors.black,
            ),
            KBrandTitleWithVerifiedIcon(
                title: product.brand!.name, brandTextSize: TexKSizes.medium),
          ],
        ),
      ],
    );
  }
}
