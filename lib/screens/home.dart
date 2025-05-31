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
  @override
  Widget build(BuildContext context) {
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
                customContainer(
                  AppColors.boxBlueColor,
                  "assets/images/PK.png",
                  AppStrings.countryPakistan,
                ),
                SizedBox(width: 5),
                customContainer(
                  AppColors.boxPinkColor,
                  "assets/images/C.png",
                  AppStrings.countryChina,
                ),
                SizedBox(width: 5),
                customContainer(
                  AppColors.boxOrangeColor,
                  "assets/images/CD.jpg",
                  AppStrings.countryCanada,
                ),
                SizedBox(width: 5),
                customContainer(
                  AppColors.boxPurpleColor,
                  "assets/images/AU.png",
                  AppStrings.countryAustrailia,
                ),
              ],
            ),
          ),
          SizedBox(height:20),
          Row(children: [
             Padding(padding: EdgeInsets.only(left:10),
            child:Text(AppStrings.bestDestinationText,style:AppFontStyle.boldNormalText)
            ),
           
            Spacer(),
            Padding(padding: EdgeInsets.only(right:10),
            child:Text(AppStrings.seeAllText)
            )
          ],)
        ],
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
}
