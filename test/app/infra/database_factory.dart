class DatabaseFactory {
  static List<Map<String, dynamic>> makeWarehouseWithRegisterResultJson() => [
        {
          'json':
              '{"id":1,"name":"ADP","createdAt":"2021-11-12T17:43:33.548","updatedAt":"2021-11-12T17:43:33.548","register":{"id":1,"createdAt":"2021-11-24T18:49:50.690","updatedAt":"2021-11-24T18:49:50.690","operations":[{"id":1,"amount":5.0,"type":"insert","createdAt":"2021-11-12T17:43:33.548","updatedAt":"2021-11-12T17:43:33.548","product":{"id":1,"code":34129,"description":"RETENTOR;30X42X10MM;NITRILICA;02234 BRG","unit":"UN","type":"APL","createdAt":"2021-11-23T18:32:20.268","updatedAt":"2021-11-23T18:32:20.268"},"position":{"id":1,"height":1,"depth":1,"type":"Embalagens","createdAt":"2021-11-14T01:07:29.812","updatedAt":"2021-11-14T01:07:29.812"},"address":{"id":1,"name":"Rua A","indicator":"1","createdAt":"2021-11-14T01:07:29.812","updatedAt":"2021-11-14T01:07:29.812"},"spot":{"id":1,"name":"Câmara 1","createdAt":"2021-12-07T18:58:05.326","updatedAt":"2021-12-07T18:58:05.326"}}]}}'
        }
      ];

  static List<Map<String, dynamic>> makeAllProductsListResultJson() => [
        {
          'json':
              '[{"id":1,"code":34129,"description":"RETENTOR;30X42X10MM;NITRILICA;02234 BRG","unit":"UN","type":"APL","createdAt":"2021-11-23T18:32:20.268","updatedAt":"2021-11-23T18:32:20.268"}]'
        }
      ];
}
