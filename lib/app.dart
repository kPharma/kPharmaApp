import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:kPharma/features/authentication/screens/onboarding/onboarding.dart';
import 'package:kPharma/utils/constants/text_strings.dart';
import 'package:kPharma/utils/theme/theme.dart';
import 'package:provider/provider.dart';
import '../features/personalization/screens/profile/profile_view_model.dart'; // Import your ViewModel

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileViewModel(),
      child: GetMaterialApp(
        title: KTexts.appName,
        themeMode: ThemeMode.system,
        theme: KAppTheme.lightTheme,
        darkTheme: KAppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: const OnBoardingScreen(),
      ),
    );
  }
}
