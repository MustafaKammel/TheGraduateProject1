import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduateproject/common/styles/spacing_styles.dart';
import 'package:graduateproject/common/widgets/widgets_login_signup/form_divider.dart';
import 'package:graduateproject/common/widgets/widgets_login_signup/social_buttons.dart';
import 'package:graduateproject/utils/constants/sizes.dart';
import 'package:graduateproject/utils/constants/text_strings.dart';
import 'package:graduateproject/views/login_view/widgets/login_form.dart';
import 'package:graduateproject/views/login_view/widgets/login_header.dart';

import '../../controllers/auth_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var isDoctor = false;

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Padding(
            padding: MSpacingStyle.paddingWithAppBarHeight,
            child: Column(
              children: [
                // Expanded(
                //     child: Image.asset(
                //   icLogin,
                //   width: 200,
                // )),
                // AppStyle.bold(title: "wellcome back", size: 25),

                const LoginHeader(),

                const LoginForm(),

                FormDivider(dividerText: TTexts.orSignInWith.capitalize!),

                const SizedBox(height: TSizes.spaceBtwItems),

                //Footer
                const SocialButtons(),

                //Form
                // Expanded(
                //     flex: 3,
                //     child: Form(
                //         child: SingleChildScrollView(
                //       child: Column(
                //         children: [
                //           60.heightBox,
                //           CustomTextField(
                //               hint: email,
                //               textController: controller.emailController),
                //           const SizedBox(height: 10),
                //           CustomTextField(
                //             hint: password,
                //             textController: controller.passwordController,
                //           ),
                //           10.heightBox,
                //           SwitchListTile(
                //             value: isDoctor,
                //             onChanged: (newValue) {
                //               setState(() {
                //                 isDoctor = newValue;
                //               });
                //             },
                //             title: "Sign in as a Doctor".text.make(),
                //           ),
                //           const SizedBox(height: 20),
                //           forgetPassword.text.make(),
                //           const SizedBox(height: 20),
                //           CustomButton(
                //             buttonText: "log in ",
                //             onTap: () async {
                //               await controller.loginUser();
                //               if (controller.userCredential != null) {
                //                 if (isDoctor) {
                //                   Get.offAll(() => const AppointmentView());
                //                 } else {
                //                   Get.offAll(() => const Home());
                //                 }
                //               }
                //             },
                //           ),
                //           20.heightBox,
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               AppStyle.normal(title: "don't have an acount ?"),
                //               8.widthBox,
                //               GestureDetector(
                //                 onTap: () {
                //                   Get.to(() => const SignUpView());
                //                 },
                //                 child: AppStyle.normal(title: " Sign Up", size: 15),
                //               )
                //             ],
                //           )
                //         ],
                //       ),
                //     )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
