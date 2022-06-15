import 'package:flutter/material.dart';

abstract class NavigatorService {
  Future<dynamic>? pushNamed(String routeName, {dynamic arguments});

  Future<dynamic>? pushReplacementNamed(String routeName, {dynamic arguments});

  Future<dynamic>? popAllAndPushNamed(String routeName, {dynamic arguments});

  Future<dynamic>? popUntilFirstAndPushNamed(String routeName,
      {dynamic arguments});

  Future<dynamic>? pushNamedAndRemoveUntil(String routeName,
      {required RoutePredicate predicate, arguments, int? id});

  void popUntilNamed(String routeName);

  void popUntilPredicate(RoutePredicate routePredicate);

  void popRepeated(int times, {int? id});

  bool pop({dynamic returnValue, int? id});

  void closeOverlay();
}
