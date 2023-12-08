int intOrStringValue(dynamic o) => (o is String ? int.tryParse(o) : o) ?? 0;
