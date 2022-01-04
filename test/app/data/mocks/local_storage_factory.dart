class LocalStorageFactory {
  static Map<String, dynamic> makeWarehouseWithRegisterResult() => {
        "id": 1,
        "name": "ADP",
        "createdAt": "2021-11-12T17:43:33.548",
        "updatedAt": "2021-11-12T17:43:33.548",
        "register": {
          "id": 1,
          "createdAt": "2021-11-24T18:49:50.690",
          "updatedAt": "2021-11-24T18:49:50.690",
          "operations": [
            {
              "id": 1,
              "amount": 5.0,
              "type": "insert",
              "createdAt": "2021-11-12T17:43:33.548",
              "updatedAt": "2021-11-12T17:43:33.548",
              "product": {
                "id": 1,
                "code": 34129,
                "description": "RETENTOR;30X42X10MM;NITRILICA;02234 BRG",
                "unit": "UN",
                "type": "APL",
                "createdAt": "2021-11-23T18:32:20.268",
                "updatedAt": "2021-11-23T18:32:20.268"
              },
              "position": {
                "id": 1,
                "height": 1,
                "depth": 1,
                "type": "Embalagens",
                "createdAt": "2021-11-14T01:07:29.812",
                "updatedAt": "2021-11-14T01:07:29.812"
              },
              "address": {
                "id": 1,
                "name": "Rua A",
                "indicator": "1",
                "createdAt": "2021-11-14T01:07:29.812",
                "updatedAt": "2021-11-14T01:07:29.812"
              },
              "spot": {
                "id": 1,
                "name": "Câmara 1",
                "createdAt": "2021-12-07T18:58:05.326",
                "updatedAt": "2021-12-07T18:58:05.326"
              }
            }
          ]
        }
      };

  static List<Map<String, dynamic>> makeAllWarehouseOperationListResult() => [
        {
          "id": 1,
          "amount": 73.0,
          "type": "teste",
          "createdAt": "2022-01-03T20:05:04.586",
          "updatedAt": "2022-01-03T20:05:04.586",
          "product": {
            "id": 500,
            "code": 611047,
            "description":
                "BROCA HELIC;ACO RAP;5/64POL;50MM;HASTE CIL;ANSI B94 11M",
            "unit": "UN",
            "type": "APL",
            "createdAt": "2021-11-23T18:32:20.268",
            "updatedAt": "2021-11-23T18:32:20.268"
          },
          "position": {
            "id": 23,
            "height": 1,
            "depth": 3,
            "type": "Embalagens",
            "createdAt": "2021-11-14T01:07:29.812",
            "updatedAt": "2021-11-14T01:07:29.812"
          },
          "address": {
            "id": 3,
            "name": "Rua A",
            "indicator": "3",
            "createdAt": "2021-11-14T01:07:29.812",
            "updatedAt": "2021-11-14T01:07:29.812"
          },
          "spot": {
            "id": 5,
            "name": "Câmara 5",
            "createdAt": "2021-12-07T18:58:05.326",
            "updatedAt": "2021-12-07T18:58:05.326"
          }
        },
        {
          "id": 2,
          "amount": 25.0,
          "type": "teste2",
          "createdAt": "2022-01-03T20:05:04.586",
          "updatedAt": "2022-01-03T20:05:04.586",
          "product": {
            "id": 11,
            "code": 34621,
            "description":
                "IINVERSOR FREQ;TRIF;380/440V;5CV;WEG/CFW080100T3848PSZ",
            "unit": "UN",
            "type": "APL",
            "createdAt": "2021-11-23T18:32:20.268",
            "updatedAt": "2021-11-23T18:32:20.268"
          },
          "position": {
            "id": 44,
            "height": 2,
            "depth": 1,
            "type": "Embalagens",
            "createdAt": "2021-11-14T01:07:29.812",
            "updatedAt": "2021-11-14T01:07:29.812"
          },
          "address": {
            "id": 4,
            "name": "Rua A",
            "indicator": "4",
            "createdAt": "2021-11-14T01:07:29.812",
            "updatedAt": "2021-11-14T01:07:29.812"
          },
          "spot": {
            "id": 5,
            "name": "Câmara 5",
            "createdAt": "2021-12-07T18:58:05.326",
            "updatedAt": "2021-12-07T18:58:05.326"
          }
        }
      ];

  static List<Map<String, dynamic>> makeAllProductsListResult() => [
        {
          "id": 1,
          "code": 34129,
          "description": "RETENTOR;30X42X10MM;NITRILICA;02234 BRG",
          "unit": "UN",
          "type": "APL",
          "createdAt": "2021-11-23T18:32:20.268",
          "updatedAt": "2021-11-23T18:32:20.268"
        },
      ];
}
