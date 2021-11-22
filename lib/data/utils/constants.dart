final String kNowtoIso = DateTime.now().toIso8601String();

final String kWarehouseId = 'warehouseId';
final String kChamberId = 'chamberId';
final String kStreetId = 'streetId';
final String kRegisterId = 'registerId';

final String kWarehouseAliasQuery = 'w.id as w_id, w.name as w_name, w.createdat as w_createdAt, w.updatedat as w_updatedAt';
final String kChamberAliasQuery = 'c.id as c_id, c.name as c_name, warehouseId, c.createdat as c_createdAt, c.updatedat as c_updatedAt';
final String kStreetAliasQuery = 's.id as s_id, s.name as s_name, number, chamberId, s.createdat as s_createdAt, s.updatedat as s_updatedAt';
final String kPositionAliasQuery = 'p.id as p_id, height, depth, streetId, p.type as p_type, p.createdat as p_createdAt, p.updatedat as p_updatedAt';
final String kRegisterAliasQuery = 'r.id as r_id, positionId, r.createdat as r_createdAt, r.updatedat as r_updatedAt';
final String kOperationAliasQuery = 'o.id as o_id, amount, o.type as o_type, registerId, productId, o.createdat as o_createdAt, o.updatedat as o_updatedAt';
final String kProductAliasQuery = 'pr.id as pr_id, code, description, unit, pr.type as pr_type, pr.createdat as pr_createdAt, pr.updatedat as pr_updatedAt';