import 'package:feedtheneed/api/map_api.dart';
import 'package:feedtheneed/model/mapmodel.dart';
// import 'package:feedtheneed/model/Map.dart';

class MapRepository {
  Future<List<MapData?>> getMapDetails() async {
    return await MapApi().getMapDetails();
  }
}
