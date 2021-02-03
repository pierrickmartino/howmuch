import 'package:moor/moor.dart';
import 'package:undo/undo.dart';

extension TableUtils on GeneratedDatabase {
  Future<void> deleteRow(
    ChangeStack cs,
    Table table,
    Insertable val,
  ) async {
    final _change = Change(
      val,
      () async => delete(table).delete(val),
      (old) async => into(table).insert(old),
    );
    cs.add(_change);
  }

  Future<void> insertRow(
    ChangeStack cs,
    Table table,
    Insertable val,
  ) async {
    final _change = Change(
      val,
      () async => into(table).insert(val),
      (val) async => delete(table).delete(val),
    );
    cs.add(_change);
  }

  Future<void> updateRow(
    ChangeStack cs,
    Table table,
    Insertable val,
  ) async {
    final oldVal = await (select(table)..whereSamePrimaryKey(val)).getSingle();
    final _change = Change(
      oldVal,
      () async => update(table).replace(val),
      (old) async => update(table).replace(old),
    );
    cs.add(_change);
  }
}

Value<T> addField<T>(T val, {T fallback}) {
  Value<T> _fallback;
  if (fallback != null) {
    _fallback = Value<T>(fallback);
  }
  if (val == null) {
    return _fallback ?? const Value.absent();
  }
  if (val is String && (val == 'null' || val == 'Null')) {
    return _fallback ?? const Value.absent();
  }
  return Value(val);
}
