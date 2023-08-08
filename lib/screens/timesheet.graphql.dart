// ignore_for_file: type=lint
import '../schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Fragment$TimesheetListItem {
  Fragment$TimesheetListItem({
    required this.id,
    required this.month,
    required this.status,
    required this.totalTime,
    this.$__typename = 'Timesheet',
  });

  factory Fragment$TimesheetListItem.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$month = json['month'];
    final l$status = json['status'];
    final l$totalTime = json['totalTime'];
    final l$$__typename = json['__typename'];
    return Fragment$TimesheetListItem(
      id: (l$id as String),
      month: (l$month as String),
      status: fromJson$Enum$TimesheetStatusEnum((l$status as String)),
      totalTime: (l$totalTime as int),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String month;

  final Enum$TimesheetStatusEnum status;

  final int totalTime;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$month = month;
    _resultData['month'] = l$month;
    final l$status = status;
    _resultData['status'] = toJson$Enum$TimesheetStatusEnum(l$status);
    final l$totalTime = totalTime;
    _resultData['totalTime'] = l$totalTime;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$month = month;
    final l$status = status;
    final l$totalTime = totalTime;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$month,
      l$status,
      l$totalTime,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$TimesheetListItem) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$month = month;
    final lOther$month = other.month;
    if (l$month != lOther$month) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$totalTime = totalTime;
    final lOther$totalTime = other.totalTime;
    if (l$totalTime != lOther$totalTime) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$TimesheetListItem
    on Fragment$TimesheetListItem {
  CopyWith$Fragment$TimesheetListItem<Fragment$TimesheetListItem>
      get copyWith => CopyWith$Fragment$TimesheetListItem(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$TimesheetListItem<TRes> {
  factory CopyWith$Fragment$TimesheetListItem(
    Fragment$TimesheetListItem instance,
    TRes Function(Fragment$TimesheetListItem) then,
  ) = _CopyWithImpl$Fragment$TimesheetListItem;

  factory CopyWith$Fragment$TimesheetListItem.stub(TRes res) =
      _CopyWithStubImpl$Fragment$TimesheetListItem;

  TRes call({
    String? id,
    String? month,
    Enum$TimesheetStatusEnum? status,
    int? totalTime,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$TimesheetListItem<TRes>
    implements CopyWith$Fragment$TimesheetListItem<TRes> {
  _CopyWithImpl$Fragment$TimesheetListItem(
    this._instance,
    this._then,
  );

  final Fragment$TimesheetListItem _instance;

  final TRes Function(Fragment$TimesheetListItem) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? month = _undefined,
    Object? status = _undefined,
    Object? totalTime = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$TimesheetListItem(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        month: month == _undefined || month == null
            ? _instance.month
            : (month as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as Enum$TimesheetStatusEnum),
        totalTime: totalTime == _undefined || totalTime == null
            ? _instance.totalTime
            : (totalTime as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$TimesheetListItem<TRes>
    implements CopyWith$Fragment$TimesheetListItem<TRes> {
  _CopyWithStubImpl$Fragment$TimesheetListItem(this._res);

  TRes _res;

  call({
    String? id,
    String? month,
    Enum$TimesheetStatusEnum? status,
    int? totalTime,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionTimesheetListItem = FragmentDefinitionNode(
  name: NameNode(value: 'TimesheetListItem'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Timesheet'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'id'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'month'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'status'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'totalTime'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: '__typename'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
  ]),
);
const documentNodeFragmentTimesheetListItem = DocumentNode(definitions: [
  fragmentDefinitionTimesheetListItem,
]);

extension ClientExtension$Fragment$TimesheetListItem on graphql.GraphQLClient {
  void writeFragment$TimesheetListItem({
    required Fragment$TimesheetListItem data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'TimesheetListItem',
            document: documentNodeFragmentTimesheetListItem,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$TimesheetListItem? readFragment$TimesheetListItem({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'TimesheetListItem',
          document: documentNodeFragmentTimesheetListItem,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$TimesheetListItem.fromJson(result);
  }
}

class Fragment$TimesheetDetail implements Fragment$TimesheetListItem {
  Fragment$TimesheetDetail({
    required this.id,
    required this.month,
    required this.status,
    required this.totalTime,
    this.$__typename = 'Timesheet',
    required this.activities,
  });

  factory Fragment$TimesheetDetail.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$month = json['month'];
    final l$status = json['status'];
    final l$totalTime = json['totalTime'];
    final l$$__typename = json['__typename'];
    final l$activities = json['activities'];
    return Fragment$TimesheetDetail(
      id: (l$id as String),
      month: (l$month as String),
      status: fromJson$Enum$TimesheetStatusEnum((l$status as String)),
      totalTime: (l$totalTime as int),
      $__typename: (l$$__typename as String),
      activities: (l$activities as List<dynamic>)
          .map((e) => Fragment$TimesheetDetail$activities.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
    );
  }

  final String id;

  final String month;

  final Enum$TimesheetStatusEnum status;

  final int totalTime;

  final String $__typename;

  final List<Fragment$TimesheetDetail$activities> activities;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$month = month;
    _resultData['month'] = l$month;
    final l$status = status;
    _resultData['status'] = toJson$Enum$TimesheetStatusEnum(l$status);
    final l$totalTime = totalTime;
    _resultData['totalTime'] = l$totalTime;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$activities = activities;
    _resultData['activities'] = l$activities.map((e) => e.toJson()).toList();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$month = month;
    final l$status = status;
    final l$totalTime = totalTime;
    final l$$__typename = $__typename;
    final l$activities = activities;
    return Object.hashAll([
      l$id,
      l$month,
      l$status,
      l$totalTime,
      l$$__typename,
      Object.hashAll(l$activities.map((v) => v)),
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$TimesheetDetail) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$month = month;
    final lOther$month = other.month;
    if (l$month != lOther$month) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$totalTime = totalTime;
    final lOther$totalTime = other.totalTime;
    if (l$totalTime != lOther$totalTime) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$activities = activities;
    final lOther$activities = other.activities;
    if (l$activities.length != lOther$activities.length) {
      return false;
    }
    for (int i = 0; i < l$activities.length; i++) {
      final l$activities$entry = l$activities[i];
      final lOther$activities$entry = lOther$activities[i];
      if (l$activities$entry != lOther$activities$entry) {
        return false;
      }
    }
    return true;
  }
}

extension UtilityExtension$Fragment$TimesheetDetail
    on Fragment$TimesheetDetail {
  CopyWith$Fragment$TimesheetDetail<Fragment$TimesheetDetail> get copyWith =>
      CopyWith$Fragment$TimesheetDetail(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$TimesheetDetail<TRes> {
  factory CopyWith$Fragment$TimesheetDetail(
    Fragment$TimesheetDetail instance,
    TRes Function(Fragment$TimesheetDetail) then,
  ) = _CopyWithImpl$Fragment$TimesheetDetail;

  factory CopyWith$Fragment$TimesheetDetail.stub(TRes res) =
      _CopyWithStubImpl$Fragment$TimesheetDetail;

  TRes call({
    String? id,
    String? month,
    Enum$TimesheetStatusEnum? status,
    int? totalTime,
    String? $__typename,
    List<Fragment$TimesheetDetail$activities>? activities,
  });
  TRes activities(
      Iterable<Fragment$TimesheetDetail$activities> Function(
              Iterable<
                  CopyWith$Fragment$TimesheetDetail$activities<
                      Fragment$TimesheetDetail$activities>>)
          _fn);
}

class _CopyWithImpl$Fragment$TimesheetDetail<TRes>
    implements CopyWith$Fragment$TimesheetDetail<TRes> {
  _CopyWithImpl$Fragment$TimesheetDetail(
    this._instance,
    this._then,
  );

  final Fragment$TimesheetDetail _instance;

  final TRes Function(Fragment$TimesheetDetail) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? month = _undefined,
    Object? status = _undefined,
    Object? totalTime = _undefined,
    Object? $__typename = _undefined,
    Object? activities = _undefined,
  }) =>
      _then(Fragment$TimesheetDetail(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        month: month == _undefined || month == null
            ? _instance.month
            : (month as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as Enum$TimesheetStatusEnum),
        totalTime: totalTime == _undefined || totalTime == null
            ? _instance.totalTime
            : (totalTime as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        activities: activities == _undefined || activities == null
            ? _instance.activities
            : (activities as List<Fragment$TimesheetDetail$activities>),
      ));
  TRes activities(
          Iterable<Fragment$TimesheetDetail$activities> Function(
                  Iterable<
                      CopyWith$Fragment$TimesheetDetail$activities<
                          Fragment$TimesheetDetail$activities>>)
              _fn) =>
      call(
          activities: _fn(_instance.activities
              .map((e) => CopyWith$Fragment$TimesheetDetail$activities(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Fragment$TimesheetDetail<TRes>
    implements CopyWith$Fragment$TimesheetDetail<TRes> {
  _CopyWithStubImpl$Fragment$TimesheetDetail(this._res);

  TRes _res;

  call({
    String? id,
    String? month,
    Enum$TimesheetStatusEnum? status,
    int? totalTime,
    String? $__typename,
    List<Fragment$TimesheetDetail$activities>? activities,
  }) =>
      _res;
  activities(_fn) => _res;
}

const fragmentDefinitionTimesheetDetail = FragmentDefinitionNode(
  name: NameNode(value: 'TimesheetDetail'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Timesheet'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FragmentSpreadNode(
      name: NameNode(value: 'TimesheetListItem'),
      directives: [],
    ),
    FieldNode(
      name: NameNode(value: 'activities'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
          name: NameNode(value: 'id'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'customer'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FieldNode(
              name: NameNode(value: 'id'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'name'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'color'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: '__typename'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
          ]),
        ),
        FieldNode(
          name: NameNode(value: 'project'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FieldNode(
              name: NameNode(value: 'id'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'name'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'color'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'tag'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: '__typename'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
          ]),
        ),
        FieldNode(
          name: NameNode(value: 'description'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'startTime'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'endTime'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'isActive'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
      ]),
    ),
    FieldNode(
      name: NameNode(value: '__typename'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
  ]),
);
const documentNodeFragmentTimesheetDetail = DocumentNode(definitions: [
  fragmentDefinitionTimesheetDetail,
  fragmentDefinitionTimesheetListItem,
]);

extension ClientExtension$Fragment$TimesheetDetail on graphql.GraphQLClient {
  void writeFragment$TimesheetDetail({
    required Fragment$TimesheetDetail data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'TimesheetDetail',
            document: documentNodeFragmentTimesheetDetail,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$TimesheetDetail? readFragment$TimesheetDetail({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'TimesheetDetail',
          document: documentNodeFragmentTimesheetDetail,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$TimesheetDetail.fromJson(result);
  }
}

class Fragment$TimesheetDetail$activities {
  Fragment$TimesheetDetail$activities({
    required this.id,
    this.customer,
    this.project,
    this.description,
    required this.startTime,
    this.endTime,
    this.isActive,
    this.$__typename = 'Activity',
  });

  factory Fragment$TimesheetDetail$activities.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$customer = json['customer'];
    final l$project = json['project'];
    final l$description = json['description'];
    final l$startTime = json['startTime'];
    final l$endTime = json['endTime'];
    final l$isActive = json['isActive'];
    final l$$__typename = json['__typename'];
    return Fragment$TimesheetDetail$activities(
      id: (l$id as String),
      customer: l$customer == null
          ? null
          : Fragment$TimesheetDetail$activities$customer.fromJson(
              (l$customer as Map<String, dynamic>)),
      project: l$project == null
          ? null
          : Fragment$TimesheetDetail$activities$project.fromJson(
              (l$project as Map<String, dynamic>)),
      description: (l$description as String?),
      startTime: (l$startTime as num).toDouble(),
      endTime: (l$endTime as num?)?.toDouble(),
      isActive: (l$isActive as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Fragment$TimesheetDetail$activities$customer? customer;

  final Fragment$TimesheetDetail$activities$project? project;

  final String? description;

  final double startTime;

  final double? endTime;

  final bool? isActive;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$customer = customer;
    _resultData['customer'] = l$customer?.toJson();
    final l$project = project;
    _resultData['project'] = l$project?.toJson();
    final l$description = description;
    _resultData['description'] = l$description;
    final l$startTime = startTime;
    _resultData['startTime'] = l$startTime;
    final l$endTime = endTime;
    _resultData['endTime'] = l$endTime;
    final l$isActive = isActive;
    _resultData['isActive'] = l$isActive;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$customer = customer;
    final l$project = project;
    final l$description = description;
    final l$startTime = startTime;
    final l$endTime = endTime;
    final l$isActive = isActive;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$customer,
      l$project,
      l$description,
      l$startTime,
      l$endTime,
      l$isActive,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$TimesheetDetail$activities) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
      return false;
    }
    final l$project = project;
    final lOther$project = other.project;
    if (l$project != lOther$project) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$startTime = startTime;
    final lOther$startTime = other.startTime;
    if (l$startTime != lOther$startTime) {
      return false;
    }
    final l$endTime = endTime;
    final lOther$endTime = other.endTime;
    if (l$endTime != lOther$endTime) {
      return false;
    }
    final l$isActive = isActive;
    final lOther$isActive = other.isActive;
    if (l$isActive != lOther$isActive) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$TimesheetDetail$activities
    on Fragment$TimesheetDetail$activities {
  CopyWith$Fragment$TimesheetDetail$activities<
          Fragment$TimesheetDetail$activities>
      get copyWith => CopyWith$Fragment$TimesheetDetail$activities(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$TimesheetDetail$activities<TRes> {
  factory CopyWith$Fragment$TimesheetDetail$activities(
    Fragment$TimesheetDetail$activities instance,
    TRes Function(Fragment$TimesheetDetail$activities) then,
  ) = _CopyWithImpl$Fragment$TimesheetDetail$activities;

  factory CopyWith$Fragment$TimesheetDetail$activities.stub(TRes res) =
      _CopyWithStubImpl$Fragment$TimesheetDetail$activities;

  TRes call({
    String? id,
    Fragment$TimesheetDetail$activities$customer? customer,
    Fragment$TimesheetDetail$activities$project? project,
    String? description,
    double? startTime,
    double? endTime,
    bool? isActive,
    String? $__typename,
  });
  CopyWith$Fragment$TimesheetDetail$activities$customer<TRes> get customer;
  CopyWith$Fragment$TimesheetDetail$activities$project<TRes> get project;
}

class _CopyWithImpl$Fragment$TimesheetDetail$activities<TRes>
    implements CopyWith$Fragment$TimesheetDetail$activities<TRes> {
  _CopyWithImpl$Fragment$TimesheetDetail$activities(
    this._instance,
    this._then,
  );

  final Fragment$TimesheetDetail$activities _instance;

  final TRes Function(Fragment$TimesheetDetail$activities) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? customer = _undefined,
    Object? project = _undefined,
    Object? description = _undefined,
    Object? startTime = _undefined,
    Object? endTime = _undefined,
    Object? isActive = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$TimesheetDetail$activities(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        customer: customer == _undefined
            ? _instance.customer
            : (customer as Fragment$TimesheetDetail$activities$customer?),
        project: project == _undefined
            ? _instance.project
            : (project as Fragment$TimesheetDetail$activities$project?),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        startTime: startTime == _undefined || startTime == null
            ? _instance.startTime
            : (startTime as double),
        endTime:
            endTime == _undefined ? _instance.endTime : (endTime as double?),
        isActive:
            isActive == _undefined ? _instance.isActive : (isActive as bool?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$TimesheetDetail$activities$customer<TRes> get customer {
    final local$customer = _instance.customer;
    return local$customer == null
        ? CopyWith$Fragment$TimesheetDetail$activities$customer.stub(
            _then(_instance))
        : CopyWith$Fragment$TimesheetDetail$activities$customer(
            local$customer, (e) => call(customer: e));
  }

  CopyWith$Fragment$TimesheetDetail$activities$project<TRes> get project {
    final local$project = _instance.project;
    return local$project == null
        ? CopyWith$Fragment$TimesheetDetail$activities$project.stub(
            _then(_instance))
        : CopyWith$Fragment$TimesheetDetail$activities$project(
            local$project, (e) => call(project: e));
  }
}

class _CopyWithStubImpl$Fragment$TimesheetDetail$activities<TRes>
    implements CopyWith$Fragment$TimesheetDetail$activities<TRes> {
  _CopyWithStubImpl$Fragment$TimesheetDetail$activities(this._res);

  TRes _res;

  call({
    String? id,
    Fragment$TimesheetDetail$activities$customer? customer,
    Fragment$TimesheetDetail$activities$project? project,
    String? description,
    double? startTime,
    double? endTime,
    bool? isActive,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$TimesheetDetail$activities$customer<TRes> get customer =>
      CopyWith$Fragment$TimesheetDetail$activities$customer.stub(_res);
  CopyWith$Fragment$TimesheetDetail$activities$project<TRes> get project =>
      CopyWith$Fragment$TimesheetDetail$activities$project.stub(_res);
}

class Fragment$TimesheetDetail$activities$customer {
  Fragment$TimesheetDetail$activities$customer({
    required this.id,
    required this.name,
    this.color,
    this.$__typename = 'Customer',
  });

  factory Fragment$TimesheetDetail$activities$customer.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$color = json['color'];
    final l$$__typename = json['__typename'];
    return Fragment$TimesheetDetail$activities$customer(
      id: (l$id as String),
      name: (l$name as String),
      color: (l$color as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String? color;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$color = color;
    _resultData['color'] = l$color;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$color = color;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$color,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$TimesheetDetail$activities$customer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$color = color;
    final lOther$color = other.color;
    if (l$color != lOther$color) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$TimesheetDetail$activities$customer
    on Fragment$TimesheetDetail$activities$customer {
  CopyWith$Fragment$TimesheetDetail$activities$customer<
          Fragment$TimesheetDetail$activities$customer>
      get copyWith => CopyWith$Fragment$TimesheetDetail$activities$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$TimesheetDetail$activities$customer<TRes> {
  factory CopyWith$Fragment$TimesheetDetail$activities$customer(
    Fragment$TimesheetDetail$activities$customer instance,
    TRes Function(Fragment$TimesheetDetail$activities$customer) then,
  ) = _CopyWithImpl$Fragment$TimesheetDetail$activities$customer;

  factory CopyWith$Fragment$TimesheetDetail$activities$customer.stub(TRes res) =
      _CopyWithStubImpl$Fragment$TimesheetDetail$activities$customer;

  TRes call({
    String? id,
    String? name,
    String? color,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$TimesheetDetail$activities$customer<TRes>
    implements CopyWith$Fragment$TimesheetDetail$activities$customer<TRes> {
  _CopyWithImpl$Fragment$TimesheetDetail$activities$customer(
    this._instance,
    this._then,
  );

  final Fragment$TimesheetDetail$activities$customer _instance;

  final TRes Function(Fragment$TimesheetDetail$activities$customer) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? color = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$TimesheetDetail$activities$customer(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        color: color == _undefined ? _instance.color : (color as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$TimesheetDetail$activities$customer<TRes>
    implements CopyWith$Fragment$TimesheetDetail$activities$customer<TRes> {
  _CopyWithStubImpl$Fragment$TimesheetDetail$activities$customer(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? color,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$TimesheetDetail$activities$project {
  Fragment$TimesheetDetail$activities$project({
    required this.id,
    required this.name,
    this.color,
    this.tag,
    this.$__typename = 'Project',
  });

  factory Fragment$TimesheetDetail$activities$project.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$color = json['color'];
    final l$tag = json['tag'];
    final l$$__typename = json['__typename'];
    return Fragment$TimesheetDetail$activities$project(
      id: (l$id as String),
      name: (l$name as String),
      color: (l$color as String?),
      tag: (l$tag as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String? color;

  final String? tag;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$color = color;
    _resultData['color'] = l$color;
    final l$tag = tag;
    _resultData['tag'] = l$tag;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$color = color;
    final l$tag = tag;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$color,
      l$tag,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$TimesheetDetail$activities$project) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$color = color;
    final lOther$color = other.color;
    if (l$color != lOther$color) {
      return false;
    }
    final l$tag = tag;
    final lOther$tag = other.tag;
    if (l$tag != lOther$tag) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$TimesheetDetail$activities$project
    on Fragment$TimesheetDetail$activities$project {
  CopyWith$Fragment$TimesheetDetail$activities$project<
          Fragment$TimesheetDetail$activities$project>
      get copyWith => CopyWith$Fragment$TimesheetDetail$activities$project(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$TimesheetDetail$activities$project<TRes> {
  factory CopyWith$Fragment$TimesheetDetail$activities$project(
    Fragment$TimesheetDetail$activities$project instance,
    TRes Function(Fragment$TimesheetDetail$activities$project) then,
  ) = _CopyWithImpl$Fragment$TimesheetDetail$activities$project;

  factory CopyWith$Fragment$TimesheetDetail$activities$project.stub(TRes res) =
      _CopyWithStubImpl$Fragment$TimesheetDetail$activities$project;

  TRes call({
    String? id,
    String? name,
    String? color,
    String? tag,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$TimesheetDetail$activities$project<TRes>
    implements CopyWith$Fragment$TimesheetDetail$activities$project<TRes> {
  _CopyWithImpl$Fragment$TimesheetDetail$activities$project(
    this._instance,
    this._then,
  );

  final Fragment$TimesheetDetail$activities$project _instance;

  final TRes Function(Fragment$TimesheetDetail$activities$project) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? color = _undefined,
    Object? tag = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$TimesheetDetail$activities$project(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        color: color == _undefined ? _instance.color : (color as String?),
        tag: tag == _undefined ? _instance.tag : (tag as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$TimesheetDetail$activities$project<TRes>
    implements CopyWith$Fragment$TimesheetDetail$activities$project<TRes> {
  _CopyWithStubImpl$Fragment$TimesheetDetail$activities$project(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? color,
    String? tag,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$Timesheets {
  factory Variables$Query$Timesheets({
    required int pageIndex,
    required int pageSize,
    Input$TimesheetFilter? filter,
  }) =>
      Variables$Query$Timesheets._({
        r'pageIndex': pageIndex,
        r'pageSize': pageSize,
        if (filter != null) r'filter': filter,
      });

  Variables$Query$Timesheets._(this._$data);

  factory Variables$Query$Timesheets.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$pageIndex = data['pageIndex'];
    result$data['pageIndex'] = (l$pageIndex as int);
    final l$pageSize = data['pageSize'];
    result$data['pageSize'] = (l$pageSize as int);
    if (data.containsKey('filter')) {
      final l$filter = data['filter'];
      result$data['filter'] = l$filter == null
          ? null
          : Input$TimesheetFilter.fromJson((l$filter as Map<String, dynamic>));
    }
    return Variables$Query$Timesheets._(result$data);
  }

  Map<String, dynamic> _$data;

  int get pageIndex => (_$data['pageIndex'] as int);
  int get pageSize => (_$data['pageSize'] as int);
  Input$TimesheetFilter? get filter =>
      (_$data['filter'] as Input$TimesheetFilter?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$pageIndex = pageIndex;
    result$data['pageIndex'] = l$pageIndex;
    final l$pageSize = pageSize;
    result$data['pageSize'] = l$pageSize;
    if (_$data.containsKey('filter')) {
      final l$filter = filter;
      result$data['filter'] = l$filter?.toJson();
    }
    return result$data;
  }

  CopyWith$Variables$Query$Timesheets<Variables$Query$Timesheets>
      get copyWith => CopyWith$Variables$Query$Timesheets(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$Timesheets) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$pageIndex = pageIndex;
    final lOther$pageIndex = other.pageIndex;
    if (l$pageIndex != lOther$pageIndex) {
      return false;
    }
    final l$pageSize = pageSize;
    final lOther$pageSize = other.pageSize;
    if (l$pageSize != lOther$pageSize) {
      return false;
    }
    final l$filter = filter;
    final lOther$filter = other.filter;
    if (_$data.containsKey('filter') != other._$data.containsKey('filter')) {
      return false;
    }
    if (l$filter != lOther$filter) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$pageIndex = pageIndex;
    final l$pageSize = pageSize;
    final l$filter = filter;
    return Object.hashAll([
      l$pageIndex,
      l$pageSize,
      _$data.containsKey('filter') ? l$filter : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$Timesheets<TRes> {
  factory CopyWith$Variables$Query$Timesheets(
    Variables$Query$Timesheets instance,
    TRes Function(Variables$Query$Timesheets) then,
  ) = _CopyWithImpl$Variables$Query$Timesheets;

  factory CopyWith$Variables$Query$Timesheets.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$Timesheets;

  TRes call({
    int? pageIndex,
    int? pageSize,
    Input$TimesheetFilter? filter,
  });
}

class _CopyWithImpl$Variables$Query$Timesheets<TRes>
    implements CopyWith$Variables$Query$Timesheets<TRes> {
  _CopyWithImpl$Variables$Query$Timesheets(
    this._instance,
    this._then,
  );

  final Variables$Query$Timesheets _instance;

  final TRes Function(Variables$Query$Timesheets) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? pageIndex = _undefined,
    Object? pageSize = _undefined,
    Object? filter = _undefined,
  }) =>
      _then(Variables$Query$Timesheets._({
        ..._instance._$data,
        if (pageIndex != _undefined && pageIndex != null)
          'pageIndex': (pageIndex as int),
        if (pageSize != _undefined && pageSize != null)
          'pageSize': (pageSize as int),
        if (filter != _undefined) 'filter': (filter as Input$TimesheetFilter?),
      }));
}

class _CopyWithStubImpl$Variables$Query$Timesheets<TRes>
    implements CopyWith$Variables$Query$Timesheets<TRes> {
  _CopyWithStubImpl$Variables$Query$Timesheets(this._res);

  TRes _res;

  call({
    int? pageIndex,
    int? pageSize,
    Input$TimesheetFilter? filter,
  }) =>
      _res;
}

class Query$Timesheets {
  Query$Timesheets({
    required this.timesheets,
    this.$__typename = 'Query',
  });

  factory Query$Timesheets.fromJson(Map<String, dynamic> json) {
    final l$timesheets = json['timesheets'];
    final l$$__typename = json['__typename'];
    return Query$Timesheets(
      timesheets: Query$Timesheets$timesheets.fromJson(
          (l$timesheets as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Timesheets$timesheets timesheets;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$timesheets = timesheets;
    _resultData['timesheets'] = l$timesheets.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$timesheets = timesheets;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$timesheets,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Timesheets) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$timesheets = timesheets;
    final lOther$timesheets = other.timesheets;
    if (l$timesheets != lOther$timesheets) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$Timesheets on Query$Timesheets {
  CopyWith$Query$Timesheets<Query$Timesheets> get copyWith =>
      CopyWith$Query$Timesheets(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Timesheets<TRes> {
  factory CopyWith$Query$Timesheets(
    Query$Timesheets instance,
    TRes Function(Query$Timesheets) then,
  ) = _CopyWithImpl$Query$Timesheets;

  factory CopyWith$Query$Timesheets.stub(TRes res) =
      _CopyWithStubImpl$Query$Timesheets;

  TRes call({
    Query$Timesheets$timesheets? timesheets,
    String? $__typename,
  });
  CopyWith$Query$Timesheets$timesheets<TRes> get timesheets;
}

class _CopyWithImpl$Query$Timesheets<TRes>
    implements CopyWith$Query$Timesheets<TRes> {
  _CopyWithImpl$Query$Timesheets(
    this._instance,
    this._then,
  );

  final Query$Timesheets _instance;

  final TRes Function(Query$Timesheets) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? timesheets = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Timesheets(
        timesheets: timesheets == _undefined || timesheets == null
            ? _instance.timesheets
            : (timesheets as Query$Timesheets$timesheets),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$Timesheets$timesheets<TRes> get timesheets {
    final local$timesheets = _instance.timesheets;
    return CopyWith$Query$Timesheets$timesheets(
        local$timesheets, (e) => call(timesheets: e));
  }
}

class _CopyWithStubImpl$Query$Timesheets<TRes>
    implements CopyWith$Query$Timesheets<TRes> {
  _CopyWithStubImpl$Query$Timesheets(this._res);

  TRes _res;

  call({
    Query$Timesheets$timesheets? timesheets,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$Timesheets$timesheets<TRes> get timesheets =>
      CopyWith$Query$Timesheets$timesheets.stub(_res);
}

const documentNodeQueryTimesheets = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'Timesheets'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'pageIndex')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'pageSize')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'filter')),
        type: NamedTypeNode(
          name: NameNode(value: 'TimesheetFilter'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'timesheets'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'pageIndex'),
            value: VariableNode(name: NameNode(value: 'pageIndex')),
          ),
          ArgumentNode(
            name: NameNode(value: 'pageSize'),
            value: VariableNode(name: NameNode(value: 'pageSize')),
          ),
          ArgumentNode(
            name: NameNode(value: 'filter'),
            value: VariableNode(name: NameNode(value: 'filter')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'data'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'TimesheetListItem'),
                directives: [],
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  fragmentDefinitionTimesheetListItem,
]);
Query$Timesheets _parserFn$Query$Timesheets(Map<String, dynamic> data) =>
    Query$Timesheets.fromJson(data);
typedef OnQueryComplete$Query$Timesheets = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$Timesheets?,
);

class Options$Query$Timesheets extends graphql.QueryOptions<Query$Timesheets> {
  Options$Query$Timesheets({
    String? operationName,
    required Variables$Query$Timesheets variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Timesheets? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$Timesheets? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$Timesheets(data),
                  ),
          onError: onError,
          document: documentNodeQueryTimesheets,
          parserFn: _parserFn$Query$Timesheets,
        );

  final OnQueryComplete$Query$Timesheets? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$Timesheets
    extends graphql.WatchQueryOptions<Query$Timesheets> {
  WatchOptions$Query$Timesheets({
    String? operationName,
    required Variables$Query$Timesheets variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Timesheets? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryTimesheets,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$Timesheets,
        );
}

class FetchMoreOptions$Query$Timesheets extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Timesheets({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$Timesheets variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryTimesheets,
        );
}

extension ClientExtension$Query$Timesheets on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Timesheets>> query$Timesheets(
          Options$Query$Timesheets options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$Timesheets> watchQuery$Timesheets(
          WatchOptions$Query$Timesheets options) =>
      this.watchQuery(options);
  void writeQuery$Timesheets({
    required Query$Timesheets data,
    required Variables$Query$Timesheets variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryTimesheets),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$Timesheets? readQuery$Timesheets({
    required Variables$Query$Timesheets variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryTimesheets),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$Timesheets.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$Timesheets> useQuery$Timesheets(
        Options$Query$Timesheets options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$Timesheets> useWatchQuery$Timesheets(
        WatchOptions$Query$Timesheets options) =>
    graphql_flutter.useWatchQuery(options);

class Query$Timesheets$Widget extends graphql_flutter.Query<Query$Timesheets> {
  Query$Timesheets$Widget({
    widgets.Key? key,
    required Options$Query$Timesheets options,
    required graphql_flutter.QueryBuilder<Query$Timesheets> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$Timesheets$timesheets {
  Query$Timesheets$timesheets({
    required this.data,
    this.$__typename = 'TimesheetPagination',
  });

  factory Query$Timesheets$timesheets.fromJson(Map<String, dynamic> json) {
    final l$data = json['data'];
    final l$$__typename = json['__typename'];
    return Query$Timesheets$timesheets(
      data: (l$data as List<dynamic>)
          .map((e) =>
              Fragment$TimesheetListItem.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$TimesheetListItem> data;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$data = data;
    _resultData['data'] = l$data.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$data = data;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$data.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Timesheets$timesheets) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$data = data;
    final lOther$data = other.data;
    if (l$data.length != lOther$data.length) {
      return false;
    }
    for (int i = 0; i < l$data.length; i++) {
      final l$data$entry = l$data[i];
      final lOther$data$entry = lOther$data[i];
      if (l$data$entry != lOther$data$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$Timesheets$timesheets
    on Query$Timesheets$timesheets {
  CopyWith$Query$Timesheets$timesheets<Query$Timesheets$timesheets>
      get copyWith => CopyWith$Query$Timesheets$timesheets(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Timesheets$timesheets<TRes> {
  factory CopyWith$Query$Timesheets$timesheets(
    Query$Timesheets$timesheets instance,
    TRes Function(Query$Timesheets$timesheets) then,
  ) = _CopyWithImpl$Query$Timesheets$timesheets;

  factory CopyWith$Query$Timesheets$timesheets.stub(TRes res) =
      _CopyWithStubImpl$Query$Timesheets$timesheets;

  TRes call({
    List<Fragment$TimesheetListItem>? data,
    String? $__typename,
  });
  TRes data(
      Iterable<Fragment$TimesheetListItem> Function(
              Iterable<
                  CopyWith$Fragment$TimesheetListItem<
                      Fragment$TimesheetListItem>>)
          _fn);
}

class _CopyWithImpl$Query$Timesheets$timesheets<TRes>
    implements CopyWith$Query$Timesheets$timesheets<TRes> {
  _CopyWithImpl$Query$Timesheets$timesheets(
    this._instance,
    this._then,
  );

  final Query$Timesheets$timesheets _instance;

  final TRes Function(Query$Timesheets$timesheets) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? data = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Timesheets$timesheets(
        data: data == _undefined || data == null
            ? _instance.data
            : (data as List<Fragment$TimesheetListItem>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes data(
          Iterable<Fragment$TimesheetListItem> Function(
                  Iterable<
                      CopyWith$Fragment$TimesheetListItem<
                          Fragment$TimesheetListItem>>)
              _fn) =>
      call(
          data:
              _fn(_instance.data.map((e) => CopyWith$Fragment$TimesheetListItem(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$Timesheets$timesheets<TRes>
    implements CopyWith$Query$Timesheets$timesheets<TRes> {
  _CopyWithStubImpl$Query$Timesheets$timesheets(this._res);

  TRes _res;

  call({
    List<Fragment$TimesheetListItem>? data,
    String? $__typename,
  }) =>
      _res;
  data(_fn) => _res;
}

class Variables$Query$Timesheet {
  factory Variables$Query$Timesheet({
    String? id,
    String? month,
    List<String>? activityIds,
  }) =>
      Variables$Query$Timesheet._({
        if (id != null) r'id': id,
        if (month != null) r'month': month,
        if (activityIds != null) r'activityIds': activityIds,
      });

  Variables$Query$Timesheet._(this._$data);

  factory Variables$Query$Timesheet.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('id')) {
      final l$id = data['id'];
      result$data['id'] = (l$id as String?);
    }
    if (data.containsKey('month')) {
      final l$month = data['month'];
      result$data['month'] = (l$month as String?);
    }
    if (data.containsKey('activityIds')) {
      final l$activityIds = data['activityIds'];
      result$data['activityIds'] =
          (l$activityIds as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    return Variables$Query$Timesheet._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get id => (_$data['id'] as String?);
  String? get month => (_$data['month'] as String?);
  List<String>? get activityIds => (_$data['activityIds'] as List<String>?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('id')) {
      final l$id = id;
      result$data['id'] = l$id;
    }
    if (_$data.containsKey('month')) {
      final l$month = month;
      result$data['month'] = l$month;
    }
    if (_$data.containsKey('activityIds')) {
      final l$activityIds = activityIds;
      result$data['activityIds'] = l$activityIds?.map((e) => e).toList();
    }
    return result$data;
  }

  CopyWith$Variables$Query$Timesheet<Variables$Query$Timesheet> get copyWith =>
      CopyWith$Variables$Query$Timesheet(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$Timesheet) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (_$data.containsKey('id') != other._$data.containsKey('id')) {
      return false;
    }
    if (l$id != lOther$id) {
      return false;
    }
    final l$month = month;
    final lOther$month = other.month;
    if (_$data.containsKey('month') != other._$data.containsKey('month')) {
      return false;
    }
    if (l$month != lOther$month) {
      return false;
    }
    final l$activityIds = activityIds;
    final lOther$activityIds = other.activityIds;
    if (_$data.containsKey('activityIds') !=
        other._$data.containsKey('activityIds')) {
      return false;
    }
    if (l$activityIds != null && lOther$activityIds != null) {
      if (l$activityIds.length != lOther$activityIds.length) {
        return false;
      }
      for (int i = 0; i < l$activityIds.length; i++) {
        final l$activityIds$entry = l$activityIds[i];
        final lOther$activityIds$entry = lOther$activityIds[i];
        if (l$activityIds$entry != lOther$activityIds$entry) {
          return false;
        }
      }
    } else if (l$activityIds != lOther$activityIds) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$month = month;
    final l$activityIds = activityIds;
    return Object.hashAll([
      _$data.containsKey('id') ? l$id : const {},
      _$data.containsKey('month') ? l$month : const {},
      _$data.containsKey('activityIds')
          ? l$activityIds == null
              ? null
              : Object.hashAll(l$activityIds.map((v) => v))
          : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$Timesheet<TRes> {
  factory CopyWith$Variables$Query$Timesheet(
    Variables$Query$Timesheet instance,
    TRes Function(Variables$Query$Timesheet) then,
  ) = _CopyWithImpl$Variables$Query$Timesheet;

  factory CopyWith$Variables$Query$Timesheet.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$Timesheet;

  TRes call({
    String? id,
    String? month,
    List<String>? activityIds,
  });
}

class _CopyWithImpl$Variables$Query$Timesheet<TRes>
    implements CopyWith$Variables$Query$Timesheet<TRes> {
  _CopyWithImpl$Variables$Query$Timesheet(
    this._instance,
    this._then,
  );

  final Variables$Query$Timesheet _instance;

  final TRes Function(Variables$Query$Timesheet) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? month = _undefined,
    Object? activityIds = _undefined,
  }) =>
      _then(Variables$Query$Timesheet._({
        ..._instance._$data,
        if (id != _undefined) 'id': (id as String?),
        if (month != _undefined) 'month': (month as String?),
        if (activityIds != _undefined)
          'activityIds': (activityIds as List<String>?),
      }));
}

class _CopyWithStubImpl$Variables$Query$Timesheet<TRes>
    implements CopyWith$Variables$Query$Timesheet<TRes> {
  _CopyWithStubImpl$Variables$Query$Timesheet(this._res);

  TRes _res;

  call({
    String? id,
    String? month,
    List<String>? activityIds,
  }) =>
      _res;
}

class Query$Timesheet {
  Query$Timesheet({
    required this.timesheet,
    this.$__typename = 'Query',
  });

  factory Query$Timesheet.fromJson(Map<String, dynamic> json) {
    final l$timesheet = json['timesheet'];
    final l$$__typename = json['__typename'];
    return Query$Timesheet(
      timesheet: Fragment$TimesheetDetail.fromJson(
          (l$timesheet as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$TimesheetDetail timesheet;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$timesheet = timesheet;
    _resultData['timesheet'] = l$timesheet.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$timesheet = timesheet;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$timesheet,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Timesheet) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$timesheet = timesheet;
    final lOther$timesheet = other.timesheet;
    if (l$timesheet != lOther$timesheet) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$Timesheet on Query$Timesheet {
  CopyWith$Query$Timesheet<Query$Timesheet> get copyWith =>
      CopyWith$Query$Timesheet(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Timesheet<TRes> {
  factory CopyWith$Query$Timesheet(
    Query$Timesheet instance,
    TRes Function(Query$Timesheet) then,
  ) = _CopyWithImpl$Query$Timesheet;

  factory CopyWith$Query$Timesheet.stub(TRes res) =
      _CopyWithStubImpl$Query$Timesheet;

  TRes call({
    Fragment$TimesheetDetail? timesheet,
    String? $__typename,
  });
  CopyWith$Fragment$TimesheetDetail<TRes> get timesheet;
}

class _CopyWithImpl$Query$Timesheet<TRes>
    implements CopyWith$Query$Timesheet<TRes> {
  _CopyWithImpl$Query$Timesheet(
    this._instance,
    this._then,
  );

  final Query$Timesheet _instance;

  final TRes Function(Query$Timesheet) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? timesheet = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Timesheet(
        timesheet: timesheet == _undefined || timesheet == null
            ? _instance.timesheet
            : (timesheet as Fragment$TimesheetDetail),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$TimesheetDetail<TRes> get timesheet {
    final local$timesheet = _instance.timesheet;
    return CopyWith$Fragment$TimesheetDetail(
        local$timesheet, (e) => call(timesheet: e));
  }
}

class _CopyWithStubImpl$Query$Timesheet<TRes>
    implements CopyWith$Query$Timesheet<TRes> {
  _CopyWithStubImpl$Query$Timesheet(this._res);

  TRes _res;

  call({
    Fragment$TimesheetDetail? timesheet,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$TimesheetDetail<TRes> get timesheet =>
      CopyWith$Fragment$TimesheetDetail.stub(_res);
}

const documentNodeQueryTimesheet = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'Timesheet'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'month')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'activityIds')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'ID'),
            isNonNull: true,
          ),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'timesheet'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          ),
          ArgumentNode(
            name: NameNode(value: 'month'),
            value: VariableNode(name: NameNode(value: 'month')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'TimesheetDetail'),
            directives: [],
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  fragmentDefinitionTimesheetDetail,
  fragmentDefinitionTimesheetListItem,
]);
Query$Timesheet _parserFn$Query$Timesheet(Map<String, dynamic> data) =>
    Query$Timesheet.fromJson(data);
typedef OnQueryComplete$Query$Timesheet = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$Timesheet?,
);

class Options$Query$Timesheet extends graphql.QueryOptions<Query$Timesheet> {
  Options$Query$Timesheet({
    String? operationName,
    Variables$Query$Timesheet? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Timesheet? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$Timesheet? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$Timesheet(data),
                  ),
          onError: onError,
          document: documentNodeQueryTimesheet,
          parserFn: _parserFn$Query$Timesheet,
        );

  final OnQueryComplete$Query$Timesheet? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$Timesheet
    extends graphql.WatchQueryOptions<Query$Timesheet> {
  WatchOptions$Query$Timesheet({
    String? operationName,
    Variables$Query$Timesheet? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Timesheet? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryTimesheet,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$Timesheet,
        );
}

class FetchMoreOptions$Query$Timesheet extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Timesheet({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$Timesheet? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQueryTimesheet,
        );
}

extension ClientExtension$Query$Timesheet on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Timesheet>> query$Timesheet(
          [Options$Query$Timesheet? options]) async =>
      await this.query(options ?? Options$Query$Timesheet());
  graphql.ObservableQuery<Query$Timesheet> watchQuery$Timesheet(
          [WatchOptions$Query$Timesheet? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$Timesheet());
  void writeQuery$Timesheet({
    required Query$Timesheet data,
    Variables$Query$Timesheet? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryTimesheet),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$Timesheet? readQuery$Timesheet({
    Variables$Query$Timesheet? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryTimesheet),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$Timesheet.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$Timesheet> useQuery$Timesheet(
        [Options$Query$Timesheet? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$Timesheet());
graphql.ObservableQuery<Query$Timesheet> useWatchQuery$Timesheet(
        [WatchOptions$Query$Timesheet? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$Timesheet());

class Query$Timesheet$Widget extends graphql_flutter.Query<Query$Timesheet> {
  Query$Timesheet$Widget({
    widgets.Key? key,
    Options$Query$Timesheet? options,
    required graphql_flutter.QueryBuilder<Query$Timesheet> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$Timesheet(),
          builder: builder,
        );
}
