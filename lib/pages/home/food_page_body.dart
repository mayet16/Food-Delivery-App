import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketing_app/utils/colors.dart';
import 'package:marketing_app/utils/dimensions.dart';
import 'package:marketing_app/widgets/icon_and_text_widget.dart';
import 'package:marketing_app/widgets/small_text.dart';

import '../../widgets/app_column.dart';
import '../../widgets/big_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController=PageController(viewportFraction: 0.8);
  var _currPageValue=0.0;
  double _scaleFactor=0.8;
  var _height=Dimensions.pageViewContainer;

  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState() {
        _currPageValue = pageController.page!;
      }
    });
  }
  @override
  void dispose(){
    pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider section
      Container(
      // color: Colors.redAccent,
      height: Dimensions.pageView,
      child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          itemBuilder: (context, position){
            return _buildPageItem(position);
          }),
    ),
      //dots swction
      new DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
          )
        ),
        //popular text
        SizedBox(height: Dimensions.height30,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30,),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: EdgeInsets.only(bottom: 3),
                child: BigText(text: ".", color: Colors.black26,),
              ),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: EdgeInsets.only(bottom: 3),
                child: SmallText(text: "Food Pairing"),
              ),
            ],
          ),
        ),
        //list of foods and images

        ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index){
                return Container(
                  margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height10),
                  child: Row(
                    children: [
                      //image scroll section
                      Container(
                        width:Dimensions.listViewImageSize,
                        height: Dimensions.listViewImageSize,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                            color: Colors.white38,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                                image: AssetImage(
                                    "assets/images/food0.png"
                                )
                            )
                        ),
                      ),
                      //text section
                      Expanded(
                        child: Container(
                          height: Dimensions.listVievTextContSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius20),
                              bottomRight: Radius.circular(Dimensions.radius20),
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(text: "Nutritous meal food in ethiopia"),
                                SizedBox(height: Dimensions.height10,),
                                SmallText(text: "with Ethiopian characteristics"),
                                SizedBox(height: Dimensions.height10,),
                                Row(
                                  children: [
                                    IconAndTextWidget(
                                        icon: Icons.circle_sharp,
                                        text: 'Normal',
                                        iconColor: AppColors.iconColor1
                                    ),

                                    IconAndTextWidget(
                                        icon: Icons.location_on,
                                        text: '1.7Km  ',
                                        iconColor: AppColors.mainColor
                                    ),
                                    IconAndTextWidget(
                                        icon: Icons.access_time_rounded,
                                        text: '32Min',
                                        iconColor: AppColors.iconColor2
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),

      ],
    );
  }
  Widget _buildPageItem(int index){
    Matrix4 matrix =new Matrix4.identity();
    if(index==_currPageValue.floor()){
      var _currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans=_height*(1-_currScale)/2;
      matrix=Matrix4.diagonal3Values(1, _currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }
    else  if(index==_currPageValue.floor()+1){
      var _currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans=_height*(1-_currScale)/2;
      matrix=Matrix4.diagonal3Values(1, _currScale, 1);
      matrix=Matrix4.diagonal3Values(1, _currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else  if(index==_currPageValue.floor()-1){
      var _currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans=_height*(1-_currScale)/2;
      matrix=Matrix4.diagonal3Values(1, _currScale, 1);
      matrix=Matrix4.diagonal3Values(1, _currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else{
      var _currScale =0.8;
      matrix=Matrix4.diagonal3Values(1, _currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);
    }

    return Transform(
      transform:matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width10, right: Dimensions.width10
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven? Color(0xFF69c5df): Color(0xFF9294cc),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        "assets/images/food1.png"
                    )
                )
            ),
          ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30, bottom: Dimensions.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow:[
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5)
                    ),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(-5, 0)
                    ),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(5, 0)
                    ),
                  ]
              ),
                child: Container(
                  padding: EdgeInsets.only(top: Dimensions.height15, left: 15, right: 15),
                  child: AppColumn(text: "Ethiopian side"),
                ),
          ),
            )
        ],
      ),
    );
  }
}