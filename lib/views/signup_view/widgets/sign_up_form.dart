import 'package:get/get.dart';
import 'package:graduateproject/controllers/auth_controller.dart';
import 'package:graduateproject/utils/consts/consts.dart';
import 'package:graduateproject/views/home_view/home.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import 'terms_and_conditions_checkbox.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  var isDoctor = false;
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return Form(
      child: Column(
        children: [
          //UserName
          TextField(
            expands: false,
            controller: controller.fullnameController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.user_edit),
              label: Text(TTexts.username),
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwInputFields),

          //Email
          TextField(
            controller: controller.emailController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct),
              label: Text(TTexts.email),
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwInputFields),

          //Password
          TextField(
            controller: controller.passwordController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.password_check),
              label: Text(TTexts.password),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          SwitchListTile(
              title: "SignUp as a Doctor".text.make(),
              value: isDoctor,
              onChanged: (newValue) {
                setState(() {
                  isDoctor = newValue;
                });
              }),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          Visibility(
            visible: isDoctor,
            child: Column(
              children: [
                TextField(
                  controller: controller.aboutController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.text),
                    label: Text("about"),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                TextField(
                  controller: controller.categoryController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.category),
                    label: Text("category"),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                TextField(
                  controller: controller.servicesController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.medical_services),
                    label: Text("services"),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                TextField(
                  controller: controller.addressController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.location_add),
                    label: Text("address"),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                TextField(
                  controller: controller.phoneController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    label: Text("phone number"),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                TextField(
                  controller: controller.timingController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.timer_11),
                    label: Text("timing"),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
              ],
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Terms & Conditions of CheckBox
          const TermsAndConditionsCheckBox(),

          const SizedBox(height: TSizes.spaceBtwSections),

          // create account Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () async {
                  await controller.signupUser(isDoctor);
                  if (controller.userCredential != null) {
                    Get.offAll(() => const Home());
                  }
                  // Get.to(() => const VerifyEmailScreen());
                },
                child: const Text(TTexts.createAccount)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppStyle.normal(title: "do have an acount ?"),
              8.widthBox,
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: AppStyle.normal(title: " Log in", size: 15),
              )
            ],
          )
        ],
      ),
    );
  }
}
