// ignore_for_file: type=lint
import '../../schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$ProjectSearcher {
  factory Variables$Query$ProjectSearcher({Input$ProjectFilter? filter}) =>
      Variables$Query$ProjectSearcher._({
        if (filter != null) r'filter': filter,
      });

  Variables$Query$ProjectSearcher._(this._$data);

  factory Variables$Query$ProjectSearcher.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('filter')) {
      final l$filter = data['filter'];
      result$data['filter'] = l$filter == null
          ? null
          : Input$ProjectFilter.fromJson((l$filter as Map<String, dynamic>));
    }
    return Variables$Query$ProjectSearcher._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$ProjectFilter? get filter => (_$data['filter'] as Input$ProjectFilter?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('filter')) {
      final l$filter = filter;
      result$data['filter'] = l$filter?.toJson();
    }
    return result$data;
  }

  CopyWith$Variables$Query$ProjectSearcher<Variables$Query$ProjectSearcher>
      get copyWith => CopyWith$Variables$Query$ProjectSearcher(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$ProjectSearcher) ||
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

abstract class CopyWith$Variables$Query$ProjectSearcher<TRes> {
  factory CopyWith$Variables$Query$ProjectSearcher(
    Variables$Query$ProjectSearcher instance,
    TRes Function(Variables$Query$ProjectSearcher) then,
  ) = _CopyWithImpl$Variables$Query$ProjectSearcher;

  factory CopyWith$Variables$Query$ProjectSearcher.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$ProjectSearcher;

  TRes call({Input$ProjectFilter? filter});
}

class _CopyWithImpl$Variables$Query$ProjectSearcher<TRes>
    implements CopyWith$Variables$Query$ProjectSearcher<TRes> {
  _CopyWithImpl$Variables$Query$ProjectSearcher(
    this._instance,
    this._then,
  );

  final Variables$Query$ProjectSearcher _instance;

  final TRes Function(Variables$Query$ProjectSearcher) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? filter = _undefined}) =>
      _then(Variables$Query$ProjectSearcher._({
        ..._instance._$data,
        if (filter != _undefined) 'filter': (filter as Input$ProjectFilter?),
      }));
}

class _CopyWithStubImpl$Variables$Query$ProjectSearcher<TRes>
    implements CopyWith$Variables$Query$ProjectSearcher<TRes> {
  _CopyWithStubImpl$Variables$Query$ProjectSearcher(this._res);

  TRes _res;

  call({Input$ProjectFilter? filter}) => _res;
}

class Query$ProjectSearcher {
  Query$ProjectSearcher({
    required this.projects,
    this.$__typename = 'Query',
  });

  factory Query$ProjectSearcher.fromJson(Map<String, dynamic> json) {
    final l$projects = json['projects'];
    final l$$__typename = json['__typename'];
    return Query$ProjectSearcher(
      projects: Query$ProjectSearcher$projects.fromJson(
          (l$projects as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$ProjectSearcher$projects projects;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$projects = projects;
    _resultData['projects'] = l$projects.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$projects = projects;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$projects,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$ProjectSearcher) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$projects = projects;
    final lOther$projects = other.projects;
    if (l$projects != lOther$projects) {
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

extension UtilityExtension$Query$ProjectSearcher on Query$ProjectSearcher {
  CopyWith$Query$ProjectSearcher<Query$ProjectSearcher> get copyWith =>
      CopyWith$Query$ProjectSearcher(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$ProjectSearcher<TRes> {
  factory CopyWith$Query$ProjectSearcher(
    Query$ProjectSearcher instance,
    TRes Function(Query$ProjectSearcher) then,
  ) = _CopyWithImpl$Query$ProjectSearcher;

  factory CopyWith$Query$ProjectSearcher.stub(TRes res) =
      _CopyWithStubImpl$Query$ProjectSearcher;

  TRes call({
    Query$ProjectSearcher$projects? projects,
    String? $__typename,
  });
  CopyWith$Query$ProjectSearcher$projects<TRes> get projects;
}

class _CopyWithImpl$Query$ProjectSearcher<TRes>
    implements CopyWith$Query$ProjectSearcher<TRes> {
  _CopyWithImpl$Query$ProjectSearcher(
    this._instance,
    this._then,
  );

  final Query$ProjectSearcher _instance;

  final TRes Function(Query$ProjectSearcher) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? projects = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ProjectSearcher(
        projects: projects == _undefined || projects == null
            ? _instance.projects
            : (projects as Query$ProjectSearcher$projects),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$ProjectSearcher$projects<TRes> get projects {
    final local$projects = _instance.projects;
    return CopyWith$Query$ProjectSearcher$projects(
        local$projects, (e) => call(projects: e));
  }
}

class _CopyWithStubImpl$Query$ProjectSearcher<TRes>
    implements CopyWith$Query$ProjectSearcher<TRes> {
  _CopyWithStubImpl$Query$ProjectSearcher(this._res);

  TRes _res;

  call({
    Query$ProjectSearcher$projects? projects,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$ProjectSearcher$projects<TRes> get projects =>
      CopyWith$Query$ProjectSearcher$projects.stub(_res);
}

const documentNodeQueryProjectSearcher = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'ProjectSearcher'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'filter')),
        type: NamedTypeNode(
          name: NameNode(value: 'ProjectFilter'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'projects'),
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
Query$ProjectSearcher _parserFn$Query$ProjectSearcher(
        Map<String, dynamic> data) =>
    Query$ProjectSearcher.fromJson(data);
typedef OnQueryComplete$Query$ProjectSearcher = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$ProjectSearcher?,
);

class Options$Query$ProjectSearcher
    extends graphql.QueryOptions<Query$ProjectSearcher> {
  Options$Query$ProjectSearcher({
    String? operationName,
    Variables$Query$ProjectSearcher? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$ProjectSearcher? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$ProjectSearcher? onComplete,
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
                    data == null ? null : _parserFn$Query$ProjectSearcher(data),
                  ),
          onError: onError,
          document: documentNodeQueryProjectSearcher,
          parserFn: _parserFn$Query$ProjectSearcher,
        );

  final OnQueryComplete$Query$ProjectSearcher? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$ProjectSearcher
    extends graphql.WatchQueryOptions<Query$ProjectSearcher> {
  WatchOptions$Query$ProjectSearcher({
    String? operationName,
    Variables$Query$ProjectSearcher? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$ProjectSearcher? typedOptimisticResult,
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
          document: documentNodeQueryProjectSearcher,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$ProjectSearcher,
        );
}

class FetchMoreOptions$Query$ProjectSearcher extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$ProjectSearcher({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$ProjectSearcher? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQueryProjectSearcher,
        );
}

extension ClientExtension$Query$ProjectSearcher on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$ProjectSearcher>> query$ProjectSearcher(
          [Options$Query$ProjectSearcher? options]) async =>
      await this.query(options ?? Options$Query$ProjectSearcher());
  graphql.ObservableQuery<Query$ProjectSearcher> watchQuery$ProjectSearcher(
          [WatchOptions$Query$ProjectSearcher? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$ProjectSearcher());
  void writeQuery$ProjectSearcher({
    required Query$ProjectSearcher data,
    Variables$Query$ProjectSearcher? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryProjectSearcher),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$ProjectSearcher? readQuery$ProjectSearcher({
    Variables$Query$ProjectSearcher? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryProjectSearcher),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$ProjectSearcher.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$ProjectSearcher> useQuery$ProjectSearcher(
        [Options$Query$ProjectSearcher? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$ProjectSearcher());
graphql.ObservableQuery<Query$ProjectSearcher> useWatchQuery$ProjectSearcher(
        [WatchOptions$Query$ProjectSearcher? options]) =>
    graphql_flutter
        .useWatchQuery(options ?? WatchOptions$Query$ProjectSearcher());

class Query$ProjectSearcher$Widget
    extends graphql_flutter.Query<Query$ProjectSearcher> {
  Query$ProjectSearcher$Widget({
    widgets.Key? key,
    Options$Query$ProjectSearcher? options,
    required graphql_flutter.QueryBuilder<Query$ProjectSearcher> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$ProjectSearcher(),
          builder: builder,
        );
}

class Query$ProjectSearcher$projects {
  Query$ProjectSearcher$projects({
    required this.data,
    this.$__typename = 'ProjectPagination',
  });

  factory Query$ProjectSearcher$projects.fromJson(Map<String, dynamic> json) {
    final l$data = json['data'];
    final l$$__typename = json['__typename'];
    return Query$ProjectSearcher$projects(
      data: (l$data as List<dynamic>)
          .map((e) => Query$ProjectSearcher$projects$data.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$ProjectSearcher$projects$data> data;

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
    if (!(other is Query$ProjectSearcher$projects) ||
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

extension UtilityExtension$Query$ProjectSearcher$projects
    on Query$ProjectSearcher$projects {
  CopyWith$Query$ProjectSearcher$projects<Query$ProjectSearcher$projects>
      get copyWith => CopyWith$Query$ProjectSearcher$projects(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$ProjectSearcher$projects<TRes> {
  factory CopyWith$Query$ProjectSearcher$projects(
    Query$ProjectSearcher$projects instance,
    TRes Function(Query$ProjectSearcher$projects) then,
  ) = _CopyWithImpl$Query$ProjectSearcher$projects;

  factory CopyWith$Query$ProjectSearcher$projects.stub(TRes res) =
      _CopyWithStubImpl$Query$ProjectSearcher$projects;

  TRes call({
    List<Query$ProjectSearcher$projects$data>? data,
    String? $__typename,
  });
  TRes data(
      Iterable<Query$ProjectSearcher$projects$data> Function(
              Iterable<
                  CopyWith$Query$ProjectSearcher$projects$data<
                      Query$ProjectSearcher$projects$data>>)
          _fn);
}

class _CopyWithImpl$Query$ProjectSearcher$projects<TRes>
    implements CopyWith$Query$ProjectSearcher$projects<TRes> {
  _CopyWithImpl$Query$ProjectSearcher$projects(
    this._instance,
    this._then,
  );

  final Query$ProjectSearcher$projects _instance;

  final TRes Function(Query$ProjectSearcher$projects) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? data = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ProjectSearcher$projects(
        data: data == _undefined || data == null
            ? _instance.data
            : (data as List<Query$ProjectSearcher$projects$data>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes data(
          Iterable<Query$ProjectSearcher$projects$data> Function(
                  Iterable<
                      CopyWith$Query$ProjectSearcher$projects$data<
                          Query$ProjectSearcher$projects$data>>)
              _fn) =>
      call(
          data: _fn(_instance.data
              .map((e) => CopyWith$Query$ProjectSearcher$projects$data(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$ProjectSearcher$projects<TRes>
    implements CopyWith$Query$ProjectSearcher$projects<TRes> {
  _CopyWithStubImpl$Query$ProjectSearcher$projects(this._res);

  TRes _res;

  call({
    List<Query$ProjectSearcher$projects$data>? data,
    String? $__typename,
  }) =>
      _res;
  data(_fn) => _res;
}

class Query$ProjectSearcher$projects$data {
  Query$ProjectSearcher$projects$data({
    required this.id,
    required this.name,
    this.$__typename = 'Project',
  });

  factory Query$ProjectSearcher$projects$data.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$ProjectSearcher$projects$data(
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
    if (!(other is Query$ProjectSearcher$projects$data) ||
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

extension UtilityExtension$Query$ProjectSearcher$projects$data
    on Query$ProjectSearcher$projects$data {
  CopyWith$Query$ProjectSearcher$projects$data<
          Query$ProjectSearcher$projects$data>
      get copyWith => CopyWith$Query$ProjectSearcher$projects$data(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$ProjectSearcher$projects$data<TRes> {
  factory CopyWith$Query$ProjectSearcher$projects$data(
    Query$ProjectSearcher$projects$data instance,
    TRes Function(Query$ProjectSearcher$projects$data) then,
  ) = _CopyWithImpl$Query$ProjectSearcher$projects$data;

  factory CopyWith$Query$ProjectSearcher$projects$data.stub(TRes res) =
      _CopyWithStubImpl$Query$ProjectSearcher$projects$data;

  TRes call({
    String? id,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$ProjectSearcher$projects$data<TRes>
    implements CopyWith$Query$ProjectSearcher$projects$data<TRes> {
  _CopyWithImpl$Query$ProjectSearcher$projects$data(
    this._instance,
    this._then,
  );

  final Query$ProjectSearcher$projects$data _instance;

  final TRes Function(Query$ProjectSearcher$projects$data) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ProjectSearcher$projects$data(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$ProjectSearcher$projects$data<TRes>
    implements CopyWith$Query$ProjectSearcher$projects$data<TRes> {
  _CopyWithStubImpl$Query$ProjectSearcher$projects$data(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? $__typename,
  }) =>
      _res;
}
