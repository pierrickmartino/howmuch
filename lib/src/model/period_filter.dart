import 'package:flutter/material.dart';

class PeriodFilter extends ChangeNotifier {
  // OLD
  var _filterPeriod = 1;
  // NEW
  var _filterPeriodForNumbers = 3;
  var _filterPeriodForCategories = 3;
  var _filterPeriodForTransactions = 3;

  // OLD
  int get getPeriodFilter {
    return _filterPeriod;
  }

  // NEW
  int get getPeriodFilterForNumbers {
    return _filterPeriodForNumbers;
  }

  int get getPeriodFilterForCategories {
    return _filterPeriodForCategories;
  }

  int get getPeriodFilterForTransactions {
    return _filterPeriodForTransactions;
  }

  // OLD
  void setPeriodFilter(int _period) {
    _filterPeriod = _period;
    notifyListeners();
  }

  // NEW
  void setPeriodFilterForNumbers(int _period) {
    _filterPeriodForNumbers = _period;
    notifyListeners();
  }

  void setPeriodFilterForCategories(int _period) {
    _filterPeriodForCategories = _period;
    notifyListeners();
  }

  void setPeriodFilterForTransactions(int _period) {
    _filterPeriodForTransactions = _period;
    notifyListeners();
  }
}
