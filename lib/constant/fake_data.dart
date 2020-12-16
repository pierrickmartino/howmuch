import 'package:faker/faker.dart';
import 'package:howmuch/src/model/transaction.dart';

class FakeData {
  static Faker faker = Faker();

  // Category List : 5
  static List<Transaction> fakeCategoryList = List.generate(
      5,
      (index) => Transaction(
            id: faker.guid.guid(),
            objectId: faker.guid.guid(),
            description: faker.sport.name(),
            color: faker.randomGenerator.integer(4300000000, min: 4200000000),
            amount: faker.randomGenerator.integer(10000, min: -10000),
            date: null, //faker.date.dateTime(),
          ),
      growable: false);

  // Transaction List : 5
  static List<Transaction> fakeTransactionList = List.generate(
      5,
      (index) => Transaction(
            id: faker.guid.guid(),
            objectId: faker.guid.guid(),
            description: faker.company.name(),
            color: faker.randomGenerator.integer(4300000000, min: 4200000000),
            amount: faker.randomGenerator.integer(10000, min: -10000),
            date: faker.date.dateTime(
                minYear: 2020, maxYear: 2021), //faker.date.dateTime(),
          ),
      growable: false);

  // Fake Balance
  static int fakeBalance = faker.randomGenerator.integer(1000000, min: -100000);
  // Fake Income
  static double fakeIncome =
      faker.randomGenerator.integer(1000000, min: -100000).ceilToDouble();
  static double fakeIncomeVariation =
      faker.randomGenerator.integer(20, min: -20).ceilToDouble();
  // Fake Outcome
  static double fakeOutcome =
      faker.randomGenerator.integer(1000000, min: -100000).ceilToDouble();
  static double fakeOutcomeVariation =
      faker.randomGenerator.integer(20, min: -20).ceilToDouble();
  // Fake Savings
  static double fakeSavings =
      faker.randomGenerator.integer(1000000, min: -100000).ceilToDouble();
  static double fakeSavingsVariation =
      faker.randomGenerator.integer(20, min: -20).ceilToDouble();
}

const mockUsers = const {
  'toto@gmail.com': 'pick',
};
