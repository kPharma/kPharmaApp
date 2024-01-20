import 'package:get/get_navigation/src/routes/get_route.dart';
import '../features/authentication/screens/login/login.dart';
import '../features/authentication/screens/onboarding/onboarding.dart';
import '../features/authentication/screens/password_configuration/forget_password.dart';
import '../features/authentication/screens/signup/signup.dart';
import '../features/authentication/screens/signup/verify_email.dart';
import '../features/personalization/screens/address/address.dart';
import '../features/personalization/screens/profile/profile.dart';
import '../features/personalization/screens/setting/settings.dart';
import '../features/shop/screens/cart/cart.dart';
import '../features/shop/screens/checkout/checkout.dart';
import '../features/shop/screens/favourites/favourite.dart';
import '../features/shop/screens/home/home.dart';
import '../features/shop/screens/order/order.dart';
import '../features/shop/screens/product_reviews/product_reviews.dart';
import '../features/shop/screens/search/search.dart';
import '../features/shop/screens/store/store.dart';
import 'routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: KRoutes.home, page: () => const HomeScreen()),
    GetPage(name: KRoutes.store, page: () => const StoreScreen()),
    GetPage(name: KRoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: KRoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: KRoutes.search, page: () => SearchScreen()),
    GetPage(
        name: KRoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: KRoutes.order, page: () => const OrderScreen()),
    GetPage(name: KRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: KRoutes.cart, page: () => const CartScreen()),
    GetPage(name: KRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: KRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: KRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: KRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: KRoutes.signIn, page: () => const LoginScreen()),
    // GetPage(name: KRoutes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: KRoutes.onBoarding, page: () => const OnBoardingScreen()),
    // Add more GetPage entries as needed
  ];
}
