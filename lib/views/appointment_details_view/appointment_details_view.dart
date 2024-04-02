import 'package:cloud_firestore/cloud_firestore.dart';

import '../../utils/consts/consts.dart';

class AppointmentDetailsView extends StatelessWidget {
  final DocumentSnapshot doc;
  const AppointmentDetailsView({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: AppStyle.bold(
            size: 18, title: doc['appWithName'], color: AppColor.whiteColor),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppStyle.bold(title: "Select appointment day"),
          5.heightBox,
          AppStyle.normal(title: doc['appDay']),
          10.heightBox,
          AppStyle.bold(title: "Select appointment time"),
          5.heightBox,
          AppStyle.normal(title: doc['appTime']),
          20.heightBox,
          AppStyle.bold(title: "Mobile Number"),
          5.heightBox,
          AppStyle.normal(title: doc['appMobile']),
          10.heightBox,
          AppStyle.bold(title: "Full Name"),
          5.heightBox,
          AppStyle.normal(title: doc['appName']),
          10.heightBox,
          AppStyle.bold(title: "Message:"),
          5.heightBox,
          AppStyle.normal(title: doc['appMsg']),
        ],
      ),
    );
  }
}
