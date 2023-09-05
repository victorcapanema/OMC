// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gatherer_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GathererPageController on _GathererPageController, Store {
  late final _$rullingListAtom =
      Atom(name: '_GathererPageController.rullingList', context: context);

  @override
  List<RullingModel> get rullingList {
    _$rullingListAtom.reportRead();
    return super.rullingList;
  }

  @override
  set rullingList(List<RullingModel> value) {
    _$rullingListAtom.reportWrite(value, super.rullingList, () {
      super.rullingList = value;
    });
  }

  late final _$getRullingsAsyncAction =
      AsyncAction('_GathererPageController.getRullings', context: context);

  @override
  Future<void> getRullings() {
    return _$getRullingsAsyncAction.run(() => super.getRullings());
  }

  @override
  String toString() {
    return '''
rullingList: ${rullingList}
    ''';
  }
}
