class QueryHelper {
  static String get findWarehouseWithRegister => '''SELECT
    json_object(
      'id', id, 
      'name', name,
      'createdAt', createdAt,
      'updatedAt', updatedAt,
      'register', (
        SELECT
        json_object(
          'id', id, 
          'createdAt', createdAt,
          'updatedAt', updatedAt,
          'operations', (
            SELECT
            json_group_array(
              json_object(
                'id', id, 
                'amount', amount,
                'type', type,
                'createdAt', createdAt,
                'updatedAt', updatedAt,
                'product', (
                  SELECT
                  json_object(
                    'id', id, 
                    'code', code,
                    'description', description,
                    'unit', unit,
                    'type', type,
                    'createdAt', createdAt,
                    'updatedAt', updatedAt
                  ) FROM products WHERE products.id = operations.productId
                ), 
                'position', (
                  SELECT
                  json_object(
                    'id', id, 
                    'height', height,
                    'depth', depth,
                    'type', type,
                    'createdAt', createdAt,
                    'updatedAt', updatedAt
                  ) FROM positions WHERE positions.id = operations.positionId
                ), 
                'address', (
                  SELECT
                  json_object(
                    'id', id, 
                    'name', name,
                    'indicator', indicator,
                    'createdAt', createdAt,
                    'updatedAt', updatedAt
                  ) FROM addresses WHERE addresses.id = operations.addressId
                ), 
                'spot', (
                  SELECT
                  json_object(
                    'id', id, 
                    'name', name,
                    'createdAt', createdAt,
                    'updatedAt', updatedAt
                  ) FROM spots WHERE spots.id = operations.spotId
                ) 
              )
            ) FROM operations WHERE operations.registerId = registers.id
          )
        ) FROM registers WHERE registers.warehouseId = warehouses.id
      ) 
    ) AS json FROM warehouses WHERE warehouses.id = ?''';

  static String get findAllProducts => '''SELECT
   json_group_array(
     json_object(
        'id', id, 
        'code', code,
        'description', description,
        'unit', unit, 
        'type', type, 
        'createdAt', createdat, 
        'updatedAt', updatedat
      )
    ) as json FROM products''';
}

// Aliased columns query for easier joined table operations.

  // final String _warehouseQuery = '''warehouses.id as warehouse_id,
  // warehouses.name as warehouse_name,
  // warehouses.createdat as warehouse_createdAt,
  // warehouses.updatedat as warehouse_updatedAt''';

  // final String _spotQuery = '''spots.id as spot_id,
  // spots.name as spot_name,
  // spots.createdat as spot_createdAt,
  // spots.updatedat as spot_updatedAt''';

  // final String _addressQuery = '''addresses.id as address_id,
  // addresses.name as address_name,
  // addresses.indicator as address_indicator,
  // addresses.createdat as address_createdAt,
  // addresses.updatedat as address_updatedAt''';

  // final String _positionQuery = '''positions.id as position_id,
  // positions.height as position_height,
  // positions.depth as position_depth,
  // positions.type as position_type,
  // positions.createdat as position_createdAt,
  // positions.updatedat as position_updatedAt''';

  // final String _registerQuery = '''registers.id as register_id,
  // registers.warehouseId as register_warehouseId,
  // registers.createdat as register_createdAt,
  // registers.updatedat as register_updatedAt''';

  // final String _operationQuery = '''operations.id as operation_id,
  // operations.amount as operation_amount,
  // operations.type as operation_type,
  // operations.spotId as operation_spotId,
  // operations.addressId as operation_addressId,
  // operations.positionId as operation_positionId,
  // operations.registerId as operation_registerId,
  // operations.productId as operation_productId,
  // operations.createdat as operation_createdAt,
  // operations.updatedat as operation_updatedAt''';

  // final String _productQuery = '''products.id as product_id,
  // products.code as product_code,
  // products.description as product_description,
  // products.unit as product_unit,
  // products.type as product_type,
  // products.createdat as product_createdAt,
  // products.updatedat as product_updatedAt''';

  // static String findWarehouseWithResiter(int id) {
  //   final helper = QueryHelper();

  //   return '''SELECT
  //   ${helper._warehouseQuery},
  //   ${helper._registerQuery},
  //   ${helper._spotQuery},
  //   ${helper._spotQuery},
  //   ${helper._addressQuery},
  //   ${helper._positionQuery},
  //   ${helper._operationQuery},
  //   ${helper._productQuery}
  //   FROM warehouses
  //   LEFT JOIN registers
  //   ON warehouses.id = registers.warehouseId
  //   LEFT JOIN operations
  //   ON registers.id = operations.registerId
  //   LEFT JOIN spots
  //   ON spots.id = operations.spotId
  //   LEFT JOIN addresses
  //   ON addresses.id = operations.addressId
  //   LEFT JOIN positions
  //   ON positions.id = operations.positionId
  //   LEFT JOIN products
  //   ON products.id = operations.productId
  //   WHERE registers.warehouseId = $id
  //   ORDER BY operations.createdAt DESC''';
  // }