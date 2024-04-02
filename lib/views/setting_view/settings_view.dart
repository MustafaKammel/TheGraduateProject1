import 'package:get/get.dart';
import 'package:graduateproject/utils/consts/consts.dart';
import 'package:graduateproject/controllers/auth_controller.dart';
import 'package:graduateproject/views/login_view/login_view.dart';

import '../../controllers/setting_controller.dart';

class SettigsView extends StatelessWidget {
  const SettigsView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SettingController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.blue,
        title: AppStyle.bold(
            title: settings, color: AppColor.whiteColor, size: 18),
        elevation: 0.0,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/doctor.jpg"),
                    ),
                    title: AppStyle.bold(title: controller.username.value),
                    subtitle: AppStyle.normal(title: controller.email.value),
                  ),
                  const Divider(),
                  10.heightBox,
                  ListView(
                    shrinkWrap: true,
                    children: List.generate(
                      settingsList.length,
                      (index) => ListTile(
                        onTap: () async {
                          if (index == 2) {
                            AuthController().signout();
                            Get.offAll(() => const LoginView());
                          }
                        },
                        leading: Icon(
                          settingListicon[index],
                          color: AppColor.blue,
                        ),
                        title: AppStyle.bold(
                          title: settingsList[index],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
