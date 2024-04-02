import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:graduateproject/utils/consts/consts.dart';

import '../doctor_profile_view/doctor_profile_view.dart';

class SearchView extends StatelessWidget {
  final String searchQuery;
  const SearchView({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: AppStyle.bold(
            title: "Search result", color: AppColor.whiteColor, size: 18),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('doctors').get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 170,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  var doc = snapshot.data!.docs[index];
                  return !(doc['docName'].toString().toLowerCase())
                          .contains(searchQuery.toLowerCase())
                      ? const SizedBox.shrink()
                      : GestureDetector(
                          onTap: () {
                            Get.to(() => DoctorProfileView(
                                  doc: doc,
                                ));
                          },
                          child: Container(
                            padding:
                                const EdgeInsets.only(left: 10, bottom: 10),
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(16)),
                            margin: const EdgeInsets.only(right: 8),
                            width: 150,
                            height: 100,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      doctor,
                                      width: 170,
                                      scale: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  5.heightBox,
                                  AppStyle.normal(
                                      title: doc['docName'],
                                      color: Colors.black),
                                  VxRating(
                                    onRatingUpdate: (value) {},
                                    count: 5,
                                    value: double.parse(
                                        doc['docRating'].toString()),
                                    stepInt: true,
                                    selectionColor: Colors.yellowAccent,
                                    maxRating: 5,
                                  ),
                                ]),
                          )
                        );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
