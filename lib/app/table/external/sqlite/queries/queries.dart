import 'consts.dart';

class Query {
  static String warehouseWithRegiseter(int id) {
    return '''SELECT 
    $kWarehouseAlais,
    $kSpotAlais,
    $kAddressAlias,
    $kPositionAlias,
    $kRegisterAlias,
    $kOperationAlias,
    $kProductAlias
    FROM warehouses
    LEFT JOIN registers
    ON warehouses.id = registers.warehouseId
    LEFT JOIN operations
    ON registers.id = operations.registerId
    LEFT JOIN spots
    ON spots.id = operations.spotId
    LEFT JOIN addresses
    ON addresses.id = operations.addressId
    LEFT JOIN positions
    ON positions.id = operations.positionId
    LEFT JOIN products
    ON products.id = operations.productId
    WHERE registers.warehouseId = $id
    ORDER BY operations.createdAt DESC''';
  }

  static String findAllProducts() {
    return '''SELECT * FROM products''';
  }
}
