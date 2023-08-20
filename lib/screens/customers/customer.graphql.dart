// ignore_for_file: type=lint
import '../../schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$CustomerSearcher {
  factory Variables$Query$CustomerSearcher({Input$CustomerFilter? filter}) =>
      Variables$Query$CustomerSearcher._({
        if (filter != null) r'filter': filter,
      });

  Variables$Query$CustomerSearcher._(this._$data);

  factory Variables$Query$CustomerSearcher.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('filter')) {
      final l$filter = data['filter'];
      result$data['filter'] = l$filter == null
          ? null
          : Input$CustomerFilter.fromJson((l$filter as Map<String, dynamic>));
    }
    return Variables$Query$CustomerSearcher._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$CustomerFilter? get filter =>
      (_$data['filter'] as Input$CustomerFilter?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('filter')) {
      final l$filter = filter;
      result$data['filter'] = l$filter?.toJson();
    }
    return result$data;
  }

  CopyWith$Variables$Query$CustomerSearcher<Variables$Query$CustomerSearcher>
      get copyWith => CopyWith$Variables$Query$CustomerSearcher(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$CustomerSearcher) ||
        runtimeType != other.runtimeType) {
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
    final l$filter = filter;
    return Object.hashAll([_$data.containsKey('filter') ? l$filter : const {}]);
  }
}

abstract class CopyWith$Variables$Query$CustomerSearcher<TRes> {
  factory CopyWith$Variables$Query$CustomerSearcher(
    Variables$Query$CustomerSearcher instance,
    TRes Function(Variables$Query$CustomerSearcher) then,
  ) = _CopyWithImpl$Variables$Query$CustomerSearcher;

  factory CopyWith$Variables$Query$CustomerSearcher.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$CustomerSearcher;

  TRes call({Input$CustomerFilter? filter});
}

class _CopyWithImpl$Variables$Query$CustomerSearcher<TRes>
    implements CopyWith$Variables$Query$CustomerSearcher<TRes> {
  _CopyWithImpl$Variables$Query$CustomerSearcher(
    this._instance,
    this._then,
  );

  final Variables$Query$CustomerSearcher _instance;

  final TRes Function(Variables$Query$CustomerSearcher) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? filter = _undefined}) =>
      _then(Variables$Query$CustomerSearcher._({
        ..._instance._$data,
        if (filter != _undefined) 'filter': (filter as Input$CustomerFilter?),
      }));
}

class _CopyWithStubImpl$Variables$Query$CustomerSearcher<TRes>
    implements CopyWith$Variables$Query$CustomerSearcher<TRes> {
  _CopyWithStubImpl$Variables$Query$CustomerSearcher(this._res);

  TRes _res;

  call({Input$CustomerFilter? filter}) => _res;
}

class Query$CustomerSearcher {
  Query$CustomerSearcher({
    required this.customers,
    this.$__typename = 'Query',
  });

  factory Query$CustomerSearcher.fromJson(Map<String, dynamic> json) {
    final l$customers = json['customers'];
    final l$$__typename = json['__typename'];
    return Query$CustomerSearcher(
      customers: Query$CustomerSearcher$customers.fromJson(
          (l$customers as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$CustomerSearcher$customers customers;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$customers = customers;
    _resultData['customers'] = l$customers.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$customers = customers;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$customers,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$CustomerSearcher) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customers = customers;
    final lOther$customers = other.customers;
    if (l$customers != lOther$customers) {
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

extension UtilityExtension$Query$CustomerSearcher on Query$CustomerSearcher {
  CopyWith$Query$CustomerSearcher<Query$CustomerSearcher> get copyWith =>
      CopyWith$Query$CustomerSearcher(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$CustomerSearcher<TRes> {
  factory CopyWith$Query$CustomerSearcher(
    Query$CustomerSearcher instance,
    TRes Function(Query$CustomerSearcher) then,
  ) = _CopyWithImpl$Query$CustomerSearcher;

  factory CopyWith$Query$CustomerSearcher.stub(TRes res) =
      _CopyWithStubImpl$Query$CustomerSearcher;

  TRes call({
    Query$CustomerSearcher$customers? customers,
    String? $__typename,
  });
  CopyWith$Query$CustomerSearcher$customers<TRes> get customers;
}

class _CopyWithImpl$Query$CustomerSearcher<TRes>
    implements CopyWith$Query$CustomerSearcher<TRes> {
  _CopyWithImpl$Query$CustomerSearcher(
    this._instance,
    this._then,
  );

  final Query$CustomerSearcher _instance;

  final TRes Function(Query$CustomerSearcher) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? customers = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$CustomerSearcher(
        customers: customers == _undefined || customers == null
            ? _instance.customers
            : (customers as Query$CustomerSearcher$customers),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$CustomerSearcher$customers<TRes> get customers {
    final local$customers = _instance.customers;
    return CopyWith$Query$CustomerSearcher$customers(
        local$customers, (e) => call(customers: e));
  }
}

class _CopyWithStubImpl$Query$CustomerSearcher<TRes>
    implements CopyWith$Query$CustomerSearcher<TRes> {
  _CopyWithStubImpl$Query$CustomerSearcher(this._res);

  TRes _res;

  call({
    Query$CustomerSearcher$customers? customers,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$CustomerSearcher$customers<TRes> get customers =>
      CopyWith$Query$CustomerSearcher$customers.stub(_res);
}

const documentNodeQueryCustomerSearcher = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'CustomerSearcher'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'filter')),
        type: NamedTypeNode(
          name: NameNode(value: 'CustomerFilter'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'customers'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'pageIndex'),
            value: IntValueNode(value: '0'),
          ),
          ArgumentNode(
            name: NameNode(value: 'pageSize'),
            value: IntValueNode(value: '0'),
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
                name: NameNode(value: 'name'),
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
Query$CustomerSearcher _parserFn$Query$CustomerSearcher(
        Map<String, dynamic> data) =>
    Query$CustomerSearcher.fromJson(data);
typedef OnQueryComplete$Query$CustomerSearcher = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$CustomerSearcher?,
);

class Options$Query$CustomerSearcher
    extends graphql.QueryOptions<Query$CustomerSearcher> {
  Options$Query$CustomerSearcher({
    String? operationName,
    Variables$Query$CustomerSearcher? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$CustomerSearcher? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$CustomerSearcher? onComplete,
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
                    data == null
                        ? null
                        : _parserFn$Query$CustomerSearcher(data),
                  ),
          onError: onError,
          document: documentNodeQueryCustomerSearcher,
          parserFn: _parserFn$Query$CustomerSearcher,
        );

  final OnQueryComplete$Query$CustomerSearcher? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$CustomerSearcher
    extends graphql.WatchQueryOptions<Query$CustomerSearcher> {
  WatchOptions$Query$CustomerSearcher({
    String? operationName,
    Variables$Query$CustomerSearcher? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$CustomerSearcher? typedOptimisticResult,
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
          document: documentNodeQueryCustomerSearcher,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$CustomerSearcher,
        );
}

class FetchMoreOptions$Query$CustomerSearcher extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$CustomerSearcher({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$CustomerSearcher? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQueryCustomerSearcher,
        );
}

extension ClientExtension$Query$CustomerSearcher on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$CustomerSearcher>> query$CustomerSearcher(
          [Options$Query$CustomerSearcher? options]) async =>
      await this.query(options ?? Options$Query$CustomerSearcher());
  graphql.ObservableQuery<Query$CustomerSearcher> watchQuery$CustomerSearcher(
          [WatchOptions$Query$CustomerSearcher? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$CustomerSearcher());
  void writeQuery$CustomerSearcher({
    required Query$CustomerSearcher data,
    Variables$Query$CustomerSearcher? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryCustomerSearcher),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$CustomerSearcher? readQuery$CustomerSearcher({
    Variables$Query$CustomerSearcher? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryCustomerSearcher),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$CustomerSearcher.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$CustomerSearcher>
    useQuery$CustomerSearcher([Options$Query$CustomerSearcher? options]) =>
        graphql_flutter.useQuery(options ?? Options$Query$CustomerSearcher());
graphql.ObservableQuery<Query$CustomerSearcher> useWatchQuery$CustomerSearcher(
        [WatchOptions$Query$CustomerSearcher? options]) =>
    graphql_flutter
        .useWatchQuery(options ?? WatchOptions$Query$CustomerSearcher());

class Query$CustomerSearcher$Widget
    extends graphql_flutter.Query<Query$CustomerSearcher> {
  Query$CustomerSearcher$Widget({
    widgets.Key? key,
    Options$Query$CustomerSearcher? options,
    required graphql_flutter.QueryBuilder<Query$CustomerSearcher> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$CustomerSearcher(),
          builder: builder,
        );
}

class Query$CustomerSearcher$customers {
  Query$CustomerSearcher$customers({
    required this.data,
    this.$__typename = 'CustomerPagination',
  });

  factory Query$CustomerSearcher$customers.fromJson(Map<String, dynamic> json) {
    final l$data = json['data'];
    final l$$__typename = json['__typename'];
    return Query$CustomerSearcher$customers(
      data: (l$data as List<dynamic>)
          .map((e) => Query$CustomerSearcher$customers$data.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$CustomerSearcher$customers$data> data;

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
    if (!(other is Query$CustomerSearcher$customers) ||
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

extension UtilityExtension$Query$CustomerSearcher$customers
    on Query$CustomerSearcher$customers {
  CopyWith$Query$CustomerSearcher$customers<Query$CustomerSearcher$customers>
      get copyWith => CopyWith$Query$CustomerSearcher$customers(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$CustomerSearcher$customers<TRes> {
  factory CopyWith$Query$CustomerSearcher$customers(
    Query$CustomerSearcher$customers instance,
    TRes Function(Query$CustomerSearcher$customers) then,
  ) = _CopyWithImpl$Query$CustomerSearcher$customers;

  factory CopyWith$Query$CustomerSearcher$customers.stub(TRes res) =
      _CopyWithStubImpl$Query$CustomerSearcher$customers;

  TRes call({
    List<Query$CustomerSearcher$customers$data>? data,
    String? $__typename,
  });
  TRes data(
      Iterable<Query$CustomerSearcher$customers$data> Function(
              Iterable<
                  CopyWith$Query$CustomerSearcher$customers$data<
                      Query$CustomerSearcher$customers$data>>)
          _fn);
}

class _CopyWithImpl$Query$CustomerSearcher$customers<TRes>
    implements CopyWith$Query$CustomerSearcher$customers<TRes> {
  _CopyWithImpl$Query$CustomerSearcher$customers(
    this._instance,
    this._then,
  );

  final Query$CustomerSearcher$customers _instance;

  final TRes Function(Query$CustomerSearcher$customers) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? data = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$CustomerSearcher$customers(
        data: data == _undefined || data == null
            ? _instance.data
            : (data as List<Query$CustomerSearcher$customers$data>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes data(
          Iterable<Query$CustomerSearcher$customers$data> Function(
                  Iterable<
                      CopyWith$Query$CustomerSearcher$customers$data<
                          Query$CustomerSearcher$customers$data>>)
              _fn) =>
      call(
          data: _fn(_instance.data
              .map((e) => CopyWith$Query$CustomerSearcher$customers$data(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$CustomerSearcher$customers<TRes>
    implements CopyWith$Query$CustomerSearcher$customers<TRes> {
  _CopyWithStubImpl$Query$CustomerSearcher$customers(this._res);

  TRes _res;

  call({
    List<Query$CustomerSearcher$customers$data>? data,
    String? $__typename,
  }) =>
      _res;
  data(_fn) => _res;
}

class Query$CustomerSearcher$customers$data {
  Query$CustomerSearcher$customers$data({
    required this.id,
    required this.name,
    this.$__typename = 'Customer',
  });

  factory Query$CustomerSearcher$customers$data.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$CustomerSearcher$customers$data(
      id: (l$id as String),
      name: (l$name as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$CustomerSearcher$customers$data) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$CustomerSearcher$customers$data
    on Query$CustomerSearcher$customers$data {
  CopyWith$Query$CustomerSearcher$customers$data<
          Query$CustomerSearcher$customers$data>
      get copyWith => CopyWith$Query$CustomerSearcher$customers$data(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$CustomerSearcher$customers$data<TRes> {
  factory CopyWith$Query$CustomerSearcher$customers$data(
    Query$CustomerSearcher$customers$data instance,
    TRes Function(Query$CustomerSearcher$customers$data) then,
  ) = _CopyWithImpl$Query$CustomerSearcher$customers$data;

  factory CopyWith$Query$CustomerSearcher$customers$data.stub(TRes res) =
      _CopyWithStubImpl$Query$CustomerSearcher$customers$data;

  TRes call({
    String? id,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$CustomerSearcher$customers$data<TRes>
    implements CopyWith$Query$CustomerSearcher$customers$data<TRes> {
  _CopyWithImpl$Query$CustomerSearcher$customers$data(
    this._instance,
    this._then,
  );

  final Query$CustomerSearcher$customers$data _instance;

  final TRes Function(Query$CustomerSearcher$customers$data) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$CustomerSearcher$customers$data(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$CustomerSearcher$customers$data<TRes>
    implements CopyWith$Query$CustomerSearcher$customers$data<TRes> {
  _CopyWithStubImpl$Query$CustomerSearcher$customers$data(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? $__typename,
  }) =>
      _res;
}
