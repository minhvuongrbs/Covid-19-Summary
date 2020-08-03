import 'package:covid_summary/models/summary.dart';
import 'package:dio/dio.dart';

class SummaryApiRepository {
  Future<Summary> fetchSummaryInfo() async {
    try {
      Response response = await Dio().get('https://api.covid19api.com/summary');
      if (response.statusCode == 200) {
        Summary summary = Summary.fromJson(response.data);
        return summary;
      }
    } catch (e) {
      throw Exception('Fail to get summary info');
    }
  }
}
