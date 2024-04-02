import 'package:get/get.dart';
import 'package:graduateproject/res/components/custom_buttun.dart';
import 'package:graduateproject/res/components/custom_textfield.dart';

import '../../utils/consts/consts.dart';
import '../../controllers/appointment_controller.dart';

class BookAppointmentView extends StatelessWidget {
  final String docId;
  final String docName;
  const BookAppointmentView({
    super.key,
    required this.docName,
    required this.docId,
  });

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppointmnetController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:
            AppStyle.bold(size: 18, title: docName, color: AppColor.whiteColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppStyle.bold(title: "Select appointment day"),
              5.heightBox,
              CustomTextField(
                hint: "Select day",
                textController: controller.appDayController,
              ),
              10.heightBox,
              AppStyle.bold(title: "Select appointment time"),
              5.heightBox,
              CustomTextField(
                  hint: "Select time",
                  textController: controller.appTimeController),
              20.heightBox,
              AppStyle.bold(title: "Mobile Number"),
              5.heightBox,
              CustomTextField(
                  hint: "Enter your mobile number",
                  textController: controller.appMobileController),
              10.heightBox,
              AppStyle.bold(title: "Full Name"),
              5.heightBox,
              CustomTextField(
                  hint: "Enter full name",
                  textController: controller.appNameController),
              10.heightBox,
              AppStyle.bold(title: "Message:"),
              5.heightBox,
              CustomTextField(
                  hint: "Enter the message",
                  textController: controller.appMessageController),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => Padding(
          padding: const EdgeInsets.all(10.0),
          child: controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : CustomButton(
                  onTap: () async {
                    await controller.bookAppointment(docId , docName , context);
                  },
                  buttonText: "Book an appointment",
                ),
        ),
      ),
    );
  }
}
