// ignore_for_file: type=lint
import '../../schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$Login {
  factory Variables$Mutation$Login(
          {required Input$AuthenticationLoginInput input}) =>
      Variables$Mutation$Login._({
        r'input': input,
      });

  Variables$Mutation$Login._(this._$data);

  factory Variables$Mutation$Login.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$AuthenticationLoginInput.fromJson(
        (l$input as Map<String, dynamic>));
    return Variables$Mutation$Login._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$AuthenticationLoginInput get input =>
      (_$data['input'] as Input$AuthenticationLoginInput);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$Login<Variables$Mutation$Login> get copyWith =>
      CopyWith$Variables$Mutation$Login(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$Login) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$input = input;
    return Object.hashAll([l$input]);
  }
}

abstract class CopyWith$Variables$Mutation$Login<TRes> {
  factory CopyWith$Variables$Mutation$Login(
    Variables$Mutation$Login instance,
    TRes Function(Variables$Mutation$Login) then,
  ) = _CopyWithImpl$Variables$Mutation$Login;

  factory CopyWith$Variables$Mutation$Login.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$Login;

  TRes call({Input$AuthenticationLoginInput? input});
}

class _CopyWithImpl$Variables$Mutation$Login<TRes>
    implements CopyWith$Variables$Mutation$Login<TRes> {
  _CopyWithImpl$Variables$Mutation$Login(
    this._instance,
    this._then,
  );

  final Variables$Mutation$Login _instance;

  final TRes Function(Variables$Mutation$Login) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(Variables$Mutation$Login._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$AuthenticationLoginInput),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$Login<TRes>
    implements CopyWith$Variables$Mutation$Login<TRes> {
  _CopyWithStubImpl$Variables$Mutation$Login(this._res);

  TRes _res;

  call({Input$AuthenticationLoginInput? input}) => _res;
}

class Mutation$Login {
  Mutation$Login({
    required this.authenticationLogin,
    this.$__typename = 'Mutation',
  });

  factory Mutation$Login.fromJson(Map<String, dynamic> json) {
    final l$authenticationLogin = json['authenticationLogin'];
    final l$$__typename = json['__typename'];
    return Mutation$Login(
      authenticationLogin: Mutation$Login$authenticationLogin.fromJson(
          (l$authenticationLogin as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$Login$authenticationLogin authenticationLogin;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$authenticationLogin = authenticationLogin;
    _resultData['authenticationLogin'] = l$authenticationLogin.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$authenticationLogin = authenticationLogin;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$authenticationLogin,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$Login) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$authenticationLogin = authenticationLogin;
    final lOther$authenticationLogin = other.authenticationLogin;
    if (l$authenticationLogin != lOther$authenticationLogin) {
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

extension UtilityExtension$Mutation$Login on Mutation$Login {
  CopyWith$Mutation$Login<Mutation$Login> get copyWith =>
      CopyWith$Mutation$Login(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$Login<TRes> {
  factory CopyWith$Mutation$Login(
    Mutation$Login instance,
    TRes Function(Mutation$Login) then,
  ) = _CopyWithImpl$Mutation$Login;

  factory CopyWith$Mutation$Login.stub(TRes res) =
      _CopyWithStubImpl$Mutation$Login;

  TRes call({
    Mutation$Login$authenticationLogin? authenticationLogin,
    String? $__typename,
  });
  CopyWith$Mutation$Login$authenticationLogin<TRes> get authenticationLogin;
}

class _CopyWithImpl$Mutation$Login<TRes>
    implements CopyWith$Mutation$Login<TRes> {
  _CopyWithImpl$Mutation$Login(
    this._instance,
    this._then,
  );

  final Mutation$Login _instance;

  final TRes Function(Mutation$Login) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? authenticationLogin = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$Login(
        authenticationLogin:
            authenticationLogin == _undefined || authenticationLogin == null
                ? _instance.authenticationLogin
                : (authenticationLogin as Mutation$Login$authenticationLogin),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$Login$authenticationLogin<TRes> get authenticationLogin {
    final local$authenticationLogin = _instance.authenticationLogin;
    return CopyWith$Mutation$Login$authenticationLogin(
        local$authenticationLogin, (e) => call(authenticationLogin: e));
  }
}

class _CopyWithStubImpl$Mutation$Login<TRes>
    implements CopyWith$Mutation$Login<TRes> {
  _CopyWithStubImpl$Mutation$Login(this._res);

  TRes _res;

  call({
    Mutation$Login$authenticationLogin? authenticationLogin,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$Login$authenticationLogin<TRes> get authenticationLogin =>
      CopyWith$Mutation$Login$authenticationLogin.stub(_res);
}

const documentNodeMutationLogin = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'Login'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'AuthenticationLoginInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'authenticationLogin'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'token'),
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
]);
Mutation$Login _parserFn$Mutation$Login(Map<String, dynamic> data) =>
    Mutation$Login.fromJson(data);
typedef OnMutationCompleted$Mutation$Login = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$Login?,
);

class Options$Mutation$Login extends graphql.MutationOptions<Mutation$Login> {
  Options$Mutation$Login({
    String? operationName,
    required Variables$Mutation$Login variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$Login? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$Login? onCompleted,
    graphql.OnMutationUpdate<Mutation$Login>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$Login(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationLogin,
          parserFn: _parserFn$Mutation$Login,
        );

  final OnMutationCompleted$Mutation$Login? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$Login
    extends graphql.WatchQueryOptions<Mutation$Login> {
  WatchOptions$Mutation$Login({
    String? operationName,
    required Variables$Mutation$Login variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$Login? typedOptimisticResult,
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
          document: documentNodeMutationLogin,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$Login,
        );
}

extension ClientExtension$Mutation$Login on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$Login>> mutate$Login(
          Options$Mutation$Login options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$Login> watchMutation$Login(
          WatchOptions$Mutation$Login options) =>
      this.watchMutation(options);
}

class Mutation$Login$HookResult {
  Mutation$Login$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$Login runMutation;

  final graphql.QueryResult<Mutation$Login> result;
}

Mutation$Login$HookResult useMutation$Login(
    [WidgetOptions$Mutation$Login? options]) {
  final result =
      graphql_flutter.useMutation(options ?? WidgetOptions$Mutation$Login());
  return Mutation$Login$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$Login> useWatchMutation$Login(
        WatchOptions$Mutation$Login options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$Login
    extends graphql.MutationOptions<Mutation$Login> {
  WidgetOptions$Mutation$Login({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$Login? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$Login? onCompleted,
    graphql.OnMutationUpdate<Mutation$Login>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$Login(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationLogin,
          parserFn: _parserFn$Mutation$Login,
        );

  final OnMutationCompleted$Mutation$Login? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$Login = graphql.MultiSourceResult<Mutation$Login>
    Function(
  Variables$Mutation$Login, {
  Object? optimisticResult,
  Mutation$Login? typedOptimisticResult,
});
typedef Builder$Mutation$Login = widgets.Widget Function(
  RunMutation$Mutation$Login,
  graphql.QueryResult<Mutation$Login>?,
);

class Mutation$Login$Widget extends graphql_flutter.Mutation<Mutation$Login> {
  Mutation$Login$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$Login? options,
    required Builder$Mutation$Login builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$Login(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$Login$authenticationLogin {
  Mutation$Login$authenticationLogin({
    required this.token,
    this.$__typename = 'AuthenticationLoginPayload',
  });

  factory Mutation$Login$authenticationLogin.fromJson(
      Map<String, dynamic> json) {
    final l$token = json['token'];
    final l$$__typename = json['__typename'];
    return Mutation$Login$authenticationLogin(
      token: (l$token as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String token;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$token = token;
    _resultData['token'] = l$token;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$token = token;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$token,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$Login$authenticationLogin) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$token = token;
    final lOther$token = other.token;
    if (l$token != lOther$token) {
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

extension UtilityExtension$Mutation$Login$authenticationLogin
    on Mutation$Login$authenticationLogin {
  CopyWith$Mutation$Login$authenticationLogin<
          Mutation$Login$authenticationLogin>
      get copyWith => CopyWith$Mutation$Login$authenticationLogin(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$Login$authenticationLogin<TRes> {
  factory CopyWith$Mutation$Login$authenticationLogin(
    Mutation$Login$authenticationLogin instance,
    TRes Function(Mutation$Login$authenticationLogin) then,
  ) = _CopyWithImpl$Mutation$Login$authenticationLogin;

  factory CopyWith$Mutation$Login$authenticationLogin.stub(TRes res) =
      _CopyWithStubImpl$Mutation$Login$authenticationLogin;

  TRes call({
    String? token,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$Login$authenticationLogin<TRes>
    implements CopyWith$Mutation$Login$authenticationLogin<TRes> {
  _CopyWithImpl$Mutation$Login$authenticationLogin(
    this._instance,
    this._then,
  );

  final Mutation$Login$authenticationLogin _instance;

  final TRes Function(Mutation$Login$authenticationLogin) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? token = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$Login$authenticationLogin(
        token: token == _undefined || token == null
            ? _instance.token
            : (token as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$Login$authenticationLogin<TRes>
    implements CopyWith$Mutation$Login$authenticationLogin<TRes> {
  _CopyWithStubImpl$Mutation$Login$authenticationLogin(this._res);

  TRes _res;

  call({
    String? token,
    String? $__typename,
  }) =>
      _res;
}

class Query$Me {
  Query$Me({
    required this.me,
    this.$__typename = 'Query',
  });

  factory Query$Me.fromJson(Map<String, dynamic> json) {
    final l$me = json['me'];
    final l$$__typename = json['__typename'];
    return Query$Me(
      me: Query$Me$me.fromJson((l$me as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Me$me me;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$me = me;
    _resultData['me'] = l$me.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$me = me;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$me,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Me) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$me = me;
    final lOther$me = other.me;
    if (l$me != lOther$me) {
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

extension UtilityExtension$Query$Me on Query$Me {
  CopyWith$Query$Me<Query$Me> get copyWith => CopyWith$Query$Me(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Me<TRes> {
  factory CopyWith$Query$Me(
    Query$Me instance,
    TRes Function(Query$Me) then,
  ) = _CopyWithImpl$Query$Me;

  factory CopyWith$Query$Me.stub(TRes res) = _CopyWithStubImpl$Query$Me;

  TRes call({
    Query$Me$me? me,
    String? $__typename,
  });
  CopyWith$Query$Me$me<TRes> get me;
}

class _CopyWithImpl$Query$Me<TRes> implements CopyWith$Query$Me<TRes> {
  _CopyWithImpl$Query$Me(
    this._instance,
    this._then,
  );

  final Query$Me _instance;

  final TRes Function(Query$Me) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? me = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Me(
        me: me == _undefined || me == null ? _instance.me : (me as Query$Me$me),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$Me$me<TRes> get me {
    final local$me = _instance.me;
    return CopyWith$Query$Me$me(local$me, (e) => call(me: e));
  }
}

class _CopyWithStubImpl$Query$Me<TRes> implements CopyWith$Query$Me<TRes> {
  _CopyWithStubImpl$Query$Me(this._res);

  TRes _res;

  call({
    Query$Me$me? me,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$Me$me<TRes> get me => CopyWith$Query$Me$me.stub(_res);
}

const documentNodeQueryMe = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'Me'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'me'),
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
            name: NameNode(value: 'email'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'displayName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'isAdmin'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'organization'),
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
                name: NameNode(value: 'timesheetSettings'),
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
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'project'),
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
            name: NameNode(value: 'currentTimesheet'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'month'),
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
Query$Me _parserFn$Query$Me(Map<String, dynamic> data) =>
    Query$Me.fromJson(data);
typedef OnQueryComplete$Query$Me = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$Me?,
);

class Options$Query$Me extends graphql.QueryOptions<Query$Me> {
  Options$Query$Me({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Me? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$Me? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
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
                    data == null ? null : _parserFn$Query$Me(data),
                  ),
          onError: onError,
          document: documentNodeQueryMe,
          parserFn: _parserFn$Query$Me,
        );

  final OnQueryComplete$Query$Me? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$Me extends graphql.WatchQueryOptions<Query$Me> {
  WatchOptions$Query$Me({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Me? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryMe,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$Me,
        );
}

class FetchMoreOptions$Query$Me extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Me({required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryMe,
        );
}

extension ClientExtension$Query$Me on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Me>> query$Me(
          [Options$Query$Me? options]) async =>
      await this.query(options ?? Options$Query$Me());
  graphql.ObservableQuery<Query$Me> watchQuery$Me(
          [WatchOptions$Query$Me? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$Me());
  void writeQuery$Me({
    required Query$Me data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(document: documentNodeQueryMe)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$Me? readQuery$Me({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryMe)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$Me.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$Me> useQuery$Me(
        [Options$Query$Me? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$Me());
graphql.ObservableQuery<Query$Me> useWatchQuery$Me(
        [WatchOptions$Query$Me? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$Me());

class Query$Me$Widget extends graphql_flutter.Query<Query$Me> {
  Query$Me$Widget({
    widgets.Key? key,
    Options$Query$Me? options,
    required graphql_flutter.QueryBuilder<Query$Me> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$Me(),
          builder: builder,
        );
}

class Query$Me$me {
  Query$Me$me({
    required this.id,
    required this.email,
    required this.displayName,
    required this.isAdmin,
    required this.organization,
    required this.currentTimesheet,
    this.$__typename = 'User',
  });

  factory Query$Me$me.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$email = json['email'];
    final l$displayName = json['displayName'];
    final l$isAdmin = json['isAdmin'];
    final l$organization = json['organization'];
    final l$currentTimesheet = json['currentTimesheet'];
    final l$$__typename = json['__typename'];
    return Query$Me$me(
      id: (l$id as String),
      email: (l$email as String),
      displayName: (l$displayName as String),
      isAdmin: (l$isAdmin as bool),
      organization: Query$Me$me$organization.fromJson(
          (l$organization as Map<String, dynamic>)),
      currentTimesheet: Query$Me$me$currentTimesheet.fromJson(
          (l$currentTimesheet as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String email;

  final String displayName;

  final bool isAdmin;

  final Query$Me$me$organization organization;

  final Query$Me$me$currentTimesheet currentTimesheet;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$displayName = displayName;
    _resultData['displayName'] = l$displayName;
    final l$isAdmin = isAdmin;
    _resultData['isAdmin'] = l$isAdmin;
    final l$organization = organization;
    _resultData['organization'] = l$organization.toJson();
    final l$currentTimesheet = currentTimesheet;
    _resultData['currentTimesheet'] = l$currentTimesheet.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$email = email;
    final l$displayName = displayName;
    final l$isAdmin = isAdmin;
    final l$organization = organization;
    final l$currentTimesheet = currentTimesheet;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$email,
      l$displayName,
      l$isAdmin,
      l$organization,
      l$currentTimesheet,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Me$me) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$displayName = displayName;
    final lOther$displayName = other.displayName;
    if (l$displayName != lOther$displayName) {
      return false;
    }
    final l$isAdmin = isAdmin;
    final lOther$isAdmin = other.isAdmin;
    if (l$isAdmin != lOther$isAdmin) {
      return false;
    }
    final l$organization = organization;
    final lOther$organization = other.organization;
    if (l$organization != lOther$organization) {
      return false;
    }
    final l$currentTimesheet = currentTimesheet;
    final lOther$currentTimesheet = other.currentTimesheet;
    if (l$currentTimesheet != lOther$currentTimesheet) {
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

extension UtilityExtension$Query$Me$me on Query$Me$me {
  CopyWith$Query$Me$me<Query$Me$me> get copyWith => CopyWith$Query$Me$me(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Me$me<TRes> {
  factory CopyWith$Query$Me$me(
    Query$Me$me instance,
    TRes Function(Query$Me$me) then,
  ) = _CopyWithImpl$Query$Me$me;

  factory CopyWith$Query$Me$me.stub(TRes res) = _CopyWithStubImpl$Query$Me$me;

  TRes call({
    String? id,
    String? email,
    String? displayName,
    bool? isAdmin,
    Query$Me$me$organization? organization,
    Query$Me$me$currentTimesheet? currentTimesheet,
    String? $__typename,
  });
  CopyWith$Query$Me$me$organization<TRes> get organization;
  CopyWith$Query$Me$me$currentTimesheet<TRes> get currentTimesheet;
}

class _CopyWithImpl$Query$Me$me<TRes> implements CopyWith$Query$Me$me<TRes> {
  _CopyWithImpl$Query$Me$me(
    this._instance,
    this._then,
  );

  final Query$Me$me _instance;

  final TRes Function(Query$Me$me) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? email = _undefined,
    Object? displayName = _undefined,
    Object? isAdmin = _undefined,
    Object? organization = _undefined,
    Object? currentTimesheet = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Me$me(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        email: email == _undefined || email == null
            ? _instance.email
            : (email as String),
        displayName: displayName == _undefined || displayName == null
            ? _instance.displayName
            : (displayName as String),
        isAdmin: isAdmin == _undefined || isAdmin == null
            ? _instance.isAdmin
            : (isAdmin as bool),
        organization: organization == _undefined || organization == null
            ? _instance.organization
            : (organization as Query$Me$me$organization),
        currentTimesheet:
            currentTimesheet == _undefined || currentTimesheet == null
                ? _instance.currentTimesheet
                : (currentTimesheet as Query$Me$me$currentTimesheet),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$Me$me$organization<TRes> get organization {
    final local$organization = _instance.organization;
    return CopyWith$Query$Me$me$organization(
        local$organization, (e) => call(organization: e));
  }

  CopyWith$Query$Me$me$currentTimesheet<TRes> get currentTimesheet {
    final local$currentTimesheet = _instance.currentTimesheet;
    return CopyWith$Query$Me$me$currentTimesheet(
        local$currentTimesheet, (e) => call(currentTimesheet: e));
  }
}

class _CopyWithStubImpl$Query$Me$me<TRes>
    implements CopyWith$Query$Me$me<TRes> {
  _CopyWithStubImpl$Query$Me$me(this._res);

  TRes _res;

  call({
    String? id,
    String? email,
    String? displayName,
    bool? isAdmin,
    Query$Me$me$organization? organization,
    Query$Me$me$currentTimesheet? currentTimesheet,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$Me$me$organization<TRes> get organization =>
      CopyWith$Query$Me$me$organization.stub(_res);
  CopyWith$Query$Me$me$currentTimesheet<TRes> get currentTimesheet =>
      CopyWith$Query$Me$me$currentTimesheet.stub(_res);
}

class Query$Me$me$organization {
  Query$Me$me$organization({
    required this.id,
    required this.name,
    required this.timesheetSettings,
    this.$__typename = 'Organization',
  });

  factory Query$Me$me$organization.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$timesheetSettings = json['timesheetSettings'];
    final l$$__typename = json['__typename'];
    return Query$Me$me$organization(
      id: (l$id as String),
      name: (l$name as String),
      timesheetSettings: Query$Me$me$organization$timesheetSettings.fromJson(
          (l$timesheetSettings as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final Query$Me$me$organization$timesheetSettings timesheetSettings;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$timesheetSettings = timesheetSettings;
    _resultData['timesheetSettings'] = l$timesheetSettings.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$timesheetSettings = timesheetSettings;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$timesheetSettings,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Me$me$organization) ||
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
    final l$timesheetSettings = timesheetSettings;
    final lOther$timesheetSettings = other.timesheetSettings;
    if (l$timesheetSettings != lOther$timesheetSettings) {
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

extension UtilityExtension$Query$Me$me$organization
    on Query$Me$me$organization {
  CopyWith$Query$Me$me$organization<Query$Me$me$organization> get copyWith =>
      CopyWith$Query$Me$me$organization(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Me$me$organization<TRes> {
  factory CopyWith$Query$Me$me$organization(
    Query$Me$me$organization instance,
    TRes Function(Query$Me$me$organization) then,
  ) = _CopyWithImpl$Query$Me$me$organization;

  factory CopyWith$Query$Me$me$organization.stub(TRes res) =
      _CopyWithStubImpl$Query$Me$me$organization;

  TRes call({
    String? id,
    String? name,
    Query$Me$me$organization$timesheetSettings? timesheetSettings,
    String? $__typename,
  });
  CopyWith$Query$Me$me$organization$timesheetSettings<TRes>
      get timesheetSettings;
}

class _CopyWithImpl$Query$Me$me$organization<TRes>
    implements CopyWith$Query$Me$me$organization<TRes> {
  _CopyWithImpl$Query$Me$me$organization(
    this._instance,
    this._then,
  );

  final Query$Me$me$organization _instance;

  final TRes Function(Query$Me$me$organization) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? timesheetSettings = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Me$me$organization(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        timesheetSettings: timesheetSettings == _undefined ||
                timesheetSettings == null
            ? _instance.timesheetSettings
            : (timesheetSettings as Query$Me$me$organization$timesheetSettings),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$Me$me$organization$timesheetSettings<TRes>
      get timesheetSettings {
    final local$timesheetSettings = _instance.timesheetSettings;
    return CopyWith$Query$Me$me$organization$timesheetSettings(
        local$timesheetSettings, (e) => call(timesheetSettings: e));
  }
}

class _CopyWithStubImpl$Query$Me$me$organization<TRes>
    implements CopyWith$Query$Me$me$organization<TRes> {
  _CopyWithStubImpl$Query$Me$me$organization(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    Query$Me$me$organization$timesheetSettings? timesheetSettings,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$Me$me$organization$timesheetSettings<TRes>
      get timesheetSettings =>
          CopyWith$Query$Me$me$organization$timesheetSettings.stub(_res);
}

class Query$Me$me$organization$timesheetSettings {
  Query$Me$me$organization$timesheetSettings({
    required this.id,
    required this.customer,
    required this.project,
    this.$__typename = 'Setting',
  });

  factory Query$Me$me$organization$timesheetSettings.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$customer = json['customer'];
    final l$project = json['project'];
    final l$$__typename = json['__typename'];
    return Query$Me$me$organization$timesheetSettings(
      id: (l$id as String),
      customer: fromJson$Enum$CustomerSettingEnum((l$customer as String)),
      project: fromJson$Enum$ProjectSettingEnum((l$project as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$CustomerSettingEnum customer;

  final Enum$ProjectSettingEnum project;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$customer = customer;
    _resultData['customer'] = toJson$Enum$CustomerSettingEnum(l$customer);
    final l$project = project;
    _resultData['project'] = toJson$Enum$ProjectSettingEnum(l$project);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$customer = customer;
    final l$project = project;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$customer,
      l$project,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Me$me$organization$timesheetSettings) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$Me$me$organization$timesheetSettings
    on Query$Me$me$organization$timesheetSettings {
  CopyWith$Query$Me$me$organization$timesheetSettings<
          Query$Me$me$organization$timesheetSettings>
      get copyWith => CopyWith$Query$Me$me$organization$timesheetSettings(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Me$me$organization$timesheetSettings<TRes> {
  factory CopyWith$Query$Me$me$organization$timesheetSettings(
    Query$Me$me$organization$timesheetSettings instance,
    TRes Function(Query$Me$me$organization$timesheetSettings) then,
  ) = _CopyWithImpl$Query$Me$me$organization$timesheetSettings;

  factory CopyWith$Query$Me$me$organization$timesheetSettings.stub(TRes res) =
      _CopyWithStubImpl$Query$Me$me$organization$timesheetSettings;

  TRes call({
    String? id,
    Enum$CustomerSettingEnum? customer,
    Enum$ProjectSettingEnum? project,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Me$me$organization$timesheetSettings<TRes>
    implements CopyWith$Query$Me$me$organization$timesheetSettings<TRes> {
  _CopyWithImpl$Query$Me$me$organization$timesheetSettings(
    this._instance,
    this._then,
  );

  final Query$Me$me$organization$timesheetSettings _instance;

  final TRes Function(Query$Me$me$organization$timesheetSettings) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? customer = _undefined,
    Object? project = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Me$me$organization$timesheetSettings(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer as Enum$CustomerSettingEnum),
        project: project == _undefined || project == null
            ? _instance.project
            : (project as Enum$ProjectSettingEnum),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$Me$me$organization$timesheetSettings<TRes>
    implements CopyWith$Query$Me$me$organization$timesheetSettings<TRes> {
  _CopyWithStubImpl$Query$Me$me$organization$timesheetSettings(this._res);

  TRes _res;

  call({
    String? id,
    Enum$CustomerSettingEnum? customer,
    Enum$ProjectSettingEnum? project,
    String? $__typename,
  }) =>
      _res;
}

class Query$Me$me$currentTimesheet {
  Query$Me$me$currentTimesheet({
    required this.month,
    this.$__typename = 'Timesheet',
  });

  factory Query$Me$me$currentTimesheet.fromJson(Map<String, dynamic> json) {
    final l$month = json['month'];
    final l$$__typename = json['__typename'];
    return Query$Me$me$currentTimesheet(
      month: (l$month as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String month;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$month = month;
    _resultData['month'] = l$month;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$month = month;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$month,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Me$me$currentTimesheet) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$month = month;
    final lOther$month = other.month;
    if (l$month != lOther$month) {
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

extension UtilityExtension$Query$Me$me$currentTimesheet
    on Query$Me$me$currentTimesheet {
  CopyWith$Query$Me$me$currentTimesheet<Query$Me$me$currentTimesheet>
      get copyWith => CopyWith$Query$Me$me$currentTimesheet(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Me$me$currentTimesheet<TRes> {
  factory CopyWith$Query$Me$me$currentTimesheet(
    Query$Me$me$currentTimesheet instance,
    TRes Function(Query$Me$me$currentTimesheet) then,
  ) = _CopyWithImpl$Query$Me$me$currentTimesheet;

  factory CopyWith$Query$Me$me$currentTimesheet.stub(TRes res) =
      _CopyWithStubImpl$Query$Me$me$currentTimesheet;

  TRes call({
    String? month,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Me$me$currentTimesheet<TRes>
    implements CopyWith$Query$Me$me$currentTimesheet<TRes> {
  _CopyWithImpl$Query$Me$me$currentTimesheet(
    this._instance,
    this._then,
  );

  final Query$Me$me$currentTimesheet _instance;

  final TRes Function(Query$Me$me$currentTimesheet) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? month = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Me$me$currentTimesheet(
        month: month == _undefined || month == null
            ? _instance.month
            : (month as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$Me$me$currentTimesheet<TRes>
    implements CopyWith$Query$Me$me$currentTimesheet<TRes> {
  _CopyWithStubImpl$Query$Me$me$currentTimesheet(this._res);

  TRes _res;

  call({
    String? month,
    String? $__typename,
  }) =>
      _res;
}
