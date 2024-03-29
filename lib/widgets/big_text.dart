import 'package:flutter/cupertino.dart';
import 'package:marketing_app/utils/dimensions.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow textOverflow;
  BigText({Key? key, this.color=const Color(0xFF322d2b), required this.text,
    this.size=0,
  this.textOverflow=TextOverflow.ellipsis}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
     text,
      maxLines: 1,
      overflow: textOverflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size==0? Dimensions.font20:size,
        fontWeight: FontWeight.w400
      ),
    );
  }
}
