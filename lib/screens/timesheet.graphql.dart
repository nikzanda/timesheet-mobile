// ignore_for_file: type=lint
import '../schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

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
          .map((e) => Query$Timesheets$timesheets$data.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$Timesheets$timesheets$data> data;

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
    List<Query$Timesheets$timesheets$data>? data,
    String? $__typename,
  });
  TRes data(
      Iterable<Query$Timesheets$timesheets$data> Function(
              Iterable<
                  CopyWith$Query$Timesheets$timesheets$data<
                      Query$Timesheets$timesheets$data>>)
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
            : (data as List<Query$Timesheets$timesheets$data>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes data(
          Iterable<Query$Timesheets$timesheets$data> Function(
                  Iterable<
                      CopyWith$Query$Timesheets$timesheets$data<
                          Query$Timesheets$timesheets$data>>)
              _fn) =>
      call(
          data: _fn(_instance.data
              .map((e) => CopyWith$Query$Timesheets$timesheets$data(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$Timesheets$timesheets<TRes>
    implements CopyWith$Query$Timesheets$timesheets<TRes> {
  _CopyWithStubImpl$Query$Timesheets$timesheets(this._res);

  TRes _res;

  call({
    List<Query$Timesheets$timesheets$data>? data,
    String? $__typename,
  }) =>
      _res;
  data(_fn) => _res;
}

class Query$Timesheets$timesheets$data {
  Query$Timesheets$timesheets$data({
    required this.id,
    required this.month,
    required this.status,
    required this.totalTime,
    this.$__typename = 'Timesheet',
  });

  factory Query$Timesheets$timesheets$data.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$month = json['month'];
    final l$status = json['status'];
    final l$totalTime = json['totalTime'];
    final l$$__typename = json['__typename'];
    return Query$Timesheets$timesheets$data(
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
    if (!(other is Query$Timesheets$timesheets$data) ||
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

extension UtilityExtension$Query$Timesheets$timesheets$data
    on Query$Timesheets$timesheets$data {
  CopyWith$Query$Timesheets$timesheets$data<Query$Timesheets$timesheets$data>
      get copyWith => CopyWith$Query$Timesheets$timesheets$data(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Timesheets$timesheets$data<TRes> {
  factory CopyWith$Query$Timesheets$timesheets$data(
    Query$Timesheets$timesheets$data instance,
    TRes Function(Query$Timesheets$timesheets$data) then,
  ) = _CopyWithImpl$Query$Timesheets$timesheets$data;

  factory CopyWith$Query$Timesheets$timesheets$data.stub(TRes res) =
      _CopyWithStubImpl$Query$Timesheets$timesheets$data;

  TRes call({
    String? id,
    String? month,
    Enum$TimesheetStatusEnum? status,
    int? totalTime,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Timesheets$timesheets$data<TRes>
    implements CopyWith$Query$Timesheets$timesheets$data<TRes> {
  _CopyWithImpl$Query$Timesheets$timesheets$data(
    this._instance,
    this._then,
  );

  final Query$Timesheets$timesheets$data _instance;

  final TRes Function(Query$Timesheets$timesheets$data) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? month = _undefined,
    Object? status = _undefined,
    Object? totalTime = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Timesheets$timesheets$data(
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

class _CopyWithStubImpl$Query$Timesheets$timesheets$data<TRes>
    implements CopyWith$Query$Timesheets$timesheets$data<TRes> {
  _CopyWithStubImpl$Query$Timesheets$timesheets$data(this._res);

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
