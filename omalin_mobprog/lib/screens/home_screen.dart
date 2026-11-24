import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import '../widgets/custom_text.dart';
import 'newsfeed_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: FB_TEXT_COLOR_WHITE,
        shadowColor: Colors.grey,
        elevation: 2,
        title: CustomText(
          text: 'facebook',
          fontSize: 25.sp,
          color: FB_PRIMARY,
          fontWeight: FontWeight.bold,
        ),
      ),

      body: PageView(
        controller: pageController,
        onPageChanged: (page) {
          setState(() {
            selectedIndex = page;
          });
        },
        children: const [
          NewsFeedScreen(),
          Center(
            child: Text('Notifications'),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        selectedItemColor: FB_PRIMARY,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });

          pageController.jumpToPage(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
      ),
    );
  }
}