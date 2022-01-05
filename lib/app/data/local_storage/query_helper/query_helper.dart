class QueryHelper {
  static String get _now => "strftime('%Y-%m-%dT%H:%M:%f', 'now')";

  static String get findWarehouseWithRegister {
    return '''SELECT
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
  }

  static String get findWarehouseOperations {
    return '''SELECT
    SELECT json_group_array(
      json_object(
        'id', operations.id, 
        'amount', operations.amount,
        'type', operations.type,
        'createdAt', operations.createdAt,
        'updatedAt', operations.updatedAt,
        'product', (
          SELECT 
          json_object(
            'id', products.id, 
            'code', products.code,
            'description', products.description,
            'unit', products.unit,
            'type', products.type,
            'createdAt', products.createdAt,
            'updatedAt', products.updatedAt
            ) FROM products WHERE products.id = operations.productId
        ), 
        'position', (
          SELECT
          json_object(
            'id', positions.id, 
            'height', positions.height,
            'depth', positions.depth,
            'type', positions.type,
            'createdAt', positions.createdAt,
            'updatedAt', positions.updatedAt
          ) FROM positions WHERE positions.id = operations.positionId
        ),
        'address', (
          SELECT
          json_object(
            'id', addresses.id, 
            'name', addresses.name,
            'indicator', addresses.indicator,
            'createdAt', addresses.createdAt,
            'updatedAt', addresses.updatedAt
          ) FROM addresses 
          JOIN positions
          ON addresses.id = positions.addressid
          WHERE positions.id = operations.positionid
        ), 
        'spot', (
          SELECT
          json_object(
            'id', spots.id, 
            'name', spots.name,
            'createdAt', spots.createdAt,
            'updatedAt', spots.updatedAt
          ) FROM spots
          JOIN addresses
          ON spots.id = addresses.spotid
          JOIN positions
          ON addresses.id = positions.addressid 
          WHERE positions.id = operations.positionid
        ) 
      )
    ) as json FROM operations 
    JOIN positions
    ON positions.id = operations.positionid
    JOIN addresses
    ON addresses.id = positions.addressid
    JOIN spots
    on spots.id = addresses.spotid
    JOIN warehouses
    on warehouses.id = spots.warehouseid
    WHERE warehouses.id = ?''';
  }

  static String get findOperation => '''SELECT 
  json_object(
    'id', operations.id, 
    'amount', operations.amount,
    'type', operations.type,
    'createdAt', operations.createdAt,
    'updatedAt', operations.updatedAt,
    'product', (
      SELECT
      json_object(
        'id', products.id, 
        'code', products.code,
        'description', products.description,
        'unit', products.unit,
        'type', products.type,
        'createdAt', products.createdAt,
        'updatedAt', products.updatedAt
      ) FROM products WHERE products.id = operations.productId
    ), 
    'position', (
      SELECT
      json_object(
        'id', positions.id, 
        'height', positions.height,
        'depth', positions.depth,
        'type', positions.type,
        'createdAt', positions.createdAt,
        'updatedAt', positions.updatedAt
      ) FROM positions WHERE positions.id = operations.positionId
    ),
    'address', (
      SELECT
      json_object(
        'id', addresses.id, 
        'name', addresses.name,
        'indicator', addresses.indicator,
        'createdAt', addresses.createdAt,
        'updatedAt', addresses.updatedAt
      ) FROM addresses 
      JOIN positions
      ON addresses.id = positions.addressid
      WHERE positions.id = operations.positionid
    ), 
    'spot', (
      SELECT
      json_object(
        'id', spots.id, 
        'name', spots.name,
        'createdAt', spots.createdAt,
        'updatedAt', spots.updatedAt
      ) FROM spots
      JOIN addresses
      ON spots.id = addresses.spotid
      JOIN positions
      ON addresses.id = positions.addressid 
      WHERE positions.id = operations.positionid
    ) 
  ) as json FROM operations
  JOIN positions
  ON positions.id = operations.positionid
  JOIN addresses
  ON addresses.id = positions.addressid
  JOIN spots
  on spots.id = addresses.spotid
  JOIN warehouses
  on warehouses.id = spots.warehouseid
  WHERE operations.id = ?''';

  static String get findAllProducts {
    return '''SELECT
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

  static String get insertIntoOperations {
    return '''INSERT 
  INTO operations 
  (amount, type, productid, positionId, createdAt, updatedAt) 
  VALUES (?, ?, ?, ?, $_now, $_now)''';
  }
}
