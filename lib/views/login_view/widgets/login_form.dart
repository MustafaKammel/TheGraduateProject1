import 'package:get/get.dart';
import 'package:graduateproject/controllers/auth_controller.dart';
import 'package:graduateproject/utils/consts/consts.dart';
import 'package:graduateproject/views/appointment_view/appointment_view.dart';
import 'package:graduateproject/views/home_view/home.dart';
import 'package:graduateproject/views/signup_view/signup_view.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var isDoctor = false;
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            // Email
            TextField(
              controller: controller.emailController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                label: Text(TTexts.email),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            // Password
            TextField(
              controller: controller.passwordController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                label: Text(TTexts.password),
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            SwitchListTile(
              value: isDoctor,
              onChanged: (newValue) {
                setState(() {
                  isDoctor = newValue;
                });
              },
              title: "Sign in as a Doctor".text.make(),
            ),

            // Remember and forget password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(TTexts.rememberMe),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  // => Get.to(() => const ForgetPassword()),
                  child: const Text(TTexts.forgetPassword),
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.lg,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await controller.loginUser();
                  if (controller.userCredential != null) {
                    if (isDoctor) {
                      Get.offAll(() => const AppointmentView());
                    } else {
                      Get.offAll(() => const Home());
                    }
                  }
                  //Get.to(() => const NavigationMenu());
                },
                child: const Text(TTexts.signIn),
              ),
            ),
            const SizedBox(
              height: TSizes.lg,
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Get.to(() => const SignUpView());
                  // Get.to(() => const SignUpScreen());
                },
                child: const Text(TTexts.createAccount),
              ),
            )
          ],
        ),
      ),
    );
  }
}
