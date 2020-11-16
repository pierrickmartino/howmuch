// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String description;
  final String code;
  final int tag;
  final int icon;
  final String icon_family;
  final String icon_package;
  final int color;
  final DateTime creationDate;
  final DateTime lastUpdateDate;
  final bool active;
  Category(
      {@required this.id,
      @required this.description,
      @required this.code,
      this.tag,
      this.icon,
      this.icon_family,
      this.icon_package,
      this.color,
      this.creationDate,
      this.lastUpdateDate,
      @required this.active});
  factory Category.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Category(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      code: stringType.mapFromDatabaseResponse(data['${effectivePrefix}code']),
      tag: intType.mapFromDatabaseResponse(data['${effectivePrefix}tag']),
      icon: intType.mapFromDatabaseResponse(data['${effectivePrefix}icon']),
      icon_family: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}icon_family']),
      icon_package: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}icon_package']),
      color: intType.mapFromDatabaseResponse(data['${effectivePrefix}color']),
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
    if (!nullToAbsent || tag != null) {
      map['tag'] = Variable<int>(tag);
    }
    if (!nullToAbsent || icon != null) {
      map['icon'] = Variable<int>(icon);
    }
    if (!nullToAbsent || icon_family != null) {
      map['icon_family'] = Variable<String>(icon_family);
    }
    if (!nullToAbsent || icon_package != null) {
      map['icon_package'] = Variable<String>(icon_package);
    }
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<int>(color);
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
      tag: tag == null && nullToAbsent ? const Value.absent() : Value(tag),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
      icon_family: icon_family == null && nullToAbsent
          ? const Value.absent()
          : Value(icon_family),
      icon_package: icon_package == null && nullToAbsent
          ? const Value.absent()
          : Value(icon_package),
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

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      description: serializer.fromJson<String>(json['description']),
      code: serializer.fromJson<String>(json['code']),
      tag: serializer.fromJson<int>(json['tag']),
      icon: serializer.fromJson<int>(json['icon']),
      icon_family: serializer.fromJson<String>(json['icon_family']),
      icon_package: serializer.fromJson<String>(json['icon_package']),
      color: serializer.fromJson<int>(json['color']),
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
      'tag': serializer.toJson<int>(tag),
      'icon': serializer.toJson<int>(icon),
      'icon_family': serializer.toJson<String>(icon_family),
      'icon_package': serializer.toJson<String>(icon_package),
      'color': serializer.toJson<int>(color),
      'creationDate': serializer.toJson<DateTime>(creationDate),
      'lastUpdateDate': serializer.toJson<DateTime>(lastUpdateDate),
      'active': serializer.toJson<bool>(active),
    };
  }

  Category copyWith(
          {int id,
          String description,
          String code,
          int tag,
          int icon,
          String icon_family,
          String icon_package,
          int color,
          DateTime creationDate,
          DateTime lastUpdateDate,
          bool active}) =>
      Category(
        id: id ?? this.id,
        description: description ?? this.description,
        code: code ?? this.code,
        tag: tag ?? this.tag,
        icon: icon ?? this.icon,
        icon_family: icon_family ?? this.icon_family,
        icon_package: icon_package ?? this.icon_package,
        color: color ?? this.color,
        creationDate: creationDate ?? this.creationDate,
        lastUpdateDate: lastUpdateDate ?? this.lastUpdateDate,
        active: active ?? this.active,
      );
  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('code: $code, ')
          ..write('tag: $tag, ')
          ..write('icon: $icon, ')
          ..write('icon_family: $icon_family, ')
          ..write('icon_package: $icon_package, ')
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
                  tag.hashCode,
                  $mrjc(
                      icon.hashCode,
                      $mrjc(
                          icon_family.hashCode,
                          $mrjc(
                              icon_package.hashCode,
                              $mrjc(
                                  color.hashCode,
                                  $mrjc(
                                      creationDate.hashCode,
                                      $mrjc(lastUpdateDate.hashCode,
                                          active.hashCode)))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.description == this.description &&
          other.code == this.code &&
          other.tag == this.tag &&
          other.icon == this.icon &&
          other.icon_family == this.icon_family &&
          other.icon_package == this.icon_package &&
          other.color == this.color &&
          other.creationDate == this.creationDate &&
          other.lastUpdateDate == this.lastUpdateDate &&
          other.active == this.active);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> description;
  final Value<String> code;
  final Value<int> tag;
  final Value<int> icon;
  final Value<String> icon_family;
  final Value<String> icon_package;
  final Value<int> color;
  final Value<DateTime> creationDate;
  final Value<DateTime> lastUpdateDate;
  final Value<bool> active;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.code = const Value.absent(),
    this.tag = const Value.absent(),
    this.icon = const Value.absent(),
    this.icon_family = const Value.absent(),
    this.icon_package = const Value.absent(),
    this.color = const Value.absent(),
    this.creationDate = const Value.absent(),
    this.lastUpdateDate = const Value.absent(),
    this.active = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    @required String description,
    @required String code,
    this.tag = const Value.absent(),
    this.icon = const Value.absent(),
    this.icon_family = const Value.absent(),
    this.icon_package = const Value.absent(),
    this.color = const Value.absent(),
    this.creationDate = const Value.absent(),
    this.lastUpdateDate = const Value.absent(),
    this.active = const Value.absent(),
  })  : description = Value(description),
        code = Value(code);
  static Insertable<Category> custom({
    Expression<int> id,
    Expression<String> description,
    Expression<String> code,
    Expression<int> tag,
    Expression<int> icon,
    Expression<String> icon_family,
    Expression<String> icon_package,
    Expression<int> color,
    Expression<DateTime> creationDate,
    Expression<DateTime> lastUpdateDate,
    Expression<bool> active,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (code != null) 'code': code,
      if (tag != null) 'tag': tag,
      if (icon != null) 'icon': icon,
      if (icon_family != null) 'icon_family': icon_family,
      if (icon_package != null) 'icon_package': icon_package,
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
      Value<int> tag,
      Value<int> icon,
      Value<String> icon_family,
      Value<String> icon_package,
      Value<int> color,
      Value<DateTime> creationDate,
      Value<DateTime> lastUpdateDate,
      Value<bool> active}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      code: code ?? this.code,
      tag: tag ?? this.tag,
      icon: icon ?? this.icon,
      icon_family: icon_family ?? this.icon_family,
      icon_package: icon_package ?? this.icon_package,
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
    if (tag.present) {
      map['tag'] = Variable<int>(tag.value);
    }
    if (icon.present) {
      map['icon'] = Variable<int>(icon.value);
    }
    if (icon_family.present) {
      map['icon_family'] = Variable<String>(icon_family.value);
    }
    if (icon_package.present) {
      map['icon_package'] = Variable<String>(icon_package.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
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
          ..write('tag: $tag, ')
          ..write('icon: $icon, ')
          ..write('icon_family: $icon_family, ')
          ..write('icon_package: $icon_package, ')
          ..write('color: $color, ')
          ..write('creationDate: $creationDate, ')
          ..write('lastUpdateDate: $lastUpdateDate, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
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

  final VerificationMeta _tagMeta = const VerificationMeta('tag');
  GeneratedIntColumn _tag;
  @override
  GeneratedIntColumn get tag => _tag ??= _constructTag();
  GeneratedIntColumn _constructTag() {
    return GeneratedIntColumn('tag', $tableName, true,
        $customConstraints: 'NULL REFERENCES tags(id)');
  }

  final VerificationMeta _iconMeta = const VerificationMeta('icon');
  GeneratedIntColumn _icon;
  @override
  GeneratedIntColumn get icon => _icon ??= _constructIcon();
  GeneratedIntColumn _constructIcon() {
    return GeneratedIntColumn(
      'icon',
      $tableName,
      true,
    );
  }

  final VerificationMeta _icon_familyMeta =
      const VerificationMeta('icon_family');
  GeneratedTextColumn _icon_family;
  @override
  GeneratedTextColumn get icon_family =>
      _icon_family ??= _constructIconFamily();
  GeneratedTextColumn _constructIconFamily() {
    return GeneratedTextColumn(
      'icon_family',
      $tableName,
      true,
    );
  }

  final VerificationMeta _icon_packageMeta =
      const VerificationMeta('icon_package');
  GeneratedTextColumn _icon_package;
  @override
  GeneratedTextColumn get icon_package =>
      _icon_package ??= _constructIconPackage();
  GeneratedTextColumn _constructIconPackage() {
    return GeneratedTextColumn(
      'icon_package',
      $tableName,
      true,
    );
  }

  final VerificationMeta _colorMeta = const VerificationMeta('color');
  GeneratedIntColumn _color;
  @override
  GeneratedIntColumn get color => _color ??= _constructColor();
  GeneratedIntColumn _constructColor() {
    return GeneratedIntColumn(
      'color',
      $tableName,
      true,
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
        tag,
        icon,
        icon_family,
        icon_package,
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
  VerificationContext validateIntegrity(Insertable<Category> instance,
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
    if (data.containsKey('tag')) {
      context.handle(
          _tagMeta, tag.isAcceptableOrUnknown(data['tag'], _tagMeta));
    }
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon'], _iconMeta));
    }
    if (data.containsKey('icon_family')) {
      context.handle(
          _icon_familyMeta,
          icon_family.isAcceptableOrUnknown(
              data['icon_family'], _icon_familyMeta));
    }
    if (data.containsKey('icon_package')) {
      context.handle(
          _icon_packageMeta,
          icon_package.isAcceptableOrUnknown(
              data['icon_package'], _icon_packageMeta));
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color'], _colorMeta));
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
  Category map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Category.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(_db, alias);
  }
}

class Tag extends DataClass implements Insertable<Tag> {
  final int id;
  final String name;
  final int color;
  Tag({@required this.id, @required this.name, this.color});
  factory Tag.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Tag(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      color: intType.mapFromDatabaseResponse(data['${effectivePrefix}color']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<int>(color);
    }
    return map;
  }

  TagsCompanion toCompanion(bool nullToAbsent) {
    return TagsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
    );
  }

  factory Tag.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Tag(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<int>(json['color']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<int>(color),
    };
  }

  Tag copyWith({int id, String name, int color}) => Tag(
        id: id ?? this.id,
        name: name ?? this.name,
        color: color ?? this.color,
      );
  @override
  String toString() {
    return (StringBuffer('Tag(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(name.hashCode, color.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Tag &&
          other.id == this.id &&
          other.name == this.name &&
          other.color == this.color);
}

class TagsCompanion extends UpdateCompanion<Tag> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> color;
  const TagsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
  });
  TagsCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    this.color = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Tag> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<int> color,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
    });
  }

  TagsCompanion copyWith(
      {Value<int> id, Value<String> name, Value<int> color}) {
    return TagsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }
}

class $TagsTable extends Tags with TableInfo<$TagsTable, Tag> {
  final GeneratedDatabase _db;
  final String _alias;
  $TagsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 20);
  }

  final VerificationMeta _colorMeta = const VerificationMeta('color');
  GeneratedIntColumn _color;
  @override
  GeneratedIntColumn get color => _color ??= _constructColor();
  GeneratedIntColumn _constructColor() {
    return GeneratedIntColumn(
      'color',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, color];
  @override
  $TagsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'tags';
  @override
  final String actualTableName = 'tags';
  @override
  VerificationContext validateIntegrity(Insertable<Tag> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color'], _colorMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tag map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Tag.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TagsTable createAlias(String alias) {
    return $TagsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $CategoriesTable _categories;
  $CategoriesTable get categories => _categories ??= $CategoriesTable(this);
  $TagsTable _tags;
  $TagsTable get tags => _tags ??= $TagsTable(this);
  Future<int> _resetTag(int var1) {
    return customUpdate(
      'UPDATE Categories SET tag = NULL WHERE tag = ?',
      variables: [Variable.withInt(var1)],
      updates: {categories},
      updateKind: UpdateKind.update,
    );
  }

  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [categories, tags];
}
