import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduateproject/utils/constants/colors.dart';
import 'package:graduateproject/utils/helpers/helper_functions.dart';
import 'package:graduateproject/views/Favorite/favorite_page.dart';
import 'package:graduateproject/views/Home/home_page.dart';
import 'package:graduateproject/views/appointment_view/appointment_view.dart';
import 'package:graduateproject/views/category_view/category_view.dart';
import 'package:graduateproject/views/chat/chat_screens.dart';
import 'package:graduateproject/views/setting_view/settings_view.dart';
import 'package:iconsax/iconsax.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  List screanList = [
    const HomePage(),
    const AppointmentView(),
    const CategoryView(),
    const SettigsView(),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: darkMode ? MColors.black : MColors.white,
          indicatorColor: darkMode
              ? MColors.white.withOpacity(0.1)
              : MColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'home'),
            NavigationDestination(icon: Icon(Iconsax.book), label: 'schedule'),
            NavigationDestination(
                icon: Icon(Iconsax.category), label: 'Category'),
            NavigationDestination(icon: Icon(Iconsax.message), label: 'chat'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'favorite'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'settings'),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //     backgroundColor: Colors.blue,
      //     selectedIconTheme: const IconThemeData(color: Colors.white, size: 28),
      //     selectedLabelStyle: const TextStyle(color: Colors.white),
      //     unselectedItemColor: Colors.white.withOpacity(0.5),
      //     type: BottomNavigationBarType.fixed,
      //     onTap: (value) {
      //       setState(() {
      //         selectedIndex = value;
      //       });
      //     },
      //     currentIndex: selectedIndex,
      //     items: const [
      //       BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.book), label: "Appointment"),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.category), label: "Category"),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.settings), label: "settings"),
      //     ]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomePage(),
    const AppointmentView(),
    const CategoryView(),
    const ChatScreens(),
    const FavoriteScreen(),
    const SettigsView(),
  ];
}
