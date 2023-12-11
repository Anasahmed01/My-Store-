// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:checkout/src/views/home/home.dart' as _i2;
import 'package:checkout/src/views/receipt/receipt.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i5;

class Routes {
  static const home = '/';

  static const receipt = '/Receipt';

  static const all = <String>{
    home,
    receipt,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.home,
      page: _i2.Home,
    ),
    _i1.RouteDef(
      Routes.receipt,
      page: _i3.Receipt,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.Home: (data) {
      return _i4.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.Home(),
        settings: data,
      );
    },
    _i3.Receipt: (data) {
      final args = data.getArgs<ReceiptArguments>(nullOk: false);
      return _i4.MaterialPageRoute<dynamic>(
        builder: (context) => _i3.Receipt(
            key: args.key,
            productName: args.productName,
            productPrice: args.productPrice,
            totalPrice: args.totalPrice),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class ReceiptArguments {
  const ReceiptArguments({
    this.key,
    required this.productName,
    required this.productPrice,
    required this.totalPrice,
  });

  final _i4.Key? key;

  final List<dynamic> productName;

  final List<dynamic> productPrice;

  final int totalPrice;

  @override
  String toString() {
    return '{"key": "$key", "productName": "$productName", "productPrice": "$productPrice", "totalPrice": "$totalPrice"}';
  }

  @override
  bool operator ==(covariant ReceiptArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.productName == productName &&
        other.productPrice == productPrice &&
        other.totalPrice == totalPrice;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        productName.hashCode ^
        productPrice.hashCode ^
        totalPrice.hashCode;
  }
}

extension NavigatorStateExtension on _i5.NavigationService {
  Future<dynamic> navigateToHome([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.home,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToReceipt({
    _i4.Key? key,
    required List<dynamic> productName,
    required List<dynamic> productPrice,
    required int totalPrice,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.receipt,
        arguments: ReceiptArguments(
            key: key,
            productName: productName,
            productPrice: productPrice,
            totalPrice: totalPrice),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHome([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.home,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithReceipt({
    _i4.Key? key,
    required List<dynamic> productName,
    required List<dynamic> productPrice,
    required int totalPrice,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.receipt,
        arguments: ReceiptArguments(
            key: key,
            productName: productName,
            productPrice: productPrice,
            totalPrice: totalPrice),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
