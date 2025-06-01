import 'package:blue_design/utils/app_assets.dart';
import 'package:blue_design/utils/app_colors.dart';
import 'package:blue_design/utils/app_font_style.dart';
import 'package:blue_design/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _showImagesType = 1;
  int _selectedIndex = 0;
 
  final List<Map<String, dynamic>> _pages = [
    {'title': "Home", "icon": Icon(Icons.home), "page": HomeScreen()},
    {'title': "Favourite", "icon": Icon(Icons.favorite), "page": HomeScreen()},
    {
      'title': "Shopping",
      "icon": Icon(Icons.shopping_bag),
      "page": HomeScreen(),
    },
    {'title': "Profile", "icon": Icon(Icons.person), "page": HomeScreen()},
  ];
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     List<String> currentImages;
      if (_showImagesType == 1) {
    currentImages = AppAssets.pkImages;
  } else if (_showImagesType == 2) {
    currentImages = AppAssets.chinaImages;
  } else if (_showImagesType == 3) {
    currentImages = AppAssets.canadaImages;
  } else if (_showImagesType == 4) {
    currentImages = AppAssets.australiaImages;
  } else {
    currentImages = [];
  }
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(top: 30),
          child: Text(
            AppStrings.textHi +
                ' ' +
                AppStrings.userName +
                AppStrings.textExclamationMark,
            style: AppFontStyle.boldText,
          ),
        ),

        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20, top: 10),
            child: Icon(Icons.search, color: AppColors.iconColorGrey),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: Text(AppStrings.textCenter, style: AppFontStyle.greyText),
          ),
          SizedBox(height: 30),
          Container(
            height: 90,
            width: MediaQuery.of(context).size.width,
            color: AppColors.textColorWhite,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
               
                   setState(() {
                     _showImagesType=1;
                   });
                        debugPrint("show images $_showImagesType ");
                  },
                  child: customContainer(
                    AppColors.boxBlueColor,
                    AppAssets.pkImage,
                    AppStrings.countryPakistan,
                  ),
                ),

                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                       setState(() {
                     _showImagesType=2;
                   });
                    debugPrint("show images $_showImagesType");
                  },
                  child: customContainer(
                    AppColors.boxPinkColor,
                    AppAssets.chinaImage,
                    AppStrings.countryChina,
                  ),
                ),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                       setState(() {
                     _showImagesType=3;
                   });
                    debugPrint("show images $_showImagesType ");
                  },
                  child: customContainer(
                    AppColors.boxOrangeColor,
                    AppAssets.canadaImage,
                    AppStrings.countryCanada,
                  ),
                ),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                     setState(() {
                     _showImagesType=4;
                   });
                    debugPrint("show images $_showImagesType ");
                  },
                  child: customContainer(
                    AppColors.boxPurpleColor,
                    AppAssets.australiaImage,
                    AppStrings.countryAustrailia,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  AppStrings.bestDestinationText,
                  style: AppFontStyle.boldNormalText,
                ),
              ),

              Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text(AppStrings.seeAllText),
              ),
            ],
          ),
          SizedBox(height: 10),
          SingleChildScrollView(child: showImagesContainer(currentImages)),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() => {_selectedIndex = index});
        },
        unselectedItemColor: AppColors.textColorBlack,
        selectedItemColor: Colors.black,
       
        items: List.generate(_pages.length, (index) {
          return BottomNavigationBarItem(
            icon: _pages[index]['icon'],
            label: _pages[index]['title'],
          );
        }),
      ),
    );
  }

  Widget customContainer(color, icon, label) {
    return Container(
      width: 90,
      height: 130,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 60,
            width: 70,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(child: Image.asset(icon, height: 20)),
          ),
          SizedBox(height: 10),
          Text(label, style: AppFontStyle.boldSmallText),
        ],
      ),
    );
  }

  Widget showImagesContainer(currentImages) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 260,
      decoration: BoxDecoration(color: Colors.white),
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(4, (index) {
          
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
             
              child: Image.asset(
  
                currentImages[index], fit: BoxFit.cover),
        
            ),
          );
        }),
      ),
    );
  }
}
