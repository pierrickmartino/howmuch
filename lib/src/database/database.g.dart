// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Transaction extends DataClass implements Insertable<Transaction> {
  final int id;
  final String description;
  final DateTime valueDate;
  final int category;
  Transaction(
      {@required this.id,
      @required this.description,
      this.valueDate,
      this.category});
  factory Transaction.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Transaction(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      valueDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}value_date']),
      category:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}category']),
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
    if (!nullToAbsent || valueDate != null) {
      map['value_date'] = Variable<DateTime>(valueDate);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<int>(category);
    }
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      valueDate: valueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(valueDate),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
    );
  }

  factory Transaction.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Transaction(
      id: serializer.fromJson<int>(json['id']),
      description: serializer.fromJson<String>(json['description']),
      valueDate: serializer.fromJson<DateTime>(json['valueDate']),
      category: serializer.fromJson<int>(json['category']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'description': serializer.toJson<String>(description),
      'valueDate': serializer.toJson<DateTime>(valueDate),
      'category': serializer.toJson<int>(category),
    };
  }

  Transaction copyWith(
          {int id, String description, DateTime valueDate, int category}) =>
      Transaction(
        id: id ?? this.id,
        description: description ?? this.description,
        valueDate: valueDate ?? this.valueDate,
        category: category ?? this.category,
      );
  @override
  String toString() {
    return (StringBuffer('Transaction(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('valueDate: $valueDate, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          description.hashCode, $mrjc(valueDate.hashCode, category.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Transaction &&
          other.id == this.id &&
          other.description == this.description &&
          other.valueDate == this.valueDate &&
          other.category == this.category);
}

class TransactionsCompanion extends UpdateCompanion<Transaction> {
  final Value<int> id;
  final Value<String> description;
  final Value<DateTime> valueDate;
  final Value<int> category;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.valueDate = const Value.absent(),
    this.category = const Value.absent(),
  });
  TransactionsCompanion.insert({
    this.id = const Value.absent(),
    @required String description,
    this.valueDate = const Value.absent(),
    this.category = const Value.absent(),
  }) : description = Value(description);
  static Insertable<Transaction> custom({
    Expression<int> id,
    Expression<String> description,
    Expression<DateTime> valueDate,
    Expression<int> category,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (valueDate != null) 'value_date': valueDate,
      if (category != null) 'category': category,
    });
  }

  TransactionsCompanion copyWith(
      {Value<int> id,
      Value<String> description,
      Value<DateTime> valueDate,
      Value<int> category}) {
    return TransactionsCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      valueDate: valueDate ?? this.valueDate,
      category: category ?? this.category,
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
    if (valueDate.present) {
      map['value_date'] = Variable<DateTime>(valueDate.value);
    }
    if (category.present) {
      map['category'] = Variable<int>(category.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('valueDate: $valueDate, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, Transaction> {
  final GeneratedDatabase _db;
  final String _alias;
  $TransactionsTable(this._db, [this._alias]);
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

  final VerificationMeta _valueDateMeta = const VerificationMeta('valueDate');
  GeneratedDateTimeColumn _valueDate;
  @override
  GeneratedDateTimeColumn get valueDate => _valueDate ??= _constructValueDate();
  GeneratedDateTimeColumn _constructValueDate() {
    return GeneratedDateTimeColumn(
      'value_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  GeneratedIntColumn _category;
  @override
  GeneratedIntColumn get category => _category ??= _constructCategory();
  GeneratedIntColumn _constructCategory() {
    return GeneratedIntColumn('category', $tableName, true,
        $customConstraints: 'NULL REFERENCES categories(id)');
  }

  @override
  List<GeneratedColumn> get $columns => [id, description, valueDate, category];
  @override
  $TransactionsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'transactions';
  @override
  final String actualTableName = 'transactions';
  @override
  VerificationContext validateIntegrity(Insertable<Transaction> instance,
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
    if (data.containsKey('value_date')) {
      context.handle(_valueDateMeta,
          valueDate.isAcceptableOrUnknown(data['value_date'], _valueDateMeta));
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category'], _categoryMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Transaction map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Transaction.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(_db, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String description;
  final String code;
  final int icon;
  final String iconFamily;
  final String iconPackage;
  final int color;
  final int performance;
  final DateTime creationDate;
  final DateTime lastUpdateDate;
  final bool active;
  Category(
      {@required this.id,
      @required this.description,
      @required this.code,
      this.icon,
      this.iconFamily,
      this.iconPackage,
      this.color,
      this.performance,
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
      icon: intType.mapFromDatabaseResponse(data['${effectivePrefix}icon']),
      iconFamily: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}icon_family']),
      iconPackage: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}icon_package']),
      color: intType.mapFromDatabaseResponse(data['${effectivePrefix}color']),
      performance: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}performance']),
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
      map['icon'] = Variable<int>(icon);
    }
    if (!nullToAbsent || iconFamily != null) {
      map['icon_family'] = Variable<String>(iconFamily);
    }
    if (!nullToAbsent || iconPackage != null) {
      map['icon_package'] = Variable<String>(iconPackage);
    }
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<int>(color);
    }
    if (!nullToAbsent || performance != null) {
      map['performance'] = Variable<int>(performance);
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
      iconFamily: iconFamily == null && nullToAbsent
          ? const Value.absent()
          : Value(iconFamily),
      iconPackage: iconPackage == null && nullToAbsent
          ? const Value.absent()
          : Value(iconPackage),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
      performance: performance == null && nullToAbsent
          ? const Value.absent()
          : Value(performance),
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
      icon: serializer.fromJson<int>(json['icon']),
      iconFamily: serializer.fromJson<String>(json['iconFamily']),
      iconPackage: serializer.fromJson<String>(json['iconPackage']),
      color: serializer.fromJson<int>(json['color']),
      performance: serializer.fromJson<int>(json['performance']),
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
      'icon': serializer.toJson<int>(icon),
      'iconFamily': serializer.toJson<String>(iconFamily),
      'iconPackage': serializer.toJson<String>(iconPackage),
      'color': serializer.toJson<int>(color),
      'performance': serializer.toJson<int>(performance),
      'creationDate': serializer.toJson<DateTime>(creationDate),
      'lastUpdateDate': serializer.toJson<DateTime>(lastUpdateDate),
      'active': serializer.toJson<bool>(active),
    };
  }

  Category copyWith(
          {int id,
          String description,
          String code,
          int icon,
          String iconFamily,
          String iconPackage,
          int color,
          int performance,
          DateTime creationDate,
          DateTime lastUpdateDate,
          bool active}) =>
      Category(
        id: id ?? this.id,
        description: description ?? this.description,
        code: code ?? this.code,
        icon: icon ?? this.icon,
        iconFamily: iconFamily ?? this.iconFamily,
        iconPackage: iconPackage ?? this.iconPackage,
        color: color ?? this.color,
        performance: performance ?? this.performance,
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
          ..write('icon: $icon, ')
          ..write('iconFamily: $iconFamily, ')
          ..write('iconPackage: $iconPackage, ')
          ..write('color: $color, ')
          ..write('performance: $performance, ')
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
                      iconFamily.hashCode,
                      $mrjc(
                          iconPackage.hashCode,
                          $mrjc(
                              color.hashCode,
                              $mrjc(
                                  performance.hashCode,
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
          other.icon == this.icon &&
          other.iconFamily == this.iconFamily &&
          other.iconPackage == this.iconPackage &&
          other.color == this.color &&
          other.performance == this.performance &&
          other.creationDate == this.creationDate &&
          other.lastUpdateDate == this.lastUpdateDate &&
          other.active == this.active);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> description;
  final Value<String> code;
  final Value<int> icon;
  final Value<String> iconFamily;
  final Value<String> iconPackage;
  final Value<int> color;
  final Value<int> performance;
  final Value<DateTime> creationDate;
  final Value<DateTime> lastUpdateDate;
  final Value<bool> active;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.code = const Value.absent(),
    this.icon = const Value.absent(),
    this.iconFamily = const Value.absent(),
    this.iconPackage = const Value.absent(),
    this.color = const Value.absent(),
    this.performance = const Value.absent(),
    this.creationDate = const Value.absent(),
    this.lastUpdateDate = const Value.absent(),
    this.active = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    @required String description,
    @required String code,
    this.icon = const Value.absent(),
    this.iconFamily = const Value.absent(),
    this.iconPackage = const Value.absent(),
    this.color = const Value.absent(),
    this.performance = const Value.absent(),
    this.creationDate = const Value.absent(),
    this.lastUpdateDate = const Value.absent(),
    this.active = const Value.absent(),
  })  : description = Value(description),
        code = Value(code);
  static Insertable<Category> custom({
    Expression<int> id,
    Expression<String> description,
    Expression<String> code,
    Expression<int> icon,
    Expression<String> iconFamily,
    Expression<String> iconPackage,
    Expression<int> color,
    Expression<int> performance,
    Expression<DateTime> creationDate,
    Expression<DateTime> lastUpdateDate,
    Expression<bool> active,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (code != null) 'code': code,
      if (icon != null) 'icon': icon,
      if (iconFamily != null) 'icon_family': iconFamily,
      if (iconPackage != null) 'icon_package': iconPackage,
      if (color != null) 'color': color,
      if (performance != null) 'performance': performance,
      if (creationDate != null) 'creation_date': creationDate,
      if (lastUpdateDate != null) 'last_update_date': lastUpdateDate,
      if (active != null) 'active': active,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int> id,
      Value<String> description,
      Value<String> code,
      Value<int> icon,
      Value<String> iconFamily,
      Value<String> iconPackage,
      Value<int> color,
      Value<int> performance,
      Value<DateTime> creationDate,
      Value<DateTime> lastUpdateDate,
      Value<bool> active}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      code: code ?? this.code,
      icon: icon ?? this.icon,
      iconFamily: iconFamily ?? this.iconFamily,
      iconPackage: iconPackage ?? this.iconPackage,
      color: color ?? this.color,
      performance: performance ?? this.performance,
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
      map['icon'] = Variable<int>(icon.value);
    }
    if (iconFamily.present) {
      map['icon_family'] = Variable<String>(iconFamily.value);
    }
    if (iconPackage.present) {
      map['icon_package'] = Variable<String>(iconPackage.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    if (performance.present) {
      map['performance'] = Variable<int>(performance.value);
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
          ..write('iconFamily: $iconFamily, ')
          ..write('iconPackage: $iconPackage, ')
          ..write('color: $color, ')
          ..write('performance: $performance, ')
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

  final VerificationMeta _iconFamilyMeta = const VerificationMeta('iconFamily');
  GeneratedTextColumn _iconFamily;
  @override
  GeneratedTextColumn get iconFamily => _iconFamily ??= _constructIconFamily();
  GeneratedTextColumn _constructIconFamily() {
    return GeneratedTextColumn(
      'icon_family',
      $tableName,
      true,
    );
  }

  final VerificationMeta _iconPackageMeta =
      const VerificationMeta('iconPackage');
  GeneratedTextColumn _iconPackage;
  @override
  GeneratedTextColumn get iconPackage =>
      _iconPackage ??= _constructIconPackage();
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

  final VerificationMeta _performanceMeta =
      const VerificationMeta('performance');
  GeneratedIntColumn _performance;
  @override
  GeneratedIntColumn get performance =>
      _performance ??= _constructPerformance();
  GeneratedIntColumn _constructPerformance() {
    return GeneratedIntColumn(
      'performance',
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
        icon,
        iconFamily,
        iconPackage,
        color,
        performance,
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
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon'], _iconMeta));
    }
    if (data.containsKey('icon_family')) {
      context.handle(
          _iconFamilyMeta,
          iconFamily.isAcceptableOrUnknown(
              data['icon_family'], _iconFamilyMeta));
    }
    if (data.containsKey('icon_package')) {
      context.handle(
          _iconPackageMeta,
          iconPackage.isAcceptableOrUnknown(
              data['icon_package'], _iconPackageMeta));
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color'], _colorMeta));
    }
    if (data.containsKey('performance')) {
      context.handle(
          _performanceMeta,
          performance.isAcceptableOrUnknown(
              data['performance'], _performanceMeta));
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

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $TransactionsTable _transactions;
  $TransactionsTable get transactions =>
      _transactions ??= $TransactionsTable(this);
  $CategoriesTable _categories;
  $CategoriesTable get categories => _categories ??= $CategoriesTable(this);
  Future<int> _resetCategory(int var1) {
    return customUpdate(
      'UPDATE Transactions SET category = NULL WHERE category = ?',
      variables: [Variable.withInt(var1)],
      updates: {transactions},
      updateKind: UpdateKind.update,
    );
  }

  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [transactions, categories];
}
