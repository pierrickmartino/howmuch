// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Categorie extends DataClass implements Insertable<Categorie> {
  final int id;
  final String description;
  final String code;
  final String icon;
  final String color;
  final DateTime creationDate;
  final DateTime lastUpdateDate;
  final bool active;
  Categorie(
      {@required this.id,
      @required this.description,
      @required this.code,
      @required this.icon,
      @required this.color,
      this.creationDate,
      this.lastUpdateDate,
      @required this.active});
  factory Categorie.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Categorie(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      code: stringType.mapFromDatabaseResponse(data['${effectivePrefix}code']),
      icon: stringType.mapFromDatabaseResponse(data['${effectivePrefix}icon']),
      color:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}color']),
      creationDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}creation_date']),
      lastUpdateDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_update_date']),
      active:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}active']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<String>(code);
    }
    if (!nullToAbsent || icon != null) {
      map['icon'] = Variable<String>(icon);
    }
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<String>(color);
    }
    if (!nullToAbsent || creationDate != null) {
      map['creation_date'] = Variable<DateTime>(creationDate);
    }
    if (!nullToAbsent || lastUpdateDate != null) {
      map['last_update_date'] = Variable<DateTime>(lastUpdateDate);
    }
    if (!nullToAbsent || active != null) {
      map['active'] = Variable<bool>(active);
    }
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
      creationDate: creationDate == null && nullToAbsent
          ? const Value.absent()
          : Value(creationDate),
      lastUpdateDate: lastUpdateDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdateDate),
      active:
          active == null && nullToAbsent ? const Value.absent() : Value(active),
    );
  }

  factory Categorie.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Categorie(
      id: serializer.fromJson<int>(json['id']),
      description: serializer.fromJson<String>(json['description']),
      code: serializer.fromJson<String>(json['code']),
      icon: serializer.fromJson<String>(json['icon']),
      color: serializer.fromJson<String>(json['color']),
      creationDate: serializer.fromJson<DateTime>(json['creationDate']),
      lastUpdateDate: serializer.fromJson<DateTime>(json['lastUpdateDate']),
      active: serializer.fromJson<bool>(json['active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'description': serializer.toJson<String>(description),
      'code': serializer.toJson<String>(code),
      'icon': serializer.toJson<String>(icon),
      'color': serializer.toJson<String>(color),
      'creationDate': serializer.toJson<DateTime>(creationDate),
      'lastUpdateDate': serializer.toJson<DateTime>(lastUpdateDate),
      'active': serializer.toJson<bool>(active),
    };
  }

  Categorie copyWith(
          {int id,
          String description,
          String code,
          String icon,
          String color,
          DateTime creationDate,
          DateTime lastUpdateDate,
          bool active}) =>
      Categorie(
        id: id ?? this.id,
        description: description ?? this.description,
        code: code ?? this.code,
        icon: icon ?? this.icon,
        color: color ?? this.color,
        creationDate: creationDate ?? this.creationDate,
        lastUpdateDate: lastUpdateDate ?? this.lastUpdateDate,
        active: active ?? this.active,
      );
  @override
  String toString() {
    return (StringBuffer('Categorie(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('code: $code, ')
          ..write('icon: $icon, ')
          ..write('color: $color, ')
          ..write('creationDate: $creationDate, ')
          ..write('lastUpdateDate: $lastUpdateDate, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          description.hashCode,
          $mrjc(
              code.hashCode,
              $mrjc(
                  icon.hashCode,
                  $mrjc(
                      color.hashCode,
                      $mrjc(
                          creationDate.hashCode,
                          $mrjc(
                              lastUpdateDate.hashCode, active.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Categorie &&
          other.id == this.id &&
          other.description == this.description &&
          other.code == this.code &&
          other.icon == this.icon &&
          other.color == this.color &&
          other.creationDate == this.creationDate &&
          other.lastUpdateDate == this.lastUpdateDate &&
          other.active == this.active);
}

class CategoriesCompanion extends UpdateCompanion<Categorie> {
  final Value<int> id;
  final Value<String> description;
  final Value<String> code;
  final Value<String> icon;
  final Value<String> color;
  final Value<DateTime> creationDate;
  final Value<DateTime> lastUpdateDate;
  final Value<bool> active;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.code = const Value.absent(),
    this.icon = const Value.absent(),
    this.color = const Value.absent(),
    this.creationDate = const Value.absent(),
    this.lastUpdateDate = const Value.absent(),
    this.active = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    @required String description,
    @required String code,
    @required String icon,
    @required String color,
    this.creationDate = const Value.absent(),
    this.lastUpdateDate = const Value.absent(),
    this.active = const Value.absent(),
  })  : description = Value(description),
        code = Value(code),
        icon = Value(icon),
        color = Value(color);
  static Insertable<Categorie> custom({
    Expression<int> id,
    Expression<String> description,
    Expression<String> code,
    Expression<String> icon,
    Expression<String> color,
    Expression<DateTime> creationDate,
    Expression<DateTime> lastUpdateDate,
    Expression<bool> active,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (code != null) 'code': code,
      if (icon != null) 'icon': icon,
      if (color != null) 'color': color,
      if (creationDate != null) 'creation_date': creationDate,
      if (lastUpdateDate != null) 'last_update_date': lastUpdateDate,
      if (active != null) 'active': active,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int> id,
      Value<String> description,
      Value<String> code,
      Value<String> icon,
      Value<String> color,
      Value<DateTime> creationDate,
      Value<DateTime> lastUpdateDate,
      Value<bool> active}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      code: code ?? this.code,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      creationDate: creationDate ?? this.creationDate,
      lastUpdateDate: lastUpdateDate ?? this.lastUpdateDate,
      active: active ?? this.active,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (creationDate.present) {
      map['creation_date'] = Variable<DateTime>(creationDate.value);
    }
    if (lastUpdateDate.present) {
      map['last_update_date'] = Variable<DateTime>(lastUpdateDate.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('code: $code, ')
          ..write('icon: $icon, ')
          ..write('color: $color, ')
          ..write('creationDate: $creationDate, ')
          ..write('lastUpdateDate: $lastUpdateDate, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Categorie> {
  final GeneratedDatabase _db;
  final String _alias;
  $CategoriesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      false,
    );
  }

  final VerificationMeta _codeMeta = const VerificationMeta('code');
  GeneratedTextColumn _code;
  @override
  GeneratedTextColumn get code => _code ??= _constructCode();
  GeneratedTextColumn _constructCode() {
    return GeneratedTextColumn(
      'code',
      $tableName,
      false,
    );
  }

  final VerificationMeta _iconMeta = const VerificationMeta('icon');
  GeneratedTextColumn _icon;
  @override
  GeneratedTextColumn get icon => _icon ??= _constructIcon();
  GeneratedTextColumn _constructIcon() {
    return GeneratedTextColumn(
      'icon',
      $tableName,
      false,
    );
  }

  final VerificationMeta _colorMeta = const VerificationMeta('color');
  GeneratedTextColumn _color;
  @override
  GeneratedTextColumn get color => _color ??= _constructColor();
  GeneratedTextColumn _constructColor() {
    return GeneratedTextColumn(
      'color',
      $tableName,
      false,
    );
  }

  final VerificationMeta _creationDateMeta =
      const VerificationMeta('creationDate');
  GeneratedDateTimeColumn _creationDate;
  @override
  GeneratedDateTimeColumn get creationDate =>
      _creationDate ??= _constructCreationDate();
  GeneratedDateTimeColumn _constructCreationDate() {
    return GeneratedDateTimeColumn(
      'creation_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _lastUpdateDateMeta =
      const VerificationMeta('lastUpdateDate');
  GeneratedDateTimeColumn _lastUpdateDate;
  @override
  GeneratedDateTimeColumn get lastUpdateDate =>
      _lastUpdateDate ??= _constructLastUpdateDate();
  GeneratedDateTimeColumn _constructLastUpdateDate() {
    return GeneratedDateTimeColumn(
      'last_update_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _activeMeta = const VerificationMeta('active');
  GeneratedBoolColumn _active;
  @override
  GeneratedBoolColumn get active => _active ??= _constructActive();
  GeneratedBoolColumn _constructActive() {
    return GeneratedBoolColumn('active', $tableName, false,
        defaultValue: Constant(true));
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        description,
        code,
        icon,
        color,
        creationDate,
        lastUpdateDate,
        active
      ];
  @override
  $CategoriesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'categories';
  @override
  final String actualTableName = 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Categorie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code'], _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon'], _iconMeta));
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color'], _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('creation_date')) {
      context.handle(
          _creationDateMeta,
          creationDate.isAcceptableOrUnknown(
              data['creation_date'], _creationDateMeta));
    }
    if (data.containsKey('last_update_date')) {
      context.handle(
          _lastUpdateDateMeta,
          lastUpdateDate.isAcceptableOrUnknown(
              data['last_update_date'], _lastUpdateDateMeta));
    }
    if (data.containsKey('active')) {
      context.handle(_activeMeta,
          active.isAcceptableOrUnknown(data['active'], _activeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Categorie map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Categorie.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $CategoriesTable _categories;
  $CategoriesTable get categories => _categories ??= $CategoriesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [categories];
}
