abstract class TableException implements Exception {}

class InvalidSearchParamsException implements TableException {}

class DataSourceException extends TableException {}

class EmptyListException extends TableException {}

class EmptyValueException extends TableException {}