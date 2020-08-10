import 'package:covid_summary/models/summary.dart';
import 'package:covid_summary/resources/repository.dart';
import 'package:rxdart/subjects.dart';

class SummaryBloc {
  final Repository _repository = Repository();
  final _summaryFetcher = PublishSubject<Summary>();

  Stream<Summary> get summaryInfo => _summaryFetcher.stream;

  fetchSummaryInfo() async {
    _summaryFetcher.sink.add(null);
    Summary summary = await _repository.fetchSummaryInfo();
    _summaryFetcher.sink.add(summary);
  }

  dispose() {
    _summaryFetcher.close();
  }
}

final bloc = SummaryBloc();
