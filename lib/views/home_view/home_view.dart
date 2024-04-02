import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'package:graduateproject/utils/consts/consts.dart';
import 'package:graduateproject/res/components/custom_textfield.dart';
import 'package:graduateproject/views/category_details_view/category_details_view.dart';
import 'package:graduateproject/views/doctor_profile_view/doctor_profile_view.dart';

import '../../controllers/home_controller.dart';
import '../search_view/search_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.blue,
        foregroundColor: Colors.white,
        title: Row(
          children: [
            AppStyle.normal(
              title: wellcome,
              size: 20,
              color: Colors.white,
            ),
            AppStyle.normal(
              title: "user",
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: const EdgeInsets.all(14),
            color: AppColor.blue,
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    inputColor:  AppColor.whiteColor,
                    textController: controller.searchQueryController,
                    hint: Search,
                    borderColor: AppColor.whiteColor,
                    textColor: AppColor.whiteColor,
                  ),
                ),
                10.widthBox,
                IconButton(
                    onPressed: () {
                      Get.to(() => SearchView(
                            searchQuery: controller.searchQueryController.text,
                          ));
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30,
                    ))
              ],
            ),
          ),
          20.heightBox,
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(
                            () => CategoryDetailsView(
                              catName: text[index],
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.only(right: 8),
                          child: Column(children: [
                            Image.asset(
                              icons[index],
                              width: 30,
                              color: Colors.white,
                            ),
                            AppStyle.normal(
                                title: text[index],
                                color: Colors.white)
                          ]),
                        ),
                      );
                    },
                  ),
                ),
                19.heightBox,
                Align(
                  alignment: Alignment.centerLeft,
                  child: AppStyle.bold(
                      title: "popular Doctors ", color: Colors.blue, size: 20),
                ),
                10.heightBox,
                FutureBuilder<QuerySnapshot>(
                  future: controller.getDoctorList(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      var data = snapshot.data?.docs;
                      return SizedBox(
                        height: 150,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: data?.length ?? 0,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(() => DoctorProfileView(
                                      doc: data[index],
                                    ));
                              },
                              child: Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(16)),
                                margin: const EdgeInsets.only(right: 8),
                                width: 150,
                                height: 100,
                                child: Column(children: [
                                  Container(
                                    width: 150,
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      doctor,
                                      width: 130,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  5.heightBox,
                                  AppStyle.normal(
                                      title: data![index]['docName'],
                                      color: Colors.black),
                                  AppStyle.normal(
                                      title: data[index]['docCategory'],
                                      color: Colors.black54),
                                ]),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
                5.heightBox,
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {},
                    child: AppStyle.normal(
                        title: "view all", size: 15, color: Colors.blue),
                  ),
                ),
                30.heightBox,
                GestureDetector(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        4,
                        (index) => Container(
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Image.asset(
                                    icBody,
                                    width: 20,
                                    color: Colors.white,
                                  ),
                                  AppStyle.normal(
                                      title: "Lab Test ", color: Colors.white)
                                ],
                              ),
                            )),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
