import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../features/personalization/models/user_model.dart';
import '../images/t_circular_image.dart';

class KUserProfileTile extends StatelessWidget {
  const KUserProfileTile({
    super.key,
    required this.user,
    required this.onPressed,
  });

  final UserModel user;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: KCircularImage(
          padding: 0,
          image: user.profilePicture,
          width: 50,
          height: 50,
          fit: BoxFit.cover),
      title: Text(user.fullName,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: KColors.white)),
      subtitle: Text(user.email,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: KColors.white)),
      trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(Iconsax.edit, color: KColors.white)),
    );
  }
}
