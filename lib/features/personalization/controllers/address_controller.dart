import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/texts/section_heading.dart';
import '../../../utils/constants/sizes.dart';
import '../../shop/controllers/dummy_data.dart';
import '../models/address_model.dart';
import '../screens/address/add_new_address.dart';
import '../screens/address/widgets/single_address_widget.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;

  // Add init to initialize some address by default.
  @override
  void onInit() {
    selectedAddress.value = KDummyData.user.addresses![0];
    super.onInit();
  }

  Future<dynamic> selectNewAddress(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(KSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const KSectionHeading(
                  title: 'Select Address', showActionButton: false),
              Column(
                children: KDummyData.user.addresses!
                    .map((address) => KSingleAddress(
                          address: address,
                          onTap: () {
                            selectedAddress.value = address;
                            Get.back();
                          },
                        ))
                    .toList(),
              ),
              const SizedBox(height: KSizes.defaultSpace * 2),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(() => const AddNewAddressScreen()),
                    child: const Text('Add new address')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
