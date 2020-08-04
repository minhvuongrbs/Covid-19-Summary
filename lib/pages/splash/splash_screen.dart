import 'package:covid_summary/app_constant.dart';
import 'package:covid_summary/blocs/summary_bloc.dart';
import 'package:covid_summary/pages/home/home_screen.dart';
import 'package:covid_summary/utils/size_config.dart';
import 'package:covid_summary/utils/translations.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Image stayHomeImage;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      bloc.fetchSummaryInfo();
    });

    Future.delayed(Duration(milliseconds: 1200), () {
      Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 15),
            Image.asset(
              AppConstant.manWithLaptopImage,
              height: MediaQuery.of(context).size.height / 2,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  Translations.text('covid_19'),
                  style: TextStyle(
                    color: AppConstant.secondTextColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  Translations.text('splash_banner_slogan'),
                  style: TextStyle(
                    color: AppConstant.secondTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 30, top: 25),
                  padding: EdgeInsets.all(8),
                  width: SizeConfig.screenWidth * 0.85,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppConstant.primaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    Translations.text('get_started'),
                    style: TextStyle(
                      color: AppConstant.mainTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
