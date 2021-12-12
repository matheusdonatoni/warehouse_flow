import '../models/spot.dart';
import '../models/address.dart';

import '_impl/base_repository_impl.dart';

class AddressRepository extends BaseRepositoryImpl {
  Future<List<Address>> find(Spot spot) async {
    var result = await localStorage.findAddresses(spot);

    return List.from(
      result.map(
        (e) => Address.fromMap(e),
      ),
    );
  }

  Future<List<String>> findNames(Spot spot) async {
    var result = await localStorage.findAddressNames(spot);

    return List.from(
      result.map(
        (e) => e['name'],
      ),
    );
  }

  Future<List<String>> findIndicators(Spot spot, String? name) async {
    var result = await localStorage.findAddressIndicators(spot, name);

    return List.from(
      result.map(
        (e) => e['indicator'],
      ),
    );
  }

  Future<Address> findFromAddress(
    Spot spot,
    Address street,
  ) async {
    var result = await localStorage.findAddressFromAddress(
      spot,
      street,
    );

    return Address.fromMap(result);
  }
}
