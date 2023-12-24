import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../common/widgets/appbar/appbar.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          const KAppBar(showBackArrow: true, title: Text('Add new Address')),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(KSizes.defaultSpace),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.user), labelText: 'Name'),
                  ),
                  const SizedBox(height: KSizes.spaceBtwInputFields),
                  TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.mobile),
                        labelText: 'Phone Number'),
                  ),
                  const SizedBox(height: KSizes.spaceBtwInputFields),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
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
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.global), labelText: 'Country'),
                  ),
                  const SizedBox(height: KSizes.defaultSpace),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Save')),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
