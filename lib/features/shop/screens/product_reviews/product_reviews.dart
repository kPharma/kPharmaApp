import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/dummy_data.dart';
import 'widgets/progress_indicator_and_rating.dart';
import 'widgets/rating_star.dart';
import 'widgets/review_details_container.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- Appbar
      appBar:
          const KAppBar(title: Text('Reviews & Ratings'), showBackArrow: true),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(KSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// -- Reviews List
              const Text(
                  "Ratings and reviews are verified and are from people who use the same type of device that you use."),
              const SizedBox(height: KSizes.spaceBtwItems),

              /// Overall Product Ratings
              const KOverallProductRating(),
              const KRatingBarIndicator(rating: 3.5),
              const Text("12,611"),
              const SizedBox(height: KSizes.spaceBtwSections),

              /// User Reviews List
              ListView.separated(
                shrinkWrap: true,
                itemCount: KDummyData.productReviews.length,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (_, __) =>
                    const SizedBox(height: KSizes.spaceBtwSections),
                itemBuilder: (_, index) => UserReviewCard(
                    productReview: KDummyData.productReviews[index]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
