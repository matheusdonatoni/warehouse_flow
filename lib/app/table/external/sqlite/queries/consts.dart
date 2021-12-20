const kWarehouseAlais = '''warehouses.id as warehouse_id, 
warehouses.name as warehouse_name, 
warehouses.createdat as warehouse_createdAt, 
warehouses.updatedat as warehouse_updatedAt''';

const kSpotAlais = '''spots.id as spot_id, 
spots.name as spot_name, 
spots.createdat as spot_createdAt, 
spots.updatedat as spot_updatedAt''';

const kAddressAlias = '''addresses.id as address_id, 
addresses.name as address_name, 
addresses.indicator as address_indicator, 
addresses.createdat as address_createdAt, 
addresses.updatedat as address_updatedAt''';

const kPositionAlias = '''positions.id as position_id, 
positions.height as position_height, 
positions.depth as position_depth, positions.addressId, 
positions.type as position_type, 
positions.createdat as position_createdAt, 
positions.updatedat as position_updatedAt''';

const kRegisterAlias = '''registers.id as register_id, 
registers.warehouseId, 
registers.createdat as register_createdAt, 
registers.updatedat as register_updatedAt''';

const kOperationAlias = '''operations.id as operation_id, 
operations.amount as operation_amount, 
operations.type as operation_type, 
operations.spotId, 
operations.addressId, 
operations.positionId, 
operations.registerId, 
operations.productId, 
operations.createdat as operation_createdAt, 
operations.updatedAt as operation_updatedAt''';

const kProductAlias = '''products.id as product_id, 
products.code as product_code, 
products.description as product_description, 
products.unit as product_unit, 
products.type as product_type, 
products.createdat as product_createdAt, 
products.updatedat as product_updatedAt''';
