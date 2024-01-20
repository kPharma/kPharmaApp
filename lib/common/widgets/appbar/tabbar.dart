import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/helpers/helper_functions.dart';

/// A custom tab bar widget with customizable appearance.
class KTabBar extends StatelessWidget implements PreferredSizeWidget {
  /// Default constructor for the KTabBar.
  ///
  /// Parameters:
  ///   - tabs: List of widgets representing the tabs.
  const KTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return Material(
      color: dark
          ? KColors.black
          : KColors.white, // Background color of the tab bar
      child: TabBar(
        tabs: tabs, // List of tabs
        isScrollable: true, // Enable scrollable tabs
        indicatorColor: KColors.primary, // Color of the tab indicator
        labelColor: dark
            ? KColors.white
            : KColors.primary, // Color of the selected tab label
        unselectedLabelColor:
            KColors.darkGrey, // Color of unselected tab labels
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
      KDeviceUtils.getAppBarHeight()); // Preferred size of the tab bar
}
