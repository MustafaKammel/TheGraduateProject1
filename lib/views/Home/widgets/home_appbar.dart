import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/app_bar/appbar.dart';
import '../../../../../common/widgets/appointments/appointment_counter_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      title: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Iconsax.menu,
              color: MColors.white,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TTexts.homeAppBarTitle,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: MColors.grey),
              ),
              Text(
                TTexts.homeAppBarSubTitle,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: MColors.white),
              ),
            ],
          ),
        ],
      ),
      actions: [
        AppointmentCounterIcon(
          onpressed: () {},
          iconColor: MColors.white,
        ),
      ],
    );
  }
}
