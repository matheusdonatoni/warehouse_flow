final String kNowToIso = DateTime.now().toIso8601String();
final String kNowToPath = kNowToIso.replaceAll(RegExp(r'[^0-9]'), '_');

//Db
const String kWarehouseId = 'warehouseId';
const String kSpotId = 'spotId';
const String kAddressId = 'addressId';
const String kRegisterId = 'registerId';

const String kWarehouseAliasQuery =
    'w.id as w_id, w.name as w_name, w.createdat as w_createdAt, w.updatedat as w_updatedAt';
const String kSpotAliasQuery =
    's.id as s_id, s.name as s_name, s.warehouseId, s.createdat as s_createdAt, s.updatedat as s_updatedAt';
const String kAddressAliasQuery =
    'a.id as a_id, a.name as a_name, indicator, a.spotId, a.createdat as a_createdAt, a.updatedat as a_updatedAt';
const String kPositionAliasQuery =
    'p.id as p_id, height, depth, p.addressId, p.type as p_type, p.createdat as p_createdAt, p.updatedat as p_updatedAt';
const String kRegisterAliasQuery =
    'r.id as r_id, r.warehouseId, r.createdat as r_createdAt, r.updatedat as r_updatedAt';
const String kOperationAliasQuery =
    'o.id as o_id, amount, o.type as o_type, o.spotId, o.addressId, positionId, registerId, productId, o.createdat as o_createdAt, o.updatedat as o_updatedAt';
const String kProductAliasQuery =
    'pr.id as pr_id, code, description, unit, pr.type as pr_type, pr.createdat as pr_createdAt, pr.updatedat as pr_updatedAt';

//Paths
const String kDocumentsPath = '/storage/emulated/0/Documents';

//View
const double kMinInteractiveDimension = 48.0;
