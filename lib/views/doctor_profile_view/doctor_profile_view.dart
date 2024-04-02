import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduateproject/utils/consts/consts.dart';
import 'package:graduateproject/res/components/custom_buttun.dart';
import 'package:graduateproject/views/book_appointment_view/book_appointment_view.dart';


class DoctorProfileView extends StatelessWidget {
  final DocumentSnapshot doc;
  const DoctorProfileView({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.5),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: AppStyle.bold(
            size: 18, title: "Doctor Details", color: AppColor.whiteColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/doctor.jpg"),
                      radius: 40,
                    ),
                    10.widthBox,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppStyle.bold(
                              size: 18,
                              title: doc['docName'],
                              color: Colors.black),
                          AppStyle.bold(
                              size: 12,
                              title: doc['docCategory'],
                              color: AppColor.textfieldGrey.withOpacity(0.5)),
                          const Spacer(),
                          VxRating(
                            onRatingUpdate: (value) {},
                            maxRating: 5,
                            count: 5,
                            value: double.parse(doc['docRating'].toString()),
                            stepInt: true,
                            selectionColor: Colors.yellowAccent,
                          ),
                        ],
                      ),
                    ),
                    AppStyle.bold(
                        size: 12, title: "see all reviews", color: Colors.blue),
                  ],
                ),
              ),
              10.heightBox,
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColor.whiteColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: AppStyle.bold(
                          title: "Phone Number", color: CupertinoColors.black),
                      subtitle: AppStyle.normal(
                        title: doc['docPhone'],
                        color: Colors.black.withOpacity(0.5),
                        size: 12,
                      ),
                      trailing: Container(
                        width: 50,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.yellow,
                        ),
                        child: Icon(
                          Icons.phone,
                          color: AppColor.whiteColor,
                        ),
                      ),
                    ),
                    10.heightBox,
                    AppStyle.bold(
                        title: "About", color: CupertinoColors.black, size: 16),
                    5.heightBox,
                    AppStyle.bold(
                        title: doc['docAbout'],
                        color: CupertinoColors.black.withOpacity(0.4),
                        size: 14),
                    10.heightBox,
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined),
                        const SizedBox(
                          width: 5,
                        ),
                        AppStyle.bold(
                            title: "Address",
                            color: CupertinoColors.black,
                            size: 16),
                      ],
                    ),
                    5.heightBox,
                    AppStyle.bold(
                        title: doc['docAddress'],
                        color: CupertinoColors.black.withOpacity(0.4),
                        size: 12),
                    10.heightBox,
                    Row(
                      children: [
                        const Icon(Icons.access_time_filled),
                        const SizedBox(
                          width: 5,
                        ),
                        AppStyle.bold(
                            title: "Working Time",
                            color: CupertinoColors.black,
                            size: 16),
                      ],
                    ),
                    5.heightBox,
                    AppStyle.bold(
                        title: doc['docTiming'],
                        color: CupertinoColors.black.withOpacity(0.4),
                        size: 12),
                    10.heightBox,
                    AppStyle.bold(
                        title: "Services",
                        color: CupertinoColors.black,
                        size: 16),
                    5.heightBox,
                    AppStyle.bold(
                        title: doc['docService'],
                        color: CupertinoColors.black.withOpacity(0.4),
                        size: 12),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomButton(
          onTap: () {
            Get.to(() => BookAppointmentView(
                  docId: doc['docId'],
                  docName: doc['docName'],
                ));
          },
          buttonText: "Book an appointment",
        ),
      ),
    );
  }
}
