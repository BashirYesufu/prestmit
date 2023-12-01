import 'package:prestmit/network/repositories/bike/bike_repository_impl.dart';
import 'package:prestmit/network/repositories/bike/bike_service.dart';

class BikeRepository implements BikeRepositoryImpl {

  final _service = BikeService();

  @override
  Future<List<String>> getBikes() {
    return _service.getBikes();
  }

}