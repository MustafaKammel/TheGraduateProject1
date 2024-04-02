import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:graduateproject/controllers/auth_controller.dart';
import 'package:graduateproject/views/appointment_details_view/appointment_details_view.dart';

import '../../utils/consts/consts.dart';
import '../../controllers/appointment_controller.dart';

class AppointmentView extends StatelessWidget {
  final bool isDoctor;
  const AppointmentView({super.key, this.isDoctor = false});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppointmnetController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: AppStyle.bold(
            size: 18,
            title: "Appoinments",
            color: AppColor.whiteColor,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  AuthController().signout();
                },
                icon: const Icon(Icons.power_settings_new_rounded))
          ],
        ),
        body: FutureBuilder<QuerySnapshot>(
          future: controller.getAppointments(isDoctor),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              var data = snapshot.data?.docs;

              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  itemCount: data?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      onTap: () => Get.to(
                        () => AppointmentDetailsView(
                          doc: data[index],
                        ),
                      ),
                      leading: const CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/doctoricon.png"),
                      ),
                      title: AppStyle.bold(
                          title: data![index]
                              [!isDoctor ? 'appWithName' : 'appName']),
                      subtitle: AppStyle.normal(
                        title:
                            "${data[index]['appDay']} - ${data[index]['appTime']}",
                        color: Colors.black.withOpacity(0.5),
                      ),
                    );
                  },
                ),
              );
            }
          },
        ));
  }
}
