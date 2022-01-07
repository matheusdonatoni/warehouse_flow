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

  static List<Map<String, dynamic>> makeWarehouseOperationListResult() => [
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

  static List<Map<String, dynamic>>
      makeWarehouseOperationListWithoutIdResult() => [
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

  static Map<String, dynamic> makeSpotResult() => {
        "id": 1,
        "name": "Câmara 1",
        "createdAt": "2021-12-07T18:58:05.326",
        "updatedAt": "2021-12-07T18:58:05.326"
      };

  static Map<String, dynamic> makeAddressResult() => {
        "id": 1,
        "name": "Rua A",
        "indicator": "1",
        "createdAt": "2021-11-14T01:07:29.812",
        "updatedAt": "2021-11-14T01:07:29.812"
      };

  static Map<String, dynamic> makePositionResult() => {
        "id": 1,
        "height": 1,
        "depth": 1,
        "type": "Embalagens",
        "createdAt": "2021-11-14T01:07:29.812",
        "updatedAt": "2021-11-14T01:07:29.812"
      };

  static Map<String, dynamic> makeProductResult() => {
        "id": 8,
        "code": 34435,
        "description": "PASTA SANFONADA;C/ELASTICO;PP;TRANSP;12 DIV;390X255MM",
        "unit": "UN",
        "type": "APL",
        "createdAt": "2021-11-23T18:32:20.268",
        "updatedAt": "2021-11-23T18:32:20.268"
      };

  static List<String> makeSpotNameListResult() => [
        "Câmara 1",
        "Câmara 2",
        "Câmara 3",
        "Câmara 4",
        "Câmara 5",
        "Prateleira 1",
        "Prateleira 2",
        "Prateleira 3",
        "Prateleira 4",
        "Prateleira 5"
      ];

  static List<String> makeAddressNameListResult() => [
        "Rua A",
        "Rua B",
        "Rua C",
        "Rua D",
        "E",
        "N",
        "H",
        "P1",
        "D",
        "I",
        "G",
        "CM",
        "O",
        "CG",
        "S",
        "L",
        "Q",
        "F",
        "A",
        "C",
        "P",
        "B",
        "M",
        "R",
        "J",
        "CAM5",
        "CAM4",
        "CAM3",
        "P2"
      ];

  static List<String> makeAddressIndicatorListResult() => [
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
        "10",
        "11",
        "12",
        "13",
        "14",
        "15",
        "16",
        "17",
        "18",
        "19",
        "20",
        "21",
        "22",
        "23",
        "24",
        "25",
        "26",
        "27"
      ];

  static List<String> makePositionHeightListResult() => [
        "1",
        "2",
        "3",
        "4",
        "5",
      ];

  static List<String> makePositionDepthListResult() => [
        "1",
        "2",
        "3",
        "4",
      ];
}
