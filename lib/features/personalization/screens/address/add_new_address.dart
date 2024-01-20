import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/validators/validation.dart';
import '../../controllers/address_controller.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      appBar:
          const KAppBar(showBackArrow: true, title: Text('Add new Address')),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(KSizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: controller.name,
                  validator: (value) =>
                      KValidator.validateEmptyText('Name', value),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user), labelText: 'Name'),
                ),
                const SizedBox(height: KSizes.spaceBtwInputFields),
                TextFormField(
                  controller: controller.phoneNumber,
                  validator: KValidator.validatePhoneNumber,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.mobile),
                      labelText: 'Phone Number'),
                ),
                const SizedBox(height: KSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.street,
                        validator: (value) =>
                            KValidator.validateEmptyText('Street', value),
                        expands: false,
                        decoration: const InputDecoration(
                          labelText: 'Street',
                          prefixIcon: Icon(Iconsax.building_31),
                        ),
                      ),
                    ),
                    const SizedBox(width: KSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                        controller: controller.postalCode,
                        validator: (value) =>
                            KValidator.validateEmptyText('Postal Code', value),
                        expands: false,
                        decoration: const InputDecoration(
                          labelText: 'Postal Code',
                          prefixIcon: Icon(Iconsax.code),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: KSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.city,
                        validator: (value) =>
                            KValidator.validateEmptyText('City', value),
                        expands: false,
                        decoration: const InputDecoration(
                          labelText: 'City',
                          prefixIcon: Icon(Iconsax.building),
                        ),
                      ),
                    ),
                    const SizedBox(width: KSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                        controller: controller.state,
                        validator: (value) =>
                            KValidator.validateEmptyText('State', value),
                        expands: false,
                        decoration: const InputDecoration(
                          labelText: 'State',
                          prefixIcon: Icon(Iconsax.activity),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: KSizes.spaceBtwInputFields),
                TextFormField(
                  controller: controller.country,
                  validator: (value) =>
                      KValidator.validateEmptyText('Country', value),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.global), labelText: 'Country'),
                ),
                const SizedBox(height: KSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.addNewAddresses(),
                      child: const Text('Save')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
