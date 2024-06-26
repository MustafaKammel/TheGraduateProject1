import 'package:flutter/material.dart';
import 'package:graduateproject/utils/constants/image_string.dart';
import 'package:graduateproject/utils/constants/sizes.dart';


import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/text_strings.dart';
import '../../../../../../utils/helpers/helper_functions.dart';

class CustomVerticalCompletedCard extends StatelessWidget {
  const CustomVerticalCompletedCard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: dark ? MColors.darkContainer : MColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              spreadRadius: 2,
            ),
          ]),
      child: SizedBox(
        width: size.width,
        child: Column(
          children: [
            ListTile(
              title: Text(
                TTexts.nameDoctor2,
                style: Theme.of(context).textTheme.bodyLarge!.apply(
                      color: dark ? MColors.white : MColors.black,
                    ),
              ),
              subtitle: Text(
                TTexts.specialistDoctor2,
                style: Theme.of(context).textTheme.labelSmall!.apply(
                      color: dark ? MColors.white : MColors.black,
                    ),
              ),
              leading: const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(TImages.doctorImage1),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Divider(
                height: 20,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: dark ? MColors.white : MColors.black,
                    ),
                    const SizedBox(
                      width: TSizes.xs,
                    ),
                    Text(
                      "9/12/2023",
                      style: TextStyle(
                        color: dark ? MColors.white : MColors.black,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.access_time_filled,
                          color: dark ? MColors.white : MColors.black,
                        ),
                        const SizedBox(
                          width: TSizes.xs,
                        ),
                        Text(
                          "12:21 PM",
                          style: TextStyle(
                            color: dark ? MColors.white : MColors.black,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle),
                    ),
                    const SizedBox(
                      width: TSizes.xs,
                    ),
                    Text(
                      "Confirmed",
                      style: TextStyle(
                        color: dark ? MColors.white : MColors.black,
                      ),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: TSizes.md,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 140,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                        color: dark ? MColors.grey : const Color(0xffD3E6FF),
                        borderRadius: BorderRadius.circular(40)),
                    child: const Center(
                      child: Text(
                        "Re-Book",
                        style: TextStyle(color: MColors.primary),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 140,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                        color: MColors.primary,
                        borderRadius: BorderRadius.circular(40)),
                    child: const Center(
                      child: Text(
                        "Add Review",
                        style: TextStyle(
                          color: MColors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: TSizes.md,
            ),
          ],
        ),
      ),
    );
  }
}
