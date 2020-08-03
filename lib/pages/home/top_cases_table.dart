import 'package:covid_summary/app_constant.dart';
import 'package:covid_summary/models/summary.dart';
import 'package:covid_summary/utils/convert_utils.dart';
import 'package:covid_summary/utils/translations.dart';
import 'package:flutter/material.dart';

class TopCasesTable extends StatelessWidget {
  final List<Country> countries;

  const TopCasesTable({this.countries = const <Country>[], Key key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Country> orderCountries;
    if (countries == null) {
      orderCountries = [];
    } else {
      countries.sort((a, b) => b.totalConfirmed - a.totalConfirmed);
      orderCountries = countries.sublist(0, 4);
    }
    return Container(
      height: 300,
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: DataTable(
        columnSpacing: 5,
        horizontalMargin: 5,
        columns: [
          DataColumn(
              label: Text(
            Translations.text('country'),
            style: AppConstant.tableHeaderColor,
          )),
          DataColumn(
              label: Text(
            Translations.text('total_cases'),
            style: AppConstant.tableHeaderColor,
          )),
          DataColumn(
              label: Text(
            Translations.text('new_cases'),
            style: AppConstant.tableHeaderColor,
          )),
        ],
        rows: _buildCountryContent(orderCountries),
      ),
    );
  }

  List<DataRow> _buildCountryContent(List<Country> orderCountries) {
    return orderCountries
        .map(
          (country) => DataRow(
            cells: [
              DataCell(
                Text(
                  country.country,
                  style: TextStyle(
                    color: AppConstant.secondTextColor,
                  ),
                ),
              ),
              DataCell(
                Text(
                  ConvertUntils.insertCommasToNumber(country.totalConfirmed),
                  style: TextStyle(
                    color: AppConstant.secondTextColor,
                  ),
                ),
              ),
              DataCell(
                Text(
                  ConvertUntils.insertCommasToNumber(country.newConfirmed),
                  style: TextStyle(
                    color: AppConstant.secondTextColor,
                  ),
                ),
              ),
            ],
          ),
        )
        .toList();
  }
}
