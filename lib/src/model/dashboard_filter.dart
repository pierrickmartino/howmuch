import 'package:flutter/material.dart';

class DashboardFilter extends ChangeNotifier {
  var _filterPeriod = 1;

  int get getPeriodFilter {
    return _filterPeriod;
  }

  void setPeriodFilter(int _period) {
    _filterPeriod = _period;
    notifyListeners();
  }
}
