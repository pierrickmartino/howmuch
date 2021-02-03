// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Transaction extends DataClass implements Insertable<Transaction> {
  final int id;
  final String product;
  final String iban;
  final String transactionId;
  final String description;
  final String description2;
  final String description3;
  final String currency;
  final String extraInfo;
  final DateTime valueDate;
  final DateTime transactionDate;
  final DateTime accountingDate;
  final int category;
  final double debitAmount;
  final double creditAmount;
  final double transactionAmount;
  Transaction(
      {@required this.id,
      @required this.product,
      this.iban,
      this.transactionId,
      this.description,
      this.description2,
      this.description3,
      @required this.currency,
      this.extraInfo,
      this.valueDate,
      this.transactionDate,
      this.accountingDate,
      this.category,
      this.debitAmount,
      this.creditAmount,
      this.transactionAmount});
  factory Transaction.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final doubleType = db.typeSystem.forDartType<double>();
    return Transaction(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      product:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}product']),
      iban: stringType.mapFromDatabaseResponse(data['${effectivePrefix}iban']),
      transactionId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}transaction_id']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      description2: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description2']),
      description3: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description3']),
      currency: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}currency']),
      extraInfo: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}extra_info']),
      valueDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}value_date']),
      transactionDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}transaction_date']),
      accountingDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}accounting_date']),
      category:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}category']),
      debitAmount: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}debit_amount']),
      creditAmount: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}credit_amount']),
      transactionAmount: doubleType.mapFromDatabaseResponse(
          data['${effectivePrefix}transaction_amount']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || product != null) {
      map['product'] = Variable<String>(product);
    }
    if (!nullToAbsent || iban != null) {
      map['iban'] = Variable<String>(iban);
    }
    if (!nullToAbsent || transactionId != null) {
      map['transaction_id'] = Variable<String>(transactionId);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || description2 != null) {
      map['description2'] = Variable<String>(description2);
    }
    if (!nullToAbsent || description3 != null) {
      map['description3'] = Variable<String>(description3);
    }
    if (!nullToAbsent || currency != null) {
      map['currency'] = Variable<String>(currency);
    }
    if (!nullToAbsent || extraInfo != null) {
      map['extra_info'] = Variable<String>(extraInfo);
    }
    if (!nullToAbsent || valueDate != null) {
      map['value_date'] = Variable<DateTime>(valueDate);
    }
    if (!nullToAbsent || transactionDate != null) {
      map['transaction_date'] = Variable<DateTime>(transactionDate);
    }
    if (!nullToAbsent || accountingDate != null) {
      map['accounting_date'] = Variable<DateTime>(accountingDate);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<int>(category);
    }
    if (!nullToAbsent || debitAmount != null) {
      map['debit_amount'] = Variable<double>(debitAmount);
    }
    if (!nullToAbsent || creditAmount != null) {
      map['credit_amount'] = Variable<double>(creditAmount);
    }
    if (!nullToAbsent || transactionAmount != null) {
      map['transaction_amount'] = Variable<double>(transactionAmount);
    }
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      product: product == null && nullToAbsent
          ? const Value.absent()
          : Value(product),
      iban: iban == null && nullToAbsent ? const Value.absent() : Value(iban),
      transactionId: transactionId == null && nullToAbsent
          ? const Value.absent()
          : Value(transactionId),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      description2: description2 == null && nullToAbsent
          ? const Value.absent()
          : Value(description2),
      description3: description3 == null && nullToAbsent
          ? const Value.absent()
          : Value(description3),
      currency: currency == null && nullToAbsent
          ? const Value.absent()
          : Value(currency),
      extraInfo: extraInfo == null && nullToAbsent
          ? const Value.absent()
          : Value(extraInfo),
      valueDate: valueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(valueDate),
      transactionDate: transactionDate == null && nullToAbsent
          ? const Value.absent()
          : Value(transactionDate),
      accountingDate: accountingDate == null && nullToAbsent
          ? const Value.absent()
          : Value(accountingDate),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      debitAmount: debitAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(debitAmount),
      creditAmount: creditAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(creditAmount),
      transactionAmount: transactionAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(transactionAmount),
    );
  }

  factory Transaction.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Transaction(
      id: serializer.fromJson<int>(json['id']),
      product: serializer.fromJson<String>(json['product']),
      iban: serializer.fromJson<String>(json['iban']),
      transactionId: serializer.fromJson<String>(json['transactionId']),
      description: serializer.fromJson<String>(json['description']),
      description2: serializer.fromJson<String>(json['description2']),
      description3: serializer.fromJson<String>(json['description3']),
      currency: serializer.fromJson<String>(json['currency']),
      extraInfo: serializer.fromJson<String>(json['extraInfo']),
      valueDate: serializer.fromJson<DateTime>(json['valueDate']),
      transactionDate: serializer.fromJson<DateTime>(json['transactionDate']),
      accountingDate: serializer.fromJson<DateTime>(json['accountingDate']),
      category: serializer.fromJson<int>(json['category']),
      debitAmount: serializer.fromJson<double>(json['debitAmount']),
      creditAmount: serializer.fromJson<double>(json['creditAmount']),
      transactionAmount: serializer.fromJson<double>(json['transactionAmount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'product': serializer.toJson<String>(product),
      'iban': serializer.toJson<String>(iban),
      'transactionId': serializer.toJson<String>(transactionId),
      'description': serializer.toJson<String>(description),
      'description2': serializer.toJson<String>(description2),
      'description3': serializer.toJson<String>(description3),
      'currency': serializer.toJson<String>(currency),
      'extraInfo': serializer.toJson<String>(extraInfo),
      'valueDate': serializer.toJson<DateTime>(valueDate),
      'transactionDate': serializer.toJson<DateTime>(transactionDate),
      'accountingDate': serializer.toJson<DateTime>(accountingDate),
      'category': serializer.toJson<int>(category),
      'debitAmount': serializer.toJson<double>(debitAmount),
      'creditAmount': serializer.toJson<double>(creditAmount),
      'transactionAmount': serializer.toJson<double>(transactionAmount),
    };
  }

  Transaction copyWith(
          {int id,
          String product,
          String iban,
          String transactionId,
          String description,
          String description2,
          String description3,
          String currency,
          String extraInfo,
          DateTime valueDate,
          DateTime transactionDate,
          DateTime accountingDate,
          int category,
          double debitAmount,
          double creditAmount,
          double transactionAmount}) =>
      Transaction(
        id: id ?? this.id,
        product: product ?? this.product,
        iban: iban ?? this.iban,
        transactionId: transactionId ?? this.transactionId,
        description: description ?? this.description,
        description2: description2 ?? this.description2,
        description3: description3 ?? this.description3,
        currency: currency ?? this.currency,
        extraInfo: extraInfo ?? this.extraInfo,
        valueDate: valueDate ?? this.valueDate,
        transactionDate: transactionDate ?? this.transactionDate,
        accountingDate: accountingDate ?? this.accountingDate,
        category: category ?? this.category,
        debitAmount: debitAmount ?? this.debitAmount,
        creditAmount: creditAmount ?? this.creditAmount,
        transactionAmount: transactionAmount ?? this.transactionAmount,
      );
  @override
  String toString() {
    return (StringBuffer('Transaction(')
          ..write('id: $id, ')
          ..write('product: $product, ')
          ..write('iban: $iban, ')
          ..write('transactionId: $transactionId, ')
          ..write('description: $description, ')
          ..write('description2: $description2, ')
          ..write('description3: $description3, ')
          ..write('currency: $currency, ')
          ..write('extraInfo: $extraInfo, ')
          ..write('valueDate: $valueDate, ')
          ..write('transactionDate: $transactionDate, ')
          ..write('accountingDate: $accountingDate, ')
          ..write('category: $category, ')
          ..write('debitAmount: $debitAmount, ')
          ..write('creditAmount: $creditAmount, ')
          ..write('transactionAmount: $transactionAmount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          product.hashCode,
          $mrjc(
              iban.hashCode,
              $mrjc(
                  transactionId.hashCode,
                  $mrjc(
                      description.hashCode,
                      $mrjc(
                          description2.hashCode,
                          $mrjc(
                              description3.hashCode,
                              $mrjc(
                                  currency.hashCode,
                                  $mrjc(
                                      extraInfo.hashCode,
                                      $mrjc(
                                          valueDate.hashCode,
                                          $mrjc(
                                              transactionDate.hashCode,
                                              $mrjc(
                                                  accountingDate.hashCode,
                                                  $mrjc(
                                                      category.hashCode,
                                                      $mrjc(
                                                          debitAmount.hashCode,
                                                          $mrjc(
                                                              creditAmount
                                                                  .hashCode,
                                                              transactionAmount
                                                                  .hashCode))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Transaction &&
          other.id == this.id &&
          other.product == this.product &&
          other.iban == this.iban &&
          other.transactionId == this.transactionId &&
          other.description == this.description &&
          other.description2 == this.description2 &&
          other.description3 == this.description3 &&
          other.currency == this.currency &&
          other.extraInfo == this.extraInfo &&
          other.valueDate == this.valueDate &&
          other.transactionDate == this.transactionDate &&
          other.accountingDate == this.accountingDate &&
          other.category == this.category &&
          other.debitAmount == this.debitAmount &&
          other.creditAmount == this.creditAmount &&
          other.transactionAmount == this.transactionAmount);
}

class TransactionsCompanion extends UpdateCompanion<Transaction> {
  final Value<int> id;
  final Value<String> product;
  final Value<String> iban;
  final Value<String> transactionId;
  final Value<String> description;
  final Value<String> description2;
  final Value<String> description3;
  final Value<String> currency;
  final Value<String> extraInfo;
  final Value<DateTime> valueDate;
  final Value<DateTime> transactionDate;
  final Value<DateTime> accountingDate;
  final Value<int> category;
  final Value<double> debitAmount;
  final Value<double> creditAmount;
  final Value<double> transactionAmount;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.product = const Value.absent(),
    this.iban = const Value.absent(),
    this.transactionId = const Value.absent(),
    this.description = const Value.absent(),
    this.description2 = const Value.absent(),
    this.description3 = const Value.absent(),
    this.currency = const Value.absent(),
    this.extraInfo = const Value.absent(),
    this.valueDate = const Value.absent(),
    this.transactionDate = const Value.absent(),
    this.accountingDate = const Value.absent(),
    this.category = const Value.absent(),
    this.debitAmount = const Value.absent(),
    this.creditAmount = const Value.absent(),
    this.transactionAmount = const Value.absent(),
  });
  TransactionsCompanion.insert({
    this.id = const Value.absent(),
    @required String product,
    this.iban = const Value.absent(),
    this.transactionId = const Value.absent(),
    this.description = const Value.absent(),
    this.description2 = const Value.absent(),
    this.description3 = const Value.absent(),
    @required String currency,
    this.extraInfo = const Value.absent(),
    this.valueDate = const Value.absent(),
    this.transactionDate = const Value.absent(),
    this.accountingDate = const Value.absent(),
    this.category = const Value.absent(),
    this.debitAmount = const Value.absent(),
    this.creditAmount = const Value.absent(),
    this.transactionAmount = const Value.absent(),
  })  : product = Value(product),
        currency = Value(currency);
  static Insertable<Transaction> custom({
    Expression<int> id,
    Expression<String> product,
    Expression<String> iban,
    Expression<String> transactionId,
    Expression<String> description,
    Expression<String> description2,
    Expression<String> description3,
    Expression<String> currency,
    Expression<String> extraInfo,
    Expression<DateTime> valueDate,
    Expression<DateTime> transactionDate,
    Expression<DateTime> accountingDate,
    Expression<int> category,
    Expression<double> debitAmount,
    Expression<double> creditAmount,
    Expression<double> transactionAmount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (product != null) 'product': product,
      if (iban != null) 'iban': iban,
      if (transactionId != null) 'transaction_id': transactionId,
      if (description != null) 'description': description,
      if (description2 != null) 'description2': description2,
      if (description3 != null) 'description3': description3,
      if (currency != null) 'currency': currency,
      if (extraInfo != null) 'extra_info': extraInfo,
      if (valueDate != null) 'value_date': valueDate,
      if (transactionDate != null) 'transaction_date': transactionDate,
      if (accountingDate != null) 'accounting_date': accountingDate,
      if (category != null) 'category': category,
      if (debitAmount != null) 'debit_amount': debitAmount,
      if (creditAmount != null) 'credit_amount': creditAmount,
      if (transactionAmount != null) 'transaction_amount': transactionAmount,
    });
  }

  TransactionsCompanion copyWith(
      {Value<int> id,
      Value<String> product,
      Value<String> iban,
      Value<String> transactionId,
      Value<String> description,
      Value<String> description2,
      Value<String> description3,
      Value<String> currency,
      Value<String> extraInfo,
      Value<DateTime> valueDate,
      Value<DateTime> transactionDate,
      Value<DateTime> accountingDate,
      Value<int> category,
      Value<double> debitAmount,
      Value<double> creditAmount,
      Value<double> transactionAmount}) {
    return TransactionsCompanion(
      id: id ?? this.id,
      product: product ?? this.product,
      iban: iban ?? this.iban,
      transactionId: transactionId ?? this.transactionId,
      description: description ?? this.description,
      description2: description2 ?? this.description2,
      description3: description3 ?? this.description3,
      currency: currency ?? this.currency,
      extraInfo: extraInfo ?? this.extraInfo,
      valueDate: valueDate ?? this.valueDate,
      transactionDate: transactionDate ?? this.transactionDate,
      accountingDate: accountingDate ?? this.accountingDate,
      category: category ?? this.category,
      debitAmount: debitAmount ?? this.debitAmount,
      creditAmount: creditAmount ?? this.creditAmount,
      transactionAmount: transactionAmount ?? this.transactionAmount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (product.present) {
      map['product'] = Variable<String>(product.value);
    }
    if (iban.present) {
      map['iban'] = Variable<String>(iban.value);
    }
    if (transactionId.present) {
      map['transaction_id'] = Variable<String>(transactionId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (description2.present) {
      map['description2'] = Variable<String>(description2.value);
    }
    if (description3.present) {
      map['description3'] = Variable<String>(description3.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (extraInfo.present) {
      map['extra_info'] = Variable<String>(extraInfo.value);
    }
    if (valueDate.present) {
      map['value_date'] = Variable<DateTime>(valueDate.value);
    }
    if (transactionDate.present) {
      map['transaction_date'] = Variable<DateTime>(transactionDate.value);
    }
    if (accountingDate.present) {
      map['accounting_date'] = Variable<DateTime>(accountingDate.value);
    }
    if (category.present) {
      map['category'] = Variable<int>(category.value);
    }
    if (debitAmount.present) {
      map['debit_amount'] = Variable<double>(debitAmount.value);
    }
    if (creditAmount.present) {
      map['credit_amount'] = Variable<double>(creditAmount.value);
    }
    if (transactionAmount.present) {
      map['transaction_amount'] = Variable<double>(transactionAmount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('id: $id, ')
          ..write('product: $product, ')
          ..write('iban: $iban, ')
          ..write('transactionId: $transactionId, ')
          ..write('description: $description, ')
          ..write('description2: $description2, ')
          ..write('description3: $description3, ')
          ..write('currency: $currency, ')
          ..write('extraInfo: $extraInfo, ')
          ..write('valueDate: $valueDate, ')
          ..write('transactionDate: $transactionDate, ')
          ..write('accountingDate: $accountingDate, ')
          ..write('category: $category, ')
          ..write('debitAmount: $debitAmount, ')
          ..write('creditAmount: $creditAmount, ')
          ..write('transactionAmount: $transactionAmount')
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

  final VerificationMeta _productMeta = const VerificationMeta('product');
  GeneratedTextColumn _product;
  @override
  GeneratedTextColumn get product => _product ??= _constructProduct();
  GeneratedTextColumn _constructProduct() {
    return GeneratedTextColumn(
      'product',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ibanMeta = const VerificationMeta('iban');
  GeneratedTextColumn _iban;
  @override
  GeneratedTextColumn get iban => _iban ??= _constructIban();
  GeneratedTextColumn _constructIban() {
    return GeneratedTextColumn(
      'iban',
      $tableName,
      true,
    );
  }

  final VerificationMeta _transactionIdMeta =
      const VerificationMeta('transactionId');
  GeneratedTextColumn _transactionId;
  @override
  GeneratedTextColumn get transactionId =>
      _transactionId ??= _constructTransactionId();
  GeneratedTextColumn _constructTransactionId() {
    return GeneratedTextColumn(
      'transaction_id',
      $tableName,
      true,
    );
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
      true,
    );
  }

  final VerificationMeta _description2Meta =
      const VerificationMeta('description2');
  GeneratedTextColumn _description2;
  @override
  GeneratedTextColumn get description2 =>
      _description2 ??= _constructDescription2();
  GeneratedTextColumn _constructDescription2() {
    return GeneratedTextColumn(
      'description2',
      $tableName,
      true,
    );
  }

  final VerificationMeta _description3Meta =
      const VerificationMeta('description3');
  GeneratedTextColumn _description3;
  @override
  GeneratedTextColumn get description3 =>
      _description3 ??= _constructDescription3();
  GeneratedTextColumn _constructDescription3() {
    return GeneratedTextColumn(
      'description3',
      $tableName,
      true,
    );
  }

  final VerificationMeta _currencyMeta = const VerificationMeta('currency');
  GeneratedTextColumn _currency;
  @override
  GeneratedTextColumn get currency => _currency ??= _constructCurrency();
  GeneratedTextColumn _constructCurrency() {
    return GeneratedTextColumn('currency', $tableName, false,
        minTextLength: 3, maxTextLength: 3);
  }

  final VerificationMeta _extraInfoMeta = const VerificationMeta('extraInfo');
  GeneratedTextColumn _extraInfo;
  @override
  GeneratedTextColumn get extraInfo => _extraInfo ??= _constructExtraInfo();
  GeneratedTextColumn _constructExtraInfo() {
    return GeneratedTextColumn(
      'extra_info',
      $tableName,
      true,
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

  final VerificationMeta _transactionDateMeta =
      const VerificationMeta('transactionDate');
  GeneratedDateTimeColumn _transactionDate;
  @override
  GeneratedDateTimeColumn get transactionDate =>
      _transactionDate ??= _constructTransactionDate();
  GeneratedDateTimeColumn _constructTransactionDate() {
    return GeneratedDateTimeColumn(
      'transaction_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _accountingDateMeta =
      const VerificationMeta('accountingDate');
  GeneratedDateTimeColumn _accountingDate;
  @override
  GeneratedDateTimeColumn get accountingDate =>
      _accountingDate ??= _constructAccountingDate();
  GeneratedDateTimeColumn _constructAccountingDate() {
    return GeneratedDateTimeColumn(
      'accounting_date',
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

  final VerificationMeta _debitAmountMeta =
      const VerificationMeta('debitAmount');
  GeneratedRealColumn _debitAmount;
  @override
  GeneratedRealColumn get debitAmount =>
      _debitAmount ??= _constructDebitAmount();
  GeneratedRealColumn _constructDebitAmount() {
    return GeneratedRealColumn('debit_amount', $tableName, true,
        defaultValue: const Constant(0));
  }

  final VerificationMeta _creditAmountMeta =
      const VerificationMeta('creditAmount');
  GeneratedRealColumn _creditAmount;
  @override
  GeneratedRealColumn get creditAmount =>
      _creditAmount ??= _constructCreditAmount();
  GeneratedRealColumn _constructCreditAmount() {
    return GeneratedRealColumn('credit_amount', $tableName, true,
        defaultValue: const Constant(0));
  }

  final VerificationMeta _transactionAmountMeta =
      const VerificationMeta('transactionAmount');
  GeneratedRealColumn _transactionAmount;
  @override
  GeneratedRealColumn get transactionAmount =>
      _transactionAmount ??= _constructTransactionAmount();
  GeneratedRealColumn _constructTransactionAmount() {
    return GeneratedRealColumn('transaction_amount', $tableName, true,
        defaultValue: const Constant(0));
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        product,
        iban,
        transactionId,
        description,
        description2,
        description3,
        currency,
        extraInfo,
        valueDate,
        transactionDate,
        accountingDate,
        category,
        debitAmount,
        creditAmount,
        transactionAmount
      ];
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
    if (data.containsKey('product')) {
      context.handle(_productMeta,
          product.isAcceptableOrUnknown(data['product'], _productMeta));
    } else if (isInserting) {
      context.missing(_productMeta);
    }
    if (data.containsKey('iban')) {
      context.handle(
          _ibanMeta, iban.isAcceptableOrUnknown(data['iban'], _ibanMeta));
    }
    if (data.containsKey('transaction_id')) {
      context.handle(
          _transactionIdMeta,
          transactionId.isAcceptableOrUnknown(
              data['transaction_id'], _transactionIdMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    }
    if (data.containsKey('description2')) {
      context.handle(
          _description2Meta,
          description2.isAcceptableOrUnknown(
              data['description2'], _description2Meta));
    }
    if (data.containsKey('description3')) {
      context.handle(
          _description3Meta,
          description3.isAcceptableOrUnknown(
              data['description3'], _description3Meta));
    }
    if (data.containsKey('currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['currency'], _currencyMeta));
    } else if (isInserting) {
      context.missing(_currencyMeta);
    }
    if (data.containsKey('extra_info')) {
      context.handle(_extraInfoMeta,
          extraInfo.isAcceptableOrUnknown(data['extra_info'], _extraInfoMeta));
    }
    if (data.containsKey('value_date')) {
      context.handle(_valueDateMeta,
          valueDate.isAcceptableOrUnknown(data['value_date'], _valueDateMeta));
    }
    if (data.containsKey('transaction_date')) {
      context.handle(
          _transactionDateMeta,
          transactionDate.isAcceptableOrUnknown(
              data['transaction_date'], _transactionDateMeta));
    }
    if (data.containsKey('accounting_date')) {
      context.handle(
          _accountingDateMeta,
          accountingDate.isAcceptableOrUnknown(
              data['accounting_date'], _accountingDateMeta));
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category'], _categoryMeta));
    }
    if (data.containsKey('debit_amount')) {
      context.handle(
          _debitAmountMeta,
          debitAmount.isAcceptableOrUnknown(
              data['debit_amount'], _debitAmountMeta));
    }
    if (data.containsKey('credit_amount')) {
      context.handle(
          _creditAmountMeta,
          creditAmount.isAcceptableOrUnknown(
              data['credit_amount'], _creditAmountMeta));
    }
    if (data.containsKey('transaction_amount')) {
      context.handle(
          _transactionAmountMeta,
          transactionAmount.isAcceptableOrUnknown(
              data['transaction_amount'], _transactionAmountMeta));
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
  final int icon;
  final String iconFamily;
  final String iconPackage;
  final int color;
  final int performance;
  final DateTime creationDate;
  final DateTime lastUpdateDate;
  final bool editable;
  final bool active;
  Category(
      {@required this.id,
      @required this.description,
      this.icon,
      this.iconFamily,
      this.iconPackage,
      this.color,
      this.performance,
      this.creationDate,
      this.lastUpdateDate,
      @required this.editable,
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
      editable:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}editable']),
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
    if (!nullToAbsent || editable != null) {
      map['editable'] = Variable<bool>(editable);
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
      editable: editable == null && nullToAbsent
          ? const Value.absent()
          : Value(editable),
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
      icon: serializer.fromJson<int>(json['icon']),
      iconFamily: serializer.fromJson<String>(json['iconFamily']),
      iconPackage: serializer.fromJson<String>(json['iconPackage']),
      color: serializer.fromJson<int>(json['color']),
      performance: serializer.fromJson<int>(json['performance']),
      creationDate: serializer.fromJson<DateTime>(json['creationDate']),
      lastUpdateDate: serializer.fromJson<DateTime>(json['lastUpdateDate']),
      editable: serializer.fromJson<bool>(json['editable']),
      active: serializer.fromJson<bool>(json['active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'description': serializer.toJson<String>(description),
      'icon': serializer.toJson<int>(icon),
      'iconFamily': serializer.toJson<String>(iconFamily),
      'iconPackage': serializer.toJson<String>(iconPackage),
      'color': serializer.toJson<int>(color),
      'performance': serializer.toJson<int>(performance),
      'creationDate': serializer.toJson<DateTime>(creationDate),
      'lastUpdateDate': serializer.toJson<DateTime>(lastUpdateDate),
      'editable': serializer.toJson<bool>(editable),
      'active': serializer.toJson<bool>(active),
    };
  }

  Category copyWith(
          {int id,
          String description,
          int icon,
          String iconFamily,
          String iconPackage,
          int color,
          int performance,
          DateTime creationDate,
          DateTime lastUpdateDate,
          bool editable,
          bool active}) =>
      Category(
        id: id ?? this.id,
        description: description ?? this.description,
        icon: icon ?? this.icon,
        iconFamily: iconFamily ?? this.iconFamily,
        iconPackage: iconPackage ?? this.iconPackage,
        color: color ?? this.color,
        performance: performance ?? this.performance,
        creationDate: creationDate ?? this.creationDate,
        lastUpdateDate: lastUpdateDate ?? this.lastUpdateDate,
        editable: editable ?? this.editable,
        active: active ?? this.active,
      );
  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('icon: $icon, ')
          ..write('iconFamily: $iconFamily, ')
          ..write('iconPackage: $iconPackage, ')
          ..write('color: $color, ')
          ..write('performance: $performance, ')
          ..write('creationDate: $creationDate, ')
          ..write('lastUpdateDate: $lastUpdateDate, ')
          ..write('editable: $editable, ')
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
                                  $mrjc(
                                      lastUpdateDate.hashCode,
                                      $mrjc(editable.hashCode,
                                          active.hashCode)))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.description == this.description &&
          other.icon == this.icon &&
          other.iconFamily == this.iconFamily &&
          other.iconPackage == this.iconPackage &&
          other.color == this.color &&
          other.performance == this.performance &&
          other.creationDate == this.creationDate &&
          other.lastUpdateDate == this.lastUpdateDate &&
          other.editable == this.editable &&
          other.active == this.active);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> description;
  final Value<int> icon;
  final Value<String> iconFamily;
  final Value<String> iconPackage;
  final Value<int> color;
  final Value<int> performance;
  final Value<DateTime> creationDate;
  final Value<DateTime> lastUpdateDate;
  final Value<bool> editable;
  final Value<bool> active;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.icon = const Value.absent(),
    this.iconFamily = const Value.absent(),
    this.iconPackage = const Value.absent(),
    this.color = const Value.absent(),
    this.performance = const Value.absent(),
    this.creationDate = const Value.absent(),
    this.lastUpdateDate = const Value.absent(),
    this.editable = const Value.absent(),
    this.active = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    @required String description,
    this.icon = const Value.absent(),
    this.iconFamily = const Value.absent(),
    this.iconPackage = const Value.absent(),
    this.color = const Value.absent(),
    this.performance = const Value.absent(),
    this.creationDate = const Value.absent(),
    this.lastUpdateDate = const Value.absent(),
    this.editable = const Value.absent(),
    this.active = const Value.absent(),
  }) : description = Value(description);
  static Insertable<Category> custom({
    Expression<int> id,
    Expression<String> description,
    Expression<int> icon,
    Expression<String> iconFamily,
    Expression<String> iconPackage,
    Expression<int> color,
    Expression<int> performance,
    Expression<DateTime> creationDate,
    Expression<DateTime> lastUpdateDate,
    Expression<bool> editable,
    Expression<bool> active,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (icon != null) 'icon': icon,
      if (iconFamily != null) 'icon_family': iconFamily,
      if (iconPackage != null) 'icon_package': iconPackage,
      if (color != null) 'color': color,
      if (performance != null) 'performance': performance,
      if (creationDate != null) 'creation_date': creationDate,
      if (lastUpdateDate != null) 'last_update_date': lastUpdateDate,
      if (editable != null) 'editable': editable,
      if (active != null) 'active': active,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int> id,
      Value<String> description,
      Value<int> icon,
      Value<String> iconFamily,
      Value<String> iconPackage,
      Value<int> color,
      Value<int> performance,
      Value<DateTime> creationDate,
      Value<DateTime> lastUpdateDate,
      Value<bool> editable,
      Value<bool> active}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      iconFamily: iconFamily ?? this.iconFamily,
      iconPackage: iconPackage ?? this.iconPackage,
      color: color ?? this.color,
      performance: performance ?? this.performance,
      creationDate: creationDate ?? this.creationDate,
      lastUpdateDate: lastUpdateDate ?? this.lastUpdateDate,
      editable: editable ?? this.editable,
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
    if (editable.present) {
      map['editable'] = Variable<bool>(editable.value);
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
          ..write('icon: $icon, ')
          ..write('iconFamily: $iconFamily, ')
          ..write('iconPackage: $iconPackage, ')
          ..write('color: $color, ')
          ..write('performance: $performance, ')
          ..write('creationDate: $creationDate, ')
          ..write('lastUpdateDate: $lastUpdateDate, ')
          ..write('editable: $editable, ')
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

  final VerificationMeta _editableMeta = const VerificationMeta('editable');
  GeneratedBoolColumn _editable;
  @override
  GeneratedBoolColumn get editable => _editable ??= _constructEditable();
  GeneratedBoolColumn _constructEditable() {
    return GeneratedBoolColumn('editable', $tableName, false,
        defaultValue: const Constant(true));
  }

  final VerificationMeta _activeMeta = const VerificationMeta('active');
  GeneratedBoolColumn _active;
  @override
  GeneratedBoolColumn get active => _active ??= _constructActive();
  GeneratedBoolColumn _constructActive() {
    return GeneratedBoolColumn('active', $tableName, false,
        defaultValue: const Constant(true));
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        description,
        icon,
        iconFamily,
        iconPackage,
        color,
        performance,
        creationDate,
        lastUpdateDate,
        editable,
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
    if (data.containsKey('editable')) {
      context.handle(_editableMeta,
          editable.isAcceptableOrUnknown(data['editable'], _editableMeta));
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
