import 'package:covid_summary/app_constant.dart';
import 'package:covid_summary/blocs/summary_bloc.dart';
import 'package:covid_summary/components/category_box.dart';
import 'package:covid_summary/models/summary.dart';
import 'package:covid_summary/pages/home/covid_line_chart.dart';
import 'package:covid_summary/pages/home/top_cases_table.dart';
import 'package:covid_summary/utils/translations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.primaryColor,
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder(
          stream: bloc.summaryInfo,
          builder: (context, AsyncSnapshot<Summary> snapshot) {
            if (snapshot.hasError) return Text(snapshot.error.toString());

            return ListView(
              children: [
                _buildCategories(snapshot.data),
                CovidLineChart(),
                TopCasesTable(countries: snapshot?.data?.countries),
              ],
            );
          },
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        AppConstant.applicationName,
        style: TextStyle(color: AppConstant.mainTextColor),
      ),
      brightness: Brightness.light,
      elevation: 0,
      backgroundColor: AppConstant.primaryColor,
      leading: Icon(Icons.menu),
      actions: [
        IconButton(
          icon: Icon(
            Icons.refresh,
            color: Colors.grey[300],
          ),
          onPressed: () => bloc.fetchSummaryInfo(),
        )
      ],
    );
  }

  Widget _buildCategories(Summary summary) {
    String _convertedUpdateTime;
    if (summary == null) {
      _convertedUpdateTime = '';
      return Container(
        padding: EdgeInsets.all(10),
        child: Center(child: CircularProgressIndicator()),
      );
    } else {
      DateTime _updatedTime = DateTime.parse(summary.date).toLocal();
      _convertedUpdateTime =
          DateFormat('yyyy/MM/dd HH:mm').format(_updatedTime);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Translations.text('statistic'),
          style: TextStyle(
            color: AppConstant.mainTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Row(
          children: [
            CategoryBox(
              title: Translations.text('confirmed'),
              colors: [Color(0xffF37335), Color(0xffFDC830)],
              totalCase: summary?.global?.totalConfirmed,
              todayCase: summary?.global?.newConfirmed,
            ),
            CategoryBox(
              title: Translations.text('dead'),
              colors: [Color(0xffb31217), Color(0xffe52d27)],
              totalCase: summary?.global?.totalDeaths,
              todayCase: summary?.global?.newDeaths,
            ),
            CategoryBox(
              title: Translations.text('recover'),
              colors: [Color(0xff56ab2f), Color(0xffa8e063)],
              totalCase: summary?.global?.totalRecovered,
              todayCase: summary?.global?.newRecovered,
            ),
          ],
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Last updated: $_convertedUpdateTime',
              style: TextStyle(
                color: AppConstant.mainTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            Text(
              'Source: CSSE',
              style: TextStyle(
                color: AppConstant.mainTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 7,
        ),
      ],
    );
  }
}
