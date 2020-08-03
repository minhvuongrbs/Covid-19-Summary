import 'package:covid_summary/app_constant.dart';
import 'package:covid_summary/utils/convert_utils.dart';
import 'package:flutter/material.dart';

class CategoryBox extends StatelessWidget {
  final List<Color> colors;
  final Color textColor;
  final String title;
  final int totalCase;
  final int todayCase;

  const CategoryBox({
    Key key,
    this.colors,
    this.title = '',
    this.totalCase = 0,
    this.todayCase = 0,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5),
        height: 125,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              totalCase != null
                  ? ConvertUntils.insertCommasToNumber(totalCase)
                  : '',
              maxLines: 1,
              style: AppConstant.categoryBoxTextColor,
            ),
            Text(
              title,
              style: AppConstant.categoryBoxTextColor,
            ),
            Text(
              todayCase != null
                  ? '+${ConvertUntils.insertCommasToNumber(todayCase)}'
                  : '',
              style: AppConstant.categoryBoxTextColor,
            ),
          ],
        ),
      ),
    );
  }
}
