import 'package:kPharma/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/images/t_circular_image.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import 'change_name.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        showBackArrow: true,
        title: Text('Change Name',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(KSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const KCircularImage(
                        image: KImages.user, width: 80, height: 80),
                    TextButton(
                        onPressed: () {},
                        child: const Text('Change Profile Picture')),
                  ],
                ),
              ),
              const SizedBox(height: KSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: KSizes.spaceBtwItems),
              const KSectionHeading(
                  title: 'Profile Information', showActionButton: false),
              const SizedBox(height: KSizes.spaceBtwItems),
              KProfileMenu(
                  onPressed: () => Get.to(() => const ChangeName()),
                  title: 'Name',
                  value: 'Rawa Swr'),
              KProfileMenu(
                  onPressed: () {}, title: 'Username', value: 'Rawa.s'),
              const SizedBox(height: KSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: KSizes.spaceBtwItems),
              const KSectionHeading(
                  title: 'Personal Information', showActionButton: false),
              const SizedBox(height: KSizes.spaceBtwItems),
              KProfileMenu(
                  onPressed: () {},
                  title: 'User ID',
                  value: '00001',
                  icon: Iconsax.copy),
              KProfileMenu(
                  onPressed: () {},
                  title: 'E-mail',
                  value: 'rawa.priv@gmail.com'),
              KProfileMenu(
                  onPressed: () {},
                  title: 'Phone Number',
                  value: '+964 770 226 1000'),
              KProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),
              KProfileMenu(
                  onPressed: () {},
                  title: 'Date of Birth',
                  value: '1 Jan, 1999'),
              const Divider(),
              const SizedBox(height: KSizes.spaceBtwItems),
              Center(
                child: TextButton(
                    onPressed: () {},
                    child: const Text('Close Account',
                        style: TextStyle(color: Colors.red))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
