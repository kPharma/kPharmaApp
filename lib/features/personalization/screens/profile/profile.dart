import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/images/t_circular_image.dart';
import '../../../../common/widgets/shimmers/shimmer.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/user_controller.dart';
import 'change_name.dart';
import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: KAppBar(
        showBackArrow: true,
        title:
            Text('Profile', style: Theme.of(context).textTheme.headlineSmall),
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
                    Obx(() {
                      final isNetworkImage =
                          controller.user.value.profilePicture.isNotEmpty;
                      final image = isNetworkImage
                          ? controller.user.value.profilePicture
                          : KImages.user;
                      const loader =
                          KShimmerEffect(width: 80, height: 80, radius: 80);
                      return controller.imageUploading.value
                          ? loader
                          : KCircularImage(
                              image: image,
                              width: 80,
                              height: 80,
                              isNetworkImage: isNetworkImage);
                    }),
                    TextButton(
                        onPressed: controller.imageUploading.value
                            ? () {}
                            : () => controller.uploadUserProfilePicture(),
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
                  value: controller.user.value.fullName),
              KProfileMenu(
                  onPressed: () {},
                  title: 'Username',
                  value: controller.user.value.username),
              const SizedBox(height: KSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: KSizes.spaceBtwItems),
              const KSectionHeading(
                  title: 'Personal Information', showActionButton: false),
              const SizedBox(height: KSizes.spaceBtwItems),
              KProfileMenu(
                  onPressed: () {},
                  title: 'User ID',
                  value: '45689',
                  icon: Iconsax.copy),
              KProfileMenu(
                  onPressed: () {},
                  title: 'E-mail',
                  value: controller.user.value.email),
              KProfileMenu(
                  onPressed: () {},
                  title: 'Phone Number',
                  value: controller.user.value.phoneNumber),
              KProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),
              KProfileMenu(
                  onPressed: () {},
                  title: 'Date of Birth',
                  value: '1 Jan, 1900'),
              const Divider(),
              const SizedBox(height: KSizes.spaceBtwItems),
              Center(
                child: TextButton(
                    onPressed: () => controller.deleteAccountWarningPopup(),
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
