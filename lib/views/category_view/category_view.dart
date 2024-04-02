import 'package:get/get.dart';
import 'package:graduateproject/utils/consts/consts.dart';
import 'package:graduateproject/views/category_details_view/category_details_view.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColor.blue,
        title: AppStyle.bold(
            title: category, size: 18, color: AppColor.whiteColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            mainAxisExtent: 170,
          ),
          itemCount: icons.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Get.to(
                  () => CategoryDetailsView(catName: text[index],),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColor.blue, //AppColor.textfieldGrey
                  borderRadius: BorderRadius.circular(12),
                ),
                child:
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Align(alignment: Alignment.center,
                    //         child: Image.asset(iconList[index],width: 60,color: Vx.randomPrimaryColor,)
                    //     ),
                    //
                    //     30.heightBox,
                    //     AppStyle.bold(title: iconTitelList[index],color: Colors.black,size: 16),
                    //     10.heightBox,
                    //     AppStyle.normal(title: "13 specialists",color: AppColor.darkFontGrey.withOpacity(0.5),size: 12),
                    //   ],
                    // ),
                    Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          icons[index],
                          width: 60,
                          color: AppColor.whiteColor,
                        )),
                    30.heightBox,
                    AppStyle.bold(
                        title: text[index],
                        color: AppColor.whiteColor,
                        size: 16),
                    10.heightBox,
                    AppStyle.normal(
                        title: "13 specialists",
                        color: AppColor.whiteColor.withOpacity(0.5),
                        size: 12),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
