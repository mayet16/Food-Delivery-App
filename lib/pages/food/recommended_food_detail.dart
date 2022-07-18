import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketing_app/utils/colors.dart';
import 'package:marketing_app/utils/dimensions.dart';
import 'package:marketing_app/widgets/expandable_text_widget.dart';

import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';

class RecommenededFoodDetail extends StatelessWidget {
  const RecommenededFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers:[
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                child: Center(child: BigText(size:Dimensions.font26,text:"Ethiopian Side")),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10  ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/food0.png",
              width: double.maxFinite,
              fit: BoxFit.cover,),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  child: ExpandableTextWidget(text: "My name is Mayet Bekele, I have a BSc degree in Software Engineering with CGPA of 3.9 at Bahir Dar university, Bahir Dar, Ethiopia. I am writing to you with regard to the possibility of undertaking me as Junior Software Engineer, and I feel I have the knowledge and abilities required to make a valuable contribution to your organization while on such a placement. I have the ability to Develop Software’s as well as control and administrator websites, databases and servers. I have experience in software development at Dventus Wind Technologies Company as Java Backend Developer and Android Application Developer. I have the ability to develop web applications using ASP.net Core framework (C#), Java Programming Language. I have knowledge in testing (using JUnit5) and debugging new software’s and updated software’s, and migrate existing projects to latest programming language version (expert debugger) to remove support from central repositories for each dependency libraryAs you can see from my attached CV, I have studied BSc degree in Software Engineering from Bahir Dar University as top scorer with cumulative GPA of 3.90 on September 15 2021 G C My name is Mayet Bekele, I have a BSc degree in Software Engineering with CGPA of 3.9 at Bahir Dar university, Bahir Dar, Ethiopia. I am writing to you with regard to the possibility of undertaking me as Junior Software Engineer, and I feel I have the knowledge and abilities required to make a valuable contribution to your organization while on such a placement. I have the ability to Develop Software’s as well as control and administrator websites, databases and servers. I have experience in software development at Dventus Wind Technologies Company as Java Backend Developer and Android Application Developer. I have the ability to develop web applications using ASP.net Core framework (C#), Java Programming Language. I have knowledge in testing (using JUnit5) and debugging new software’s and updated software’s, and migrate existing projects to latest programming language version (expert debugger) to remove support from central repositories for each dependency libraryAs you can see from my attached CV, I have studied BSc degree in Software Engineering from Bahir Dar University as top scorer with cumulative GPA of 3.90 on September 15 2021 G C",),
                  margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                )
              ],
            ),
          )
        ]
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding:EdgeInsets.only(
              left: Dimensions.width20*2.5,
              right: Dimensions.width20*2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  iconSize: Dimensions.iconsize24,
                    iconColor:Colors.white,
                    backgroundColor:AppColors.mainColor,
                    icon: Icons.remove),
                
                BigText(text: "\$12.88 "+" X "+" 0",
                         color: AppColors.mainBlackColor, size: Dimensions.font26,),
                AppIcon(
                    iconSize: Dimensions.iconsize24,
                    iconColor:Colors.white,
                    backgroundColor:AppColors.mainColor,
                    icon: Icons.add),
              ],
            ),
          ),
          Container(
            height: Dimensions.bottomhieghtbar,
            padding: EdgeInsets.only(
                top: Dimensions.height30,
                bottom: Dimensions.height30,
                left: Dimensions.width20,
                right: Dimensions.width20),
            decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20*2),
                  topRight: Radius.circular(Dimensions.radius20*2),
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                  ),
                  child: Icon(Icons.favorite, color: AppColors.mainColor,),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  child: BigText(text: "\$10 | Add to cart",color: Colors.white,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
