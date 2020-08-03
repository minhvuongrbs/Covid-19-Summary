import 'package:covid_summary/models/summary.dart';
import 'package:covid_summary/resources/summary_api_provider.dart';

class Repository {
  final summaryApiProvider = SummaryApiRepository();

  Future<Summary> fetchSummaryInfo() => summaryApiProvider.fetchSummaryInfo();
}
