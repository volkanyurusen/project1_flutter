enum Status { initial, loading, success, failure }

enum StatusWithoutLoading { initial, success, failure }

enum StatusWithoutFailure { initial, change }

enum FieldError { empty, invalid, short, long }
