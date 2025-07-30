extension SeparatedIterable<E> on Iterable<E> {
  Iterable<E> separated(E separator) sync* {
    final iterator = this.iterator;
    if (!iterator.moveNext()) return;

    yield iterator.current;
    while (iterator.moveNext()) {
      yield separator;
      yield iterator.current;
    }
  }
}

extension MapExt on Map<String, dynamic> {
  Map<String, dynamic> get safe {
    _parse(this);
    return this;
  }

  void _parse(Map json) {
    json.removeWhere((key, value) {
      if (value is Map) {
        _parse(value);
      }

      if (value is String) return value.isEmpty;
      if (value is num) return value == 0 || value == -1;

      return value == null;
    });
  }
}
