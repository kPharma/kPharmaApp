import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'profile_view_model.dart';
import 'package:kPharma/features/personalization/screens/profile/widgets/profile_menu.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/images/t_circular_image.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileViewModel(),
      child: Consumer<ProfileViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: KAppBar(
              showBackArrow: true,
              title: Text('Profile',
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(KSizes.defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const KCircularImage(
                        image: KImages.user, width: 80, height: 80),
                    TextButton(
                        onPressed: () {},
                        child: const Text('Change Profile Picture')),
                    const SizedBox(height: KSizes.spaceBtwItems / 2),
                    const Divider(),
                    const SizedBox(height: KSizes.spaceBtwItems),
                    const KSectionHeading(
                        title: 'Profile Information', showActionButton: false),
                    const SizedBox(height: KSizes.spaceBtwItems),
                    KProfileMenu(
                      onPressed: () =>
                          _showNameChangeDialog(context, viewModel),
                      title: 'Name',
                      value: viewModel.userName,
                    ),
                    KProfileMenu(
                      onPressed: () =>
                          _showEmailChangeDialog(context, viewModel),
                      title: 'Email',
                      value: viewModel.email,
                    ),
                    // ... other widgets ...
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showNameChangeDialog(BuildContext context, ProfileViewModel viewModel) {
    showDialog(
      context: context,
      builder: (context) {
        String newName = '';
        return AlertDialog(
          title: const Text('Change Name'),
          content: TextField(
            onChanged: (value) => newName = value,
            decoration: const InputDecoration(hintText: "Enter new name"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                viewModel.changeName(newName);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showEmailChangeDialog(
      BuildContext context, ProfileViewModel viewModel) {
    showDialog(
      context: context,
      builder: (context) {
        String newEmail = '';
        return AlertDialog(
          title: const Text('Change Email'),
          content: TextField(
            onChanged: (value) => newEmail = value,
            decoration: const InputDecoration(hintText: "Enter new email"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                viewModel.changeEmail(newEmail);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
