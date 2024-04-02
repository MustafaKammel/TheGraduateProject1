import 'package:flutter/material.dart';
import 'package:graduateproject/utils/constants/sizes.dart';


import 'widgets/custom_vertical_upcoming_card.dart';

class Upcomingschedule extends StatelessWidget {
  const Upcomingschedule({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomVerticalUpcomingCard(),
          SizedBox(height: TSizes.spaceBtwItems),
          CustomVerticalUpcomingCard(),
          SizedBox(height: TSizes.spaceBtwItems),
          CustomVerticalUpcomingCard(),
          SizedBox(height: TSizes.spaceBtwItems),
          CustomVerticalUpcomingCard(),
          SizedBox(height: TSizes.spaceBtwItems),
        ],
      ),
    );
  }
}

