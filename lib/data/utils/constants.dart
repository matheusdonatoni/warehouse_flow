final String kNowtoIso = DateTime.now().toIso8601String();

const String kWarehouseId = 'warehouseId';
const String kChamberId = 'chamberId';
const String kStreetId = 'streetId';
const String kRegisterId = 'registerId';

const String kWarehouseAliasQuery = 'w.id as w_id, w.name as w_name, w.createdat as w_createdAt, w.updatedat as w_updatedAt';
const String kChamberAliasQuery = 'c.id as c_id, c.name as c_name, c.warehouseId, c.createdat as c_createdAt, c.updatedat as c_updatedAt';
const String kStreetAliasQuery = 's.id as s_id, s.name as s_name, number, s.chamberId, s.createdat as s_createdAt, s.updatedat as s_updatedAt';
const String kPositionAliasQuery = 'p.id as p_id, height, depth, p.streetId, p.type as p_type, p.createdat as p_createdAt, p.updatedat as p_updatedAt';
const String kRegisterAliasQuery = 'r.id as r_id, r.warehouseId, r.createdat as r_createdAt, r.updatedat as r_updatedAt';
const String kOperationAliasQuery = 'o.id as o_id, amount, o.type as o_type, o.chamberId, o.streetId, positionId, registerId, productId, o.createdat as o_createdAt, o.updatedat as o_updatedAt';
const String kProductAliasQuery = 'pr.id as pr_id, code, description, unit, pr.type as pr_type, pr.createdat as pr_createdAt, pr.updatedat as pr_updatedAt';

const double kMinInteractiveDimension = 48.0;