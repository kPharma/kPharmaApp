import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/address_controller.dart';
import '../../../models/address_model.dart';

class KSingleAddress extends StatelessWidget {
  const KSingleAddress({
    super.key,
    required this.address,
    required this.onTap,
  });

  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final dark = KHelperFunctions.isDarkMode(context);
    return Obx(
      () {
        final selectedAddressId = controller.selectedAddress.value.id;
        final isAddressSelected = selectedAddressId == address.id;
        return GestureDetector(
          onTap: onTap,
          child: KRoundedContainer(
            showBorder: true,
            padding: const EdgeInsets.all(KSizes.md),
            width: double.infinity,
            backgroundColor: isAddressSelected
                ? KColors.primary.withOpacity(0.5)
                : Colors.transparent,
            borderColor: isAddressSelected
                ? Colors.transparent
                : dark
                    ? KColors.darkerGrey
                    : KColors.grey,
            margin: const EdgeInsets.only(bottom: KSizes.spaceBtwItems),
            child: Stack(
              children: [
                Positioned(
                  right: 5,
                  top: 0,
                  child: Icon(
                    isAddressSelected
                        ? Iconsax.tick_circle1
                        : Iconsax.tick_circle1,
                    color: isAddressSelected
                        ? KColors.primary
                        : dark
                            ? KColors.darkerGrey
                            : KColors.grey,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      address.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: KSizes.sm / 2),
                    Text(address.formattedPhoneNo,
                        maxLines: 1, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: KSizes.sm / 2),
                    Text(address.toString(), softWrap: true),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
