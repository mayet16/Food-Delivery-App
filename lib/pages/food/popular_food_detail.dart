import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketing_app/utils/dimensions.dart';
import 'package:marketing_app/widgets/app_column.dart';
import 'package:marketing_app/widgets/expandable_text_widget.dart';

import '../../utils/colors.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
            left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height:  Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/images/food0.png"
                    )
                  )
                ),
          )),
          //icon widget
          Positioned(
             top: Dimensions.height45,
             left: Dimensions.width20,
              right: Dimensions.width20,
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   AppIcon(icon: Icons.arrow_back_ios),
                   AppIcon(icon: Icons.shopping_cart_outlined)
                 ],
              )),
          //intriduction of food
          Positioned(
              left: 0,
              right: 0,
              top: Dimensions.popularFoodImgSize-20,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                      topLeft: Radius.circular(Dimensions.radius20) ),
                  color: Colors.white,

                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: "Ethiopian side",),
                    SizedBox(height: Dimensions.height20),
                    BigText(text: "Introduce"),
                    SizedBox(height: Dimensions.height20),
                    Expanded(child: SingleChildScrollView(child: ExpandableTextWidget(text: "My name is Mayet Bekele, I have a BSc degree in Software Engineering with CGPA of 3.9 at Bahir Dar university, Bahir Dar, Ethiopia. I am writing to you with regard to the possibility of undertaking me as Junior Software Engineer, and I feel I have the knowledge and abilities required to make a valuable contribution to your organization while on such a placement. I have the ability to Develop Software’s as well as control and administrator websites, databases and servers. I have experience in software development at Dventus Wind Technologies Company as Java Backend Developer and Android Application Developer. I have the ability to develop web applications using ASP.net Core framework (C#), Java Programming Language. I have knowledge in testing (using JUnit5) and debugging new software’s and updated software’s, and migrate existing projects to latest programming language version (expert debugger) to remove support from central repositories for each dependency library."))),

                  ],
                )

          )),

        ],
      ),
      bottomNavigationBar: Container(
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
               child: Row(
                 children: [
                   Icon(Icons.remove, color: AppColors.signColor,),
                   SizedBox(width: Dimensions.width10/2,),
                   BigText(text: "0"),
                   SizedBox(width: Dimensions.width10/2,),
                   Icon(Icons.add, color: AppColors.signColor,),
                 ],
               ),
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
    );
  }
}
