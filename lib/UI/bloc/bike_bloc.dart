import 'package:rxdart/rxdart.dart';
import 'package:prestmit/network/repositories/bike/bike_repository.dart';

class BikeBloc {

  final _repo = BikeRepository();

  final _showProgressSubject = BehaviorSubject<bool>();
  Stream<bool> get progressStatusObservable => _showProgressSubject.stream;

  final _bikeSubject = PublishSubject<List<String>>();
  Stream<List<String>> get bikeResponse => _bikeSubject.stream;

  void getBikes() async {
    try {
      _showProgressSubject.sink.add(true);
      await _repo.getBikes().then((response) {
        _bikeSubject.sink.add(response);
        _showProgressSubject.sink.add(false);
      }, onError: (e) {
        _bikeSubject.sink.addError(e);
        _showProgressSubject.sink.add(false);
      });
    } catch (e) {
      _bikeSubject.sink.addError(e);
    }
  }
}