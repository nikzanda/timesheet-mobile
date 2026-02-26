// ignore_for_file: type=lint
class Input$ActivitiesCreateInput {
  factory Input$ActivitiesCreateInput({
    required String timesheetId,
    required List<Input$ActivityCreateInput> activities,
  }) =>
      Input$ActivitiesCreateInput._({
        r'timesheetId': timesheetId,
        r'activities': activities,
      });

  Input$ActivitiesCreateInput._(this._$data);

  factory Input$ActivitiesCreateInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$timesheetId = data['timesheetId'];
    result$data['timesheetId'] = (l$timesheetId as String);
    final l$activities = data['activities'];
    result$data['activities'] = (l$activities as List<dynamic>)
        .map((e) =>
            Input$ActivityCreateInput.fromJson((e as Map<String, dynamic>)))
        .toList();
    return Input$ActivitiesCreateInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get timesheetId => (_$data['timesheetId'] as String);
  List<Input$ActivityCreateInput> get activities =>
      (_$data['activities'] as List<Input$ActivityCreateInput>);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$timesheetId = timesheetId;
    result$data['timesheetId'] = l$timesheetId;
    final l$activities = activities;
    result$data['activities'] = l$activities.map((e) => e.toJson()).toList();
    return result$data;
  }

  CopyWith$Input$ActivitiesCreateInput<Input$ActivitiesCreateInput>
      get copyWith => CopyWith$Input$ActivitiesCreateInput(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$ActivitiesCreateInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$timesheetId = timesheetId;
    final lOther$timesheetId = other.timesheetId;
    if (l$timesheetId != lOther$timesheetId) {
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

  @override
  int get hashCode {
    final l$timesheetId = timesheetId;
    final l$activities = activities;
    return Object.hashAll([
      l$timesheetId,
      Object.hashAll(l$activities.map((v) => v)),
    ]);
  }
}

abstract class CopyWith$Input$ActivitiesCreateInput<TRes> {
  factory CopyWith$Input$ActivitiesCreateInput(
    Input$ActivitiesCreateInput instance,
    TRes Function(Input$ActivitiesCreateInput) then,
  ) = _CopyWithImpl$Input$ActivitiesCreateInput;

  factory CopyWith$Input$ActivitiesCreateInput.stub(TRes res) =
      _CopyWithStubImpl$Input$ActivitiesCreateInput;

  TRes call({
    String? timesheetId,
    List<Input$ActivityCreateInput>? activities,
  });
  TRes activities(
      Iterable<Input$ActivityCreateInput> Function(
              Iterable<
                  CopyWith$Input$ActivityCreateInput<
                      Input$ActivityCreateInput>>)
          _fn);
}

class _CopyWithImpl$Input$ActivitiesCreateInput<TRes>
    implements CopyWith$Input$ActivitiesCreateInput<TRes> {
  _CopyWithImpl$Input$ActivitiesCreateInput(
    this._instance,
    this._then,
  );

  final Input$ActivitiesCreateInput _instance;

  final TRes Function(Input$ActivitiesCreateInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? timesheetId = _undefined,
    Object? activities = _undefined,
  }) =>
      _then(Input$ActivitiesCreateInput._({
        ..._instance._$data,
        if (timesheetId != _undefined && timesheetId != null)
          'timesheetId': (timesheetId as String),
        if (activities != _undefined && activities != null)
          'activities': (activities as List<Input$ActivityCreateInput>),
      }));
  TRes activities(
          Iterable<Input$ActivityCreateInput> Function(
                  Iterable<
                      CopyWith$Input$ActivityCreateInput<
                          Input$ActivityCreateInput>>)
              _fn) =>
      call(
          activities: _fn(_instance.activities
              .map((e) => CopyWith$Input$ActivityCreateInput(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Input$ActivitiesCreateInput<TRes>
    implements CopyWith$Input$ActivitiesCreateInput<TRes> {
  _CopyWithStubImpl$Input$ActivitiesCreateInput(this._res);

  TRes _res;

  call({
    String? timesheetId,
    List<Input$ActivityCreateInput>? activities,
  }) =>
      _res;
  activities(_fn) => _res;
}

class Input$ActivitiesDeleteInput {
  factory Input$ActivitiesDeleteInput({
    required String timesheetId,
    required List<String> activitiesIds,
  }) =>
      Input$ActivitiesDeleteInput._({
        r'timesheetId': timesheetId,
        r'activitiesIds': activitiesIds,
      });

  Input$ActivitiesDeleteInput._(this._$data);

  factory Input$ActivitiesDeleteInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$timesheetId = data['timesheetId'];
    result$data['timesheetId'] = (l$timesheetId as String);
    final l$activitiesIds = data['activitiesIds'];
    result$data['activitiesIds'] =
        (l$activitiesIds as List<dynamic>).map((e) => (e as String)).toList();
    return Input$ActivitiesDeleteInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get timesheetId => (_$data['timesheetId'] as String);
  List<String> get activitiesIds => (_$data['activitiesIds'] as List<String>);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$timesheetId = timesheetId;
    result$data['timesheetId'] = l$timesheetId;
    final l$activitiesIds = activitiesIds;
    result$data['activitiesIds'] = l$activitiesIds.map((e) => e).toList();
    return result$data;
  }

  CopyWith$Input$ActivitiesDeleteInput<Input$ActivitiesDeleteInput>
      get copyWith => CopyWith$Input$ActivitiesDeleteInput(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$ActivitiesDeleteInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$timesheetId = timesheetId;
    final lOther$timesheetId = other.timesheetId;
    if (l$timesheetId != lOther$timesheetId) {
      return false;
    }
    final l$activitiesIds = activitiesIds;
    final lOther$activitiesIds = other.activitiesIds;
    if (l$activitiesIds.length != lOther$activitiesIds.length) {
      return false;
    }
    for (int i = 0; i < l$activitiesIds.length; i++) {
      final l$activitiesIds$entry = l$activitiesIds[i];
      final lOther$activitiesIds$entry = lOther$activitiesIds[i];
      if (l$activitiesIds$entry != lOther$activitiesIds$entry) {
        return false;
      }
    }
    return true;
  }

  @override
  int get hashCode {
    final l$timesheetId = timesheetId;
    final l$activitiesIds = activitiesIds;
    return Object.hashAll([
      l$timesheetId,
      Object.hashAll(l$activitiesIds.map((v) => v)),
    ]);
  }
}

abstract class CopyWith$Input$ActivitiesDeleteInput<TRes> {
  factory CopyWith$Input$ActivitiesDeleteInput(
    Input$ActivitiesDeleteInput instance,
    TRes Function(Input$ActivitiesDeleteInput) then,
  ) = _CopyWithImpl$Input$ActivitiesDeleteInput;

  factory CopyWith$Input$ActivitiesDeleteInput.stub(TRes res) =
      _CopyWithStubImpl$Input$ActivitiesDeleteInput;

  TRes call({
    String? timesheetId,
    List<String>? activitiesIds,
  });
}

class _CopyWithImpl$Input$ActivitiesDeleteInput<TRes>
    implements CopyWith$Input$ActivitiesDeleteInput<TRes> {
  _CopyWithImpl$Input$ActivitiesDeleteInput(
    this._instance,
    this._then,
  );

  final Input$ActivitiesDeleteInput _instance;

  final TRes Function(Input$ActivitiesDeleteInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? timesheetId = _undefined,
    Object? activitiesIds = _undefined,
  }) =>
      _then(Input$ActivitiesDeleteInput._({
        ..._instance._$data,
        if (timesheetId != _undefined && timesheetId != null)
          'timesheetId': (timesheetId as String),
        if (activitiesIds != _undefined && activitiesIds != null)
          'activitiesIds': (activitiesIds as List<String>),
      }));
}

class _CopyWithStubImpl$Input$ActivitiesDeleteInput<TRes>
    implements CopyWith$Input$ActivitiesDeleteInput<TRes> {
  _CopyWithStubImpl$Input$ActivitiesDeleteInput(this._res);

  TRes _res;

  call({
    String? timesheetId,
    List<String>? activitiesIds,
  }) =>
      _res;
}

class Input$ActivitiesUpdateInput {
  factory Input$ActivitiesUpdateInput({
    required String timesheetId,
    required List<Input$ActivityUpdateInput> activities,
  }) =>
      Input$ActivitiesUpdateInput._({
        r'timesheetId': timesheetId,
        r'activities': activities,
      });

  Input$ActivitiesUpdateInput._(this._$data);

  factory Input$ActivitiesUpdateInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$timesheetId = data['timesheetId'];
    result$data['timesheetId'] = (l$timesheetId as String);
    final l$activities = data['activities'];
    result$data['activities'] = (l$activities as List<dynamic>)
        .map((e) =>
            Input$ActivityUpdateInput.fromJson((e as Map<String, dynamic>)))
        .toList();
    return Input$ActivitiesUpdateInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get timesheetId => (_$data['timesheetId'] as String);
  List<Input$ActivityUpdateInput> get activities =>
      (_$data['activities'] as List<Input$ActivityUpdateInput>);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$timesheetId = timesheetId;
    result$data['timesheetId'] = l$timesheetId;
    final l$activities = activities;
    result$data['activities'] = l$activities.map((e) => e.toJson()).toList();
    return result$data;
  }

  CopyWith$Input$ActivitiesUpdateInput<Input$ActivitiesUpdateInput>
      get copyWith => CopyWith$Input$ActivitiesUpdateInput(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$ActivitiesUpdateInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$timesheetId = timesheetId;
    final lOther$timesheetId = other.timesheetId;
    if (l$timesheetId != lOther$timesheetId) {
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

  @override
  int get hashCode {
    final l$timesheetId = timesheetId;
    final l$activities = activities;
    return Object.hashAll([
      l$timesheetId,
      Object.hashAll(l$activities.map((v) => v)),
    ]);
  }
}

abstract class CopyWith$Input$ActivitiesUpdateInput<TRes> {
  factory CopyWith$Input$ActivitiesUpdateInput(
    Input$ActivitiesUpdateInput instance,
    TRes Function(Input$ActivitiesUpdateInput) then,
  ) = _CopyWithImpl$Input$ActivitiesUpdateInput;

  factory CopyWith$Input$ActivitiesUpdateInput.stub(TRes res) =
      _CopyWithStubImpl$Input$ActivitiesUpdateInput;

  TRes call({
    String? timesheetId,
    List<Input$ActivityUpdateInput>? activities,
  });
  TRes activities(
      Iterable<Input$ActivityUpdateInput> Function(
              Iterable<
                  CopyWith$Input$ActivityUpdateInput<
                      Input$ActivityUpdateInput>>)
          _fn);
}

class _CopyWithImpl$Input$ActivitiesUpdateInput<TRes>
    implements CopyWith$Input$ActivitiesUpdateInput<TRes> {
  _CopyWithImpl$Input$ActivitiesUpdateInput(
    this._instance,
    this._then,
  );

  final Input$ActivitiesUpdateInput _instance;

  final TRes Function(Input$ActivitiesUpdateInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? timesheetId = _undefined,
    Object? activities = _undefined,
  }) =>
      _then(Input$ActivitiesUpdateInput._({
        ..._instance._$data,
        if (timesheetId != _undefined && timesheetId != null)
          'timesheetId': (timesheetId as String),
        if (activities != _undefined && activities != null)
          'activities': (activities as List<Input$ActivityUpdateInput>),
      }));
  TRes activities(
          Iterable<Input$ActivityUpdateInput> Function(
                  Iterable<
                      CopyWith$Input$ActivityUpdateInput<
                          Input$ActivityUpdateInput>>)
              _fn) =>
      call(
          activities: _fn(_instance.activities
              .map((e) => CopyWith$Input$ActivityUpdateInput(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Input$ActivitiesUpdateInput<TRes>
    implements CopyWith$Input$ActivitiesUpdateInput<TRes> {
  _CopyWithStubImpl$Input$ActivitiesUpdateInput(this._res);

  TRes _res;

  call({
    String? timesheetId,
    List<Input$ActivityUpdateInput>? activities,
  }) =>
      _res;
  activities(_fn) => _res;
}

class Input$ActivityCreateInput {
  factory Input$ActivityCreateInput({
    String? customerId,
    String? projectId,
    String? description,
    required double startTime,
    double? endTime,
  }) =>
      Input$ActivityCreateInput._({
        if (customerId != null) r'customerId': customerId,
        if (projectId != null) r'projectId': projectId,
        if (description != null) r'description': description,
        r'startTime': startTime,
        if (endTime != null) r'endTime': endTime,
      });

  Input$ActivityCreateInput._(this._$data);

  factory Input$ActivityCreateInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('customerId')) {
      final l$customerId = data['customerId'];
      result$data['customerId'] = (l$customerId as String?);
    }
    if (data.containsKey('projectId')) {
      final l$projectId = data['projectId'];
      result$data['projectId'] = (l$projectId as String?);
    }
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    final l$startTime = data['startTime'];
    result$data['startTime'] = (l$startTime as num).toDouble();
    if (data.containsKey('endTime')) {
      final l$endTime = data['endTime'];
      result$data['endTime'] = (l$endTime as num?)?.toDouble();
    }
    return Input$ActivityCreateInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get customerId => (_$data['customerId'] as String?);
  String? get projectId => (_$data['projectId'] as String?);
  String? get description => (_$data['description'] as String?);
  double get startTime => (_$data['startTime'] as double);
  double? get endTime => (_$data['endTime'] as double?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('customerId')) {
      final l$customerId = customerId;
      result$data['customerId'] = l$customerId;
    }
    if (_$data.containsKey('projectId')) {
      final l$projectId = projectId;
      result$data['projectId'] = l$projectId;
    }
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    final l$startTime = startTime;
    result$data['startTime'] = l$startTime;
    if (_$data.containsKey('endTime')) {
      final l$endTime = endTime;
      result$data['endTime'] = l$endTime;
    }
    return result$data;
  }

  CopyWith$Input$ActivityCreateInput<Input$ActivityCreateInput> get copyWith =>
      CopyWith$Input$ActivityCreateInput(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$ActivityCreateInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customerId = customerId;
    final lOther$customerId = other.customerId;
    if (_$data.containsKey('customerId') !=
        other._$data.containsKey('customerId')) {
      return false;
    }
    if (l$customerId != lOther$customerId) {
      return false;
    }
    final l$projectId = projectId;
    final lOther$projectId = other.projectId;
    if (_$data.containsKey('projectId') !=
        other._$data.containsKey('projectId')) {
      return false;
    }
    if (l$projectId != lOther$projectId) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (_$data.containsKey('description') !=
        other._$data.containsKey('description')) {
      return false;
    }
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
    if (_$data.containsKey('endTime') != other._$data.containsKey('endTime')) {
      return false;
    }
    if (l$endTime != lOther$endTime) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$customerId = customerId;
    final l$projectId = projectId;
    final l$description = description;
    final l$startTime = startTime;
    final l$endTime = endTime;
    return Object.hashAll([
      _$data.containsKey('customerId') ? l$customerId : const {},
      _$data.containsKey('projectId') ? l$projectId : const {},
      _$data.containsKey('description') ? l$description : const {},
      l$startTime,
      _$data.containsKey('endTime') ? l$endTime : const {},
    ]);
  }
}

abstract class CopyWith$Input$ActivityCreateInput<TRes> {
  factory CopyWith$Input$ActivityCreateInput(
    Input$ActivityCreateInput instance,
    TRes Function(Input$ActivityCreateInput) then,
  ) = _CopyWithImpl$Input$ActivityCreateInput;

  factory CopyWith$Input$ActivityCreateInput.stub(TRes res) =
      _CopyWithStubImpl$Input$ActivityCreateInput;

  TRes call({
    String? customerId,
    String? projectId,
    String? description,
    double? startTime,
    double? endTime,
  });
}

class _CopyWithImpl$Input$ActivityCreateInput<TRes>
    implements CopyWith$Input$ActivityCreateInput<TRes> {
  _CopyWithImpl$Input$ActivityCreateInput(
    this._instance,
    this._then,
  );

  final Input$ActivityCreateInput _instance;

  final TRes Function(Input$ActivityCreateInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? customerId = _undefined,
    Object? projectId = _undefined,
    Object? description = _undefined,
    Object? startTime = _undefined,
    Object? endTime = _undefined,
  }) =>
      _then(Input$ActivityCreateInput._({
        ..._instance._$data,
        if (customerId != _undefined) 'customerId': (customerId as String?),
        if (projectId != _undefined) 'projectId': (projectId as String?),
        if (description != _undefined) 'description': (description as String?),
        if (startTime != _undefined && startTime != null)
          'startTime': (startTime as double),
        if (endTime != _undefined) 'endTime': (endTime as double?),
      }));
}

class _CopyWithStubImpl$Input$ActivityCreateInput<TRes>
    implements CopyWith$Input$ActivityCreateInput<TRes> {
  _CopyWithStubImpl$Input$ActivityCreateInput(this._res);

  TRes _res;

  call({
    String? customerId,
    String? projectId,
    String? description,
    double? startTime,
    double? endTime,
  }) =>
      _res;
}

class Input$ActivityUpdateInput {
  factory Input$ActivityUpdateInput({
    required String id,
    String? customerId,
    String? projectId,
    String? description,
    double? startTime,
    double? endTime,
  }) =>
      Input$ActivityUpdateInput._({
        r'id': id,
        if (customerId != null) r'customerId': customerId,
        if (projectId != null) r'projectId': projectId,
        if (description != null) r'description': description,
        if (startTime != null) r'startTime': startTime,
        if (endTime != null) r'endTime': endTime,
      });

  Input$ActivityUpdateInput._(this._$data);

  factory Input$ActivityUpdateInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('customerId')) {
      final l$customerId = data['customerId'];
      result$data['customerId'] = (l$customerId as String?);
    }
    if (data.containsKey('projectId')) {
      final l$projectId = data['projectId'];
      result$data['projectId'] = (l$projectId as String?);
    }
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    if (data.containsKey('startTime')) {
      final l$startTime = data['startTime'];
      result$data['startTime'] = (l$startTime as num?)?.toDouble();
    }
    if (data.containsKey('endTime')) {
      final l$endTime = data['endTime'];
      result$data['endTime'] = (l$endTime as num?)?.toDouble();
    }
    return Input$ActivityUpdateInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  String? get customerId => (_$data['customerId'] as String?);
  String? get projectId => (_$data['projectId'] as String?);
  String? get description => (_$data['description'] as String?);
  double? get startTime => (_$data['startTime'] as double?);
  double? get endTime => (_$data['endTime'] as double?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('customerId')) {
      final l$customerId = customerId;
      result$data['customerId'] = l$customerId;
    }
    if (_$data.containsKey('projectId')) {
      final l$projectId = projectId;
      result$data['projectId'] = l$projectId;
    }
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    if (_$data.containsKey('startTime')) {
      final l$startTime = startTime;
      result$data['startTime'] = l$startTime;
    }
    if (_$data.containsKey('endTime')) {
      final l$endTime = endTime;
      result$data['endTime'] = l$endTime;
    }
    return result$data;
  }

  CopyWith$Input$ActivityUpdateInput<Input$ActivityUpdateInput> get copyWith =>
      CopyWith$Input$ActivityUpdateInput(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$ActivityUpdateInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$customerId = customerId;
    final lOther$customerId = other.customerId;
    if (_$data.containsKey('customerId') !=
        other._$data.containsKey('customerId')) {
      return false;
    }
    if (l$customerId != lOther$customerId) {
      return false;
    }
    final l$projectId = projectId;
    final lOther$projectId = other.projectId;
    if (_$data.containsKey('projectId') !=
        other._$data.containsKey('projectId')) {
      return false;
    }
    if (l$projectId != lOther$projectId) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (_$data.containsKey('description') !=
        other._$data.containsKey('description')) {
      return false;
    }
    if (l$description != lOther$description) {
      return false;
    }
    final l$startTime = startTime;
    final lOther$startTime = other.startTime;
    if (_$data.containsKey('startTime') !=
        other._$data.containsKey('startTime')) {
      return false;
    }
    if (l$startTime != lOther$startTime) {
      return false;
    }
    final l$endTime = endTime;
    final lOther$endTime = other.endTime;
    if (_$data.containsKey('endTime') != other._$data.containsKey('endTime')) {
      return false;
    }
    if (l$endTime != lOther$endTime) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$customerId = customerId;
    final l$projectId = projectId;
    final l$description = description;
    final l$startTime = startTime;
    final l$endTime = endTime;
    return Object.hashAll([
      l$id,
      _$data.containsKey('customerId') ? l$customerId : const {},
      _$data.containsKey('projectId') ? l$projectId : const {},
      _$data.containsKey('description') ? l$description : const {},
      _$data.containsKey('startTime') ? l$startTime : const {},
      _$data.containsKey('endTime') ? l$endTime : const {},
    ]);
  }
}

abstract class CopyWith$Input$ActivityUpdateInput<TRes> {
  factory CopyWith$Input$ActivityUpdateInput(
    Input$ActivityUpdateInput instance,
    TRes Function(Input$ActivityUpdateInput) then,
  ) = _CopyWithImpl$Input$ActivityUpdateInput;

  factory CopyWith$Input$ActivityUpdateInput.stub(TRes res) =
      _CopyWithStubImpl$Input$ActivityUpdateInput;

  TRes call({
    String? id,
    String? customerId,
    String? projectId,
    String? description,
    double? startTime,
    double? endTime,
  });
}

class _CopyWithImpl$Input$ActivityUpdateInput<TRes>
    implements CopyWith$Input$ActivityUpdateInput<TRes> {
  _CopyWithImpl$Input$ActivityUpdateInput(
    this._instance,
    this._then,
  );

  final Input$ActivityUpdateInput _instance;

  final TRes Function(Input$ActivityUpdateInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? customerId = _undefined,
    Object? projectId = _undefined,
    Object? description = _undefined,
    Object? startTime = _undefined,
    Object? endTime = _undefined,
  }) =>
      _then(Input$ActivityUpdateInput._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
        if (customerId != _undefined) 'customerId': (customerId as String?),
        if (projectId != _undefined) 'projectId': (projectId as String?),
        if (description != _undefined) 'description': (description as String?),
        if (startTime != _undefined) 'startTime': (startTime as double?),
        if (endTime != _undefined) 'endTime': (endTime as double?),
      }));
}

class _CopyWithStubImpl$Input$ActivityUpdateInput<TRes>
    implements CopyWith$Input$ActivityUpdateInput<TRes> {
  _CopyWithStubImpl$Input$ActivityUpdateInput(this._res);

  TRes _res;

  call({
    String? id,
    String? customerId,
    String? projectId,
    String? description,
    double? startTime,
    double? endTime,
  }) =>
      _res;
}

class Input$AuthenticationLoginInput {
  factory Input$AuthenticationLoginInput({
    required String email,
    required String password,
  }) =>
      Input$AuthenticationLoginInput._({
        r'email': email,
        r'password': password,
      });

  Input$AuthenticationLoginInput._(this._$data);

  factory Input$AuthenticationLoginInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    final l$password = data['password'];
    result$data['password'] = (l$password as String);
    return Input$AuthenticationLoginInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get email => (_$data['email'] as String);
  String get password => (_$data['password'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$email = email;
    result$data['email'] = l$email;
    final l$password = password;
    result$data['password'] = l$password;
    return result$data;
  }

  CopyWith$Input$AuthenticationLoginInput<Input$AuthenticationLoginInput>
      get copyWith => CopyWith$Input$AuthenticationLoginInput(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$AuthenticationLoginInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$password = password;
    final lOther$password = other.password;
    if (l$password != lOther$password) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$email = email;
    final l$password = password;
    return Object.hashAll([
      l$email,
      l$password,
    ]);
  }
}

abstract class CopyWith$Input$AuthenticationLoginInput<TRes> {
  factory CopyWith$Input$AuthenticationLoginInput(
    Input$AuthenticationLoginInput instance,
    TRes Function(Input$AuthenticationLoginInput) then,
  ) = _CopyWithImpl$Input$AuthenticationLoginInput;

  factory CopyWith$Input$AuthenticationLoginInput.stub(TRes res) =
      _CopyWithStubImpl$Input$AuthenticationLoginInput;

  TRes call({
    String? email,
    String? password,
  });
}

class _CopyWithImpl$Input$AuthenticationLoginInput<TRes>
    implements CopyWith$Input$AuthenticationLoginInput<TRes> {
  _CopyWithImpl$Input$AuthenticationLoginInput(
    this._instance,
    this._then,
  );

  final Input$AuthenticationLoginInput _instance;

  final TRes Function(Input$AuthenticationLoginInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? email = _undefined,
    Object? password = _undefined,
  }) =>
      _then(Input$AuthenticationLoginInput._({
        ..._instance._$data,
        if (email != _undefined && email != null) 'email': (email as String),
        if (password != _undefined && password != null)
          'password': (password as String),
      }));
}

class _CopyWithStubImpl$Input$AuthenticationLoginInput<TRes>
    implements CopyWith$Input$AuthenticationLoginInput<TRes> {
  _CopyWithStubImpl$Input$AuthenticationLoginInput(this._res);

  TRes _res;

  call({
    String? email,
    String? password,
  }) =>
      _res;
}

class Input$CustomerCreateInput {
  factory Input$CustomerCreateInput({
    required String name,
    String? color,
    List<String>? projectsIds,
  }) =>
      Input$CustomerCreateInput._({
        r'name': name,
        if (color != null) r'color': color,
        if (projectsIds != null) r'projectsIds': projectsIds,
      });

  Input$CustomerCreateInput._(this._$data);

  factory Input$CustomerCreateInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    if (data.containsKey('color')) {
      final l$color = data['color'];
      result$data['color'] = (l$color as String?);
    }
    if (data.containsKey('projectsIds')) {
      final l$projectsIds = data['projectsIds'];
      result$data['projectsIds'] =
          (l$projectsIds as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    return Input$CustomerCreateInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);
  String? get color => (_$data['color'] as String?);
  List<String>? get projectsIds => (_$data['projectsIds'] as List<String>?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    if (_$data.containsKey('color')) {
      final l$color = color;
      result$data['color'] = l$color;
    }
    if (_$data.containsKey('projectsIds')) {
      final l$projectsIds = projectsIds;
      result$data['projectsIds'] = l$projectsIds?.map((e) => e).toList();
    }
    return result$data;
  }

  CopyWith$Input$CustomerCreateInput<Input$CustomerCreateInput> get copyWith =>
      CopyWith$Input$CustomerCreateInput(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$CustomerCreateInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$color = color;
    final lOther$color = other.color;
    if (_$data.containsKey('color') != other._$data.containsKey('color')) {
      return false;
    }
    if (l$color != lOther$color) {
      return false;
    }
    final l$projectsIds = projectsIds;
    final lOther$projectsIds = other.projectsIds;
    if (_$data.containsKey('projectsIds') !=
        other._$data.containsKey('projectsIds')) {
      return false;
    }
    if (l$projectsIds != null && lOther$projectsIds != null) {
      if (l$projectsIds.length != lOther$projectsIds.length) {
        return false;
      }
      for (int i = 0; i < l$projectsIds.length; i++) {
        final l$projectsIds$entry = l$projectsIds[i];
        final lOther$projectsIds$entry = lOther$projectsIds[i];
        if (l$projectsIds$entry != lOther$projectsIds$entry) {
          return false;
        }
      }
    } else if (l$projectsIds != lOther$projectsIds) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$color = color;
    final l$projectsIds = projectsIds;
    return Object.hashAll([
      l$name,
      _$data.containsKey('color') ? l$color : const {},
      _$data.containsKey('projectsIds')
          ? l$projectsIds == null
              ? null
              : Object.hashAll(l$projectsIds.map((v) => v))
          : const {},
    ]);
  }
}

abstract class CopyWith$Input$CustomerCreateInput<TRes> {
  factory CopyWith$Input$CustomerCreateInput(
    Input$CustomerCreateInput instance,
    TRes Function(Input$CustomerCreateInput) then,
  ) = _CopyWithImpl$Input$CustomerCreateInput;

  factory CopyWith$Input$CustomerCreateInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CustomerCreateInput;

  TRes call({
    String? name,
    String? color,
    List<String>? projectsIds,
  });
}

class _CopyWithImpl$Input$CustomerCreateInput<TRes>
    implements CopyWith$Input$CustomerCreateInput<TRes> {
  _CopyWithImpl$Input$CustomerCreateInput(
    this._instance,
    this._then,
  );

  final Input$CustomerCreateInput _instance;

  final TRes Function(Input$CustomerCreateInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? color = _undefined,
    Object? projectsIds = _undefined,
  }) =>
      _then(Input$CustomerCreateInput._({
        ..._instance._$data,
        if (name != _undefined && name != null) 'name': (name as String),
        if (color != _undefined) 'color': (color as String?),
        if (projectsIds != _undefined)
          'projectsIds': (projectsIds as List<String>?),
      }));
}

class _CopyWithStubImpl$Input$CustomerCreateInput<TRes>
    implements CopyWith$Input$CustomerCreateInput<TRes> {
  _CopyWithStubImpl$Input$CustomerCreateInput(this._res);

  TRes _res;

  call({
    String? name,
    String? color,
    List<String>? projectsIds,
  }) =>
      _res;
}

class Input$CustomerDeleteInput {
  factory Input$CustomerDeleteInput({required String id}) =>
      Input$CustomerDeleteInput._({
        r'id': id,
      });

  Input$CustomerDeleteInput._(this._$data);

  factory Input$CustomerDeleteInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Input$CustomerDeleteInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Input$CustomerDeleteInput<Input$CustomerDeleteInput> get copyWith =>
      CopyWith$Input$CustomerDeleteInput(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$CustomerDeleteInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Input$CustomerDeleteInput<TRes> {
  factory CopyWith$Input$CustomerDeleteInput(
    Input$CustomerDeleteInput instance,
    TRes Function(Input$CustomerDeleteInput) then,
  ) = _CopyWithImpl$Input$CustomerDeleteInput;

  factory CopyWith$Input$CustomerDeleteInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CustomerDeleteInput;

  TRes call({String? id});
}

class _CopyWithImpl$Input$CustomerDeleteInput<TRes>
    implements CopyWith$Input$CustomerDeleteInput<TRes> {
  _CopyWithImpl$Input$CustomerDeleteInput(
    this._instance,
    this._then,
  );

  final Input$CustomerDeleteInput _instance;

  final TRes Function(Input$CustomerDeleteInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(Input$CustomerDeleteInput._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Input$CustomerDeleteInput<TRes>
    implements CopyWith$Input$CustomerDeleteInput<TRes> {
  _CopyWithStubImpl$Input$CustomerDeleteInput(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Input$CustomerFilter {
  factory Input$CustomerFilter({
    List<String>? ids,
    String? name,
    List<String>? projectsIds,
    bool? isActive,
    Enum$CustomerSortEnum? sortBy,
    Enum$SortDirectionEnum? sortDirection,
  }) =>
      Input$CustomerFilter._({
        if (ids != null) r'ids': ids,
        if (name != null) r'name': name,
        if (projectsIds != null) r'projectsIds': projectsIds,
        if (isActive != null) r'isActive': isActive,
        if (sortBy != null) r'sortBy': sortBy,
        if (sortDirection != null) r'sortDirection': sortDirection,
      });

  Input$CustomerFilter._(this._$data);

  factory Input$CustomerFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('ids')) {
      final l$ids = data['ids'];
      result$data['ids'] =
          (l$ids as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('projectsIds')) {
      final l$projectsIds = data['projectsIds'];
      result$data['projectsIds'] =
          (l$projectsIds as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('isActive')) {
      final l$isActive = data['isActive'];
      result$data['isActive'] = (l$isActive as bool?);
    }
    if (data.containsKey('sortBy')) {
      final l$sortBy = data['sortBy'];
      result$data['sortBy'] = l$sortBy == null
          ? null
          : fromJson$Enum$CustomerSortEnum((l$sortBy as String));
    }
    if (data.containsKey('sortDirection')) {
      final l$sortDirection = data['sortDirection'];
      result$data['sortDirection'] = l$sortDirection == null
          ? null
          : fromJson$Enum$SortDirectionEnum((l$sortDirection as String));
    }
    return Input$CustomerFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  List<String>? get ids => (_$data['ids'] as List<String>?);
  String? get name => (_$data['name'] as String?);
  List<String>? get projectsIds => (_$data['projectsIds'] as List<String>?);
  bool? get isActive => (_$data['isActive'] as bool?);
  Enum$CustomerSortEnum? get sortBy =>
      (_$data['sortBy'] as Enum$CustomerSortEnum?);
  Enum$SortDirectionEnum? get sortDirection =>
      (_$data['sortDirection'] as Enum$SortDirectionEnum?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('ids')) {
      final l$ids = ids;
      result$data['ids'] = l$ids?.map((e) => e).toList();
    }
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('projectsIds')) {
      final l$projectsIds = projectsIds;
      result$data['projectsIds'] = l$projectsIds?.map((e) => e).toList();
    }
    if (_$data.containsKey('isActive')) {
      final l$isActive = isActive;
      result$data['isActive'] = l$isActive;
    }
    if (_$data.containsKey('sortBy')) {
      final l$sortBy = sortBy;
      result$data['sortBy'] =
          l$sortBy == null ? null : toJson$Enum$CustomerSortEnum(l$sortBy);
    }
    if (_$data.containsKey('sortDirection')) {
      final l$sortDirection = sortDirection;
      result$data['sortDirection'] = l$sortDirection == null
          ? null
          : toJson$Enum$SortDirectionEnum(l$sortDirection);
    }
    return result$data;
  }

  CopyWith$Input$CustomerFilter<Input$CustomerFilter> get copyWith =>
      CopyWith$Input$CustomerFilter(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$CustomerFilter) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$ids = ids;
    final lOther$ids = other.ids;
    if (_$data.containsKey('ids') != other._$data.containsKey('ids')) {
      return false;
    }
    if (l$ids != null && lOther$ids != null) {
      if (l$ids.length != lOther$ids.length) {
        return false;
      }
      for (int i = 0; i < l$ids.length; i++) {
        final l$ids$entry = l$ids[i];
        final lOther$ids$entry = lOther$ids[i];
        if (l$ids$entry != lOther$ids$entry) {
          return false;
        }
      }
    } else if (l$ids != lOther$ids) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$projectsIds = projectsIds;
    final lOther$projectsIds = other.projectsIds;
    if (_$data.containsKey('projectsIds') !=
        other._$data.containsKey('projectsIds')) {
      return false;
    }
    if (l$projectsIds != null && lOther$projectsIds != null) {
      if (l$projectsIds.length != lOther$projectsIds.length) {
        return false;
      }
      for (int i = 0; i < l$projectsIds.length; i++) {
        final l$projectsIds$entry = l$projectsIds[i];
        final lOther$projectsIds$entry = lOther$projectsIds[i];
        if (l$projectsIds$entry != lOther$projectsIds$entry) {
          return false;
        }
      }
    } else if (l$projectsIds != lOther$projectsIds) {
      return false;
    }
    final l$isActive = isActive;
    final lOther$isActive = other.isActive;
    if (_$data.containsKey('isActive') !=
        other._$data.containsKey('isActive')) {
      return false;
    }
    if (l$isActive != lOther$isActive) {
      return false;
    }
    final l$sortBy = sortBy;
    final lOther$sortBy = other.sortBy;
    if (_$data.containsKey('sortBy') != other._$data.containsKey('sortBy')) {
      return false;
    }
    if (l$sortBy != lOther$sortBy) {
      return false;
    }
    final l$sortDirection = sortDirection;
    final lOther$sortDirection = other.sortDirection;
    if (_$data.containsKey('sortDirection') !=
        other._$data.containsKey('sortDirection')) {
      return false;
    }
    if (l$sortDirection != lOther$sortDirection) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$ids = ids;
    final l$name = name;
    final l$projectsIds = projectsIds;
    final l$isActive = isActive;
    final l$sortBy = sortBy;
    final l$sortDirection = sortDirection;
    return Object.hashAll([
      _$data.containsKey('ids')
          ? l$ids == null
              ? null
              : Object.hashAll(l$ids.map((v) => v))
          : const {},
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('projectsIds')
          ? l$projectsIds == null
              ? null
              : Object.hashAll(l$projectsIds.map((v) => v))
          : const {},
      _$data.containsKey('isActive') ? l$isActive : const {},
      _$data.containsKey('sortBy') ? l$sortBy : const {},
      _$data.containsKey('sortDirection') ? l$sortDirection : const {},
    ]);
  }
}

abstract class CopyWith$Input$CustomerFilter<TRes> {
  factory CopyWith$Input$CustomerFilter(
    Input$CustomerFilter instance,
    TRes Function(Input$CustomerFilter) then,
  ) = _CopyWithImpl$Input$CustomerFilter;

  factory CopyWith$Input$CustomerFilter.stub(TRes res) =
      _CopyWithStubImpl$Input$CustomerFilter;

  TRes call({
    List<String>? ids,
    String? name,
    List<String>? projectsIds,
    bool? isActive,
    Enum$CustomerSortEnum? sortBy,
    Enum$SortDirectionEnum? sortDirection,
  });
}

class _CopyWithImpl$Input$CustomerFilter<TRes>
    implements CopyWith$Input$CustomerFilter<TRes> {
  _CopyWithImpl$Input$CustomerFilter(
    this._instance,
    this._then,
  );

  final Input$CustomerFilter _instance;

  final TRes Function(Input$CustomerFilter) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? ids = _undefined,
    Object? name = _undefined,
    Object? projectsIds = _undefined,
    Object? isActive = _undefined,
    Object? sortBy = _undefined,
    Object? sortDirection = _undefined,
  }) =>
      _then(Input$CustomerFilter._({
        ..._instance._$data,
        if (ids != _undefined) 'ids': (ids as List<String>?),
        if (name != _undefined) 'name': (name as String?),
        if (projectsIds != _undefined)
          'projectsIds': (projectsIds as List<String>?),
        if (isActive != _undefined) 'isActive': (isActive as bool?),
        if (sortBy != _undefined) 'sortBy': (sortBy as Enum$CustomerSortEnum?),
        if (sortDirection != _undefined)
          'sortDirection': (sortDirection as Enum$SortDirectionEnum?),
      }));
}

class _CopyWithStubImpl$Input$CustomerFilter<TRes>
    implements CopyWith$Input$CustomerFilter<TRes> {
  _CopyWithStubImpl$Input$CustomerFilter(this._res);

  TRes _res;

  call({
    List<String>? ids,
    String? name,
    List<String>? projectsIds,
    bool? isActive,
    Enum$CustomerSortEnum? sortBy,
    Enum$SortDirectionEnum? sortDirection,
  }) =>
      _res;
}

class Input$CustomerUpdateInput {
  factory Input$CustomerUpdateInput({
    required String id,
    String? name,
    String? color,
    List<String>? projectsIds,
    bool? isActive,
  }) =>
      Input$CustomerUpdateInput._({
        r'id': id,
        if (name != null) r'name': name,
        if (color != null) r'color': color,
        if (projectsIds != null) r'projectsIds': projectsIds,
        if (isActive != null) r'isActive': isActive,
      });

  Input$CustomerUpdateInput._(this._$data);

  factory Input$CustomerUpdateInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('color')) {
      final l$color = data['color'];
      result$data['color'] = (l$color as String?);
    }
    if (data.containsKey('projectsIds')) {
      final l$projectsIds = data['projectsIds'];
      result$data['projectsIds'] =
          (l$projectsIds as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('isActive')) {
      final l$isActive = data['isActive'];
      result$data['isActive'] = (l$isActive as bool?);
    }
    return Input$CustomerUpdateInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  String? get name => (_$data['name'] as String?);
  String? get color => (_$data['color'] as String?);
  List<String>? get projectsIds => (_$data['projectsIds'] as List<String>?);
  bool? get isActive => (_$data['isActive'] as bool?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('color')) {
      final l$color = color;
      result$data['color'] = l$color;
    }
    if (_$data.containsKey('projectsIds')) {
      final l$projectsIds = projectsIds;
      result$data['projectsIds'] = l$projectsIds?.map((e) => e).toList();
    }
    if (_$data.containsKey('isActive')) {
      final l$isActive = isActive;
      result$data['isActive'] = l$isActive;
    }
    return result$data;
  }

  CopyWith$Input$CustomerUpdateInput<Input$CustomerUpdateInput> get copyWith =>
      CopyWith$Input$CustomerUpdateInput(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$CustomerUpdateInput) ||
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
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$color = color;
    final lOther$color = other.color;
    if (_$data.containsKey('color') != other._$data.containsKey('color')) {
      return false;
    }
    if (l$color != lOther$color) {
      return false;
    }
    final l$projectsIds = projectsIds;
    final lOther$projectsIds = other.projectsIds;
    if (_$data.containsKey('projectsIds') !=
        other._$data.containsKey('projectsIds')) {
      return false;
    }
    if (l$projectsIds != null && lOther$projectsIds != null) {
      if (l$projectsIds.length != lOther$projectsIds.length) {
        return false;
      }
      for (int i = 0; i < l$projectsIds.length; i++) {
        final l$projectsIds$entry = l$projectsIds[i];
        final lOther$projectsIds$entry = lOther$projectsIds[i];
        if (l$projectsIds$entry != lOther$projectsIds$entry) {
          return false;
        }
      }
    } else if (l$projectsIds != lOther$projectsIds) {
      return false;
    }
    final l$isActive = isActive;
    final lOther$isActive = other.isActive;
    if (_$data.containsKey('isActive') !=
        other._$data.containsKey('isActive')) {
      return false;
    }
    if (l$isActive != lOther$isActive) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$color = color;
    final l$projectsIds = projectsIds;
    final l$isActive = isActive;
    return Object.hashAll([
      l$id,
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('color') ? l$color : const {},
      _$data.containsKey('projectsIds')
          ? l$projectsIds == null
              ? null
              : Object.hashAll(l$projectsIds.map((v) => v))
          : const {},
      _$data.containsKey('isActive') ? l$isActive : const {},
    ]);
  }
}

abstract class CopyWith$Input$CustomerUpdateInput<TRes> {
  factory CopyWith$Input$CustomerUpdateInput(
    Input$CustomerUpdateInput instance,
    TRes Function(Input$CustomerUpdateInput) then,
  ) = _CopyWithImpl$Input$CustomerUpdateInput;

  factory CopyWith$Input$CustomerUpdateInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CustomerUpdateInput;

  TRes call({
    String? id,
    String? name,
    String? color,
    List<String>? projectsIds,
    bool? isActive,
  });
}

class _CopyWithImpl$Input$CustomerUpdateInput<TRes>
    implements CopyWith$Input$CustomerUpdateInput<TRes> {
  _CopyWithImpl$Input$CustomerUpdateInput(
    this._instance,
    this._then,
  );

  final Input$CustomerUpdateInput _instance;

  final TRes Function(Input$CustomerUpdateInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? color = _undefined,
    Object? projectsIds = _undefined,
    Object? isActive = _undefined,
  }) =>
      _then(Input$CustomerUpdateInput._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
        if (name != _undefined) 'name': (name as String?),
        if (color != _undefined) 'color': (color as String?),
        if (projectsIds != _undefined)
          'projectsIds': (projectsIds as List<String>?),
        if (isActive != _undefined) 'isActive': (isActive as bool?),
      }));
}

class _CopyWithStubImpl$Input$CustomerUpdateInput<TRes>
    implements CopyWith$Input$CustomerUpdateInput<TRes> {
  _CopyWithStubImpl$Input$CustomerUpdateInput(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? color,
    List<String>? projectsIds,
    bool? isActive,
  }) =>
      _res;
}

class Input$OrganizationCreateInput {
  factory Input$OrganizationCreateInput({required String name}) =>
      Input$OrganizationCreateInput._({
        r'name': name,
      });

  Input$OrganizationCreateInput._(this._$data);

  factory Input$OrganizationCreateInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    return Input$OrganizationCreateInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    return result$data;
  }

  CopyWith$Input$OrganizationCreateInput<Input$OrganizationCreateInput>
      get copyWith => CopyWith$Input$OrganizationCreateInput(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$OrganizationCreateInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    return Object.hashAll([l$name]);
  }
}

abstract class CopyWith$Input$OrganizationCreateInput<TRes> {
  factory CopyWith$Input$OrganizationCreateInput(
    Input$OrganizationCreateInput instance,
    TRes Function(Input$OrganizationCreateInput) then,
  ) = _CopyWithImpl$Input$OrganizationCreateInput;

  factory CopyWith$Input$OrganizationCreateInput.stub(TRes res) =
      _CopyWithStubImpl$Input$OrganizationCreateInput;

  TRes call({String? name});
}

class _CopyWithImpl$Input$OrganizationCreateInput<TRes>
    implements CopyWith$Input$OrganizationCreateInput<TRes> {
  _CopyWithImpl$Input$OrganizationCreateInput(
    this._instance,
    this._then,
  );

  final Input$OrganizationCreateInput _instance;

  final TRes Function(Input$OrganizationCreateInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? name = _undefined}) =>
      _then(Input$OrganizationCreateInput._({
        ..._instance._$data,
        if (name != _undefined && name != null) 'name': (name as String),
      }));
}

class _CopyWithStubImpl$Input$OrganizationCreateInput<TRes>
    implements CopyWith$Input$OrganizationCreateInput<TRes> {
  _CopyWithStubImpl$Input$OrganizationCreateInput(this._res);

  TRes _res;

  call({String? name}) => _res;
}

class Input$OrganizationDeleteInput {
  factory Input$OrganizationDeleteInput({required String id}) =>
      Input$OrganizationDeleteInput._({
        r'id': id,
      });

  Input$OrganizationDeleteInput._(this._$data);

  factory Input$OrganizationDeleteInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Input$OrganizationDeleteInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Input$OrganizationDeleteInput<Input$OrganizationDeleteInput>
      get copyWith => CopyWith$Input$OrganizationDeleteInput(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$OrganizationDeleteInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Input$OrganizationDeleteInput<TRes> {
  factory CopyWith$Input$OrganizationDeleteInput(
    Input$OrganizationDeleteInput instance,
    TRes Function(Input$OrganizationDeleteInput) then,
  ) = _CopyWithImpl$Input$OrganizationDeleteInput;

  factory CopyWith$Input$OrganizationDeleteInput.stub(TRes res) =
      _CopyWithStubImpl$Input$OrganizationDeleteInput;

  TRes call({String? id});
}

class _CopyWithImpl$Input$OrganizationDeleteInput<TRes>
    implements CopyWith$Input$OrganizationDeleteInput<TRes> {
  _CopyWithImpl$Input$OrganizationDeleteInput(
    this._instance,
    this._then,
  );

  final Input$OrganizationDeleteInput _instance;

  final TRes Function(Input$OrganizationDeleteInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) =>
      _then(Input$OrganizationDeleteInput._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Input$OrganizationDeleteInput<TRes>
    implements CopyWith$Input$OrganizationDeleteInput<TRes> {
  _CopyWithStubImpl$Input$OrganizationDeleteInput(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Input$OrganizationFilter {
  factory Input$OrganizationFilter({
    String? name,
    Enum$OrganizationSortEnum? sortBy,
    Enum$SortDirectionEnum? sortDirection,
  }) =>
      Input$OrganizationFilter._({
        if (name != null) r'name': name,
        if (sortBy != null) r'sortBy': sortBy,
        if (sortDirection != null) r'sortDirection': sortDirection,
      });

  Input$OrganizationFilter._(this._$data);

  factory Input$OrganizationFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('sortBy')) {
      final l$sortBy = data['sortBy'];
      result$data['sortBy'] = l$sortBy == null
          ? null
          : fromJson$Enum$OrganizationSortEnum((l$sortBy as String));
    }
    if (data.containsKey('sortDirection')) {
      final l$sortDirection = data['sortDirection'];
      result$data['sortDirection'] = l$sortDirection == null
          ? null
          : fromJson$Enum$SortDirectionEnum((l$sortDirection as String));
    }
    return Input$OrganizationFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get name => (_$data['name'] as String?);
  Enum$OrganizationSortEnum? get sortBy =>
      (_$data['sortBy'] as Enum$OrganizationSortEnum?);
  Enum$SortDirectionEnum? get sortDirection =>
      (_$data['sortDirection'] as Enum$SortDirectionEnum?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('sortBy')) {
      final l$sortBy = sortBy;
      result$data['sortBy'] =
          l$sortBy == null ? null : toJson$Enum$OrganizationSortEnum(l$sortBy);
    }
    if (_$data.containsKey('sortDirection')) {
      final l$sortDirection = sortDirection;
      result$data['sortDirection'] = l$sortDirection == null
          ? null
          : toJson$Enum$SortDirectionEnum(l$sortDirection);
    }
    return result$data;
  }

  CopyWith$Input$OrganizationFilter<Input$OrganizationFilter> get copyWith =>
      CopyWith$Input$OrganizationFilter(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$OrganizationFilter) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$sortBy = sortBy;
    final lOther$sortBy = other.sortBy;
    if (_$data.containsKey('sortBy') != other._$data.containsKey('sortBy')) {
      return false;
    }
    if (l$sortBy != lOther$sortBy) {
      return false;
    }
    final l$sortDirection = sortDirection;
    final lOther$sortDirection = other.sortDirection;
    if (_$data.containsKey('sortDirection') !=
        other._$data.containsKey('sortDirection')) {
      return false;
    }
    if (l$sortDirection != lOther$sortDirection) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$sortBy = sortBy;
    final l$sortDirection = sortDirection;
    return Object.hashAll([
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('sortBy') ? l$sortBy : const {},
      _$data.containsKey('sortDirection') ? l$sortDirection : const {},
    ]);
  }
}

abstract class CopyWith$Input$OrganizationFilter<TRes> {
  factory CopyWith$Input$OrganizationFilter(
    Input$OrganizationFilter instance,
    TRes Function(Input$OrganizationFilter) then,
  ) = _CopyWithImpl$Input$OrganizationFilter;

  factory CopyWith$Input$OrganizationFilter.stub(TRes res) =
      _CopyWithStubImpl$Input$OrganizationFilter;

  TRes call({
    String? name,
    Enum$OrganizationSortEnum? sortBy,
    Enum$SortDirectionEnum? sortDirection,
  });
}

class _CopyWithImpl$Input$OrganizationFilter<TRes>
    implements CopyWith$Input$OrganizationFilter<TRes> {
  _CopyWithImpl$Input$OrganizationFilter(
    this._instance,
    this._then,
  );

  final Input$OrganizationFilter _instance;

  final TRes Function(Input$OrganizationFilter) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? sortBy = _undefined,
    Object? sortDirection = _undefined,
  }) =>
      _then(Input$OrganizationFilter._({
        ..._instance._$data,
        if (name != _undefined) 'name': (name as String?),
        if (sortBy != _undefined)
          'sortBy': (sortBy as Enum$OrganizationSortEnum?),
        if (sortDirection != _undefined)
          'sortDirection': (sortDirection as Enum$SortDirectionEnum?),
      }));
}

class _CopyWithStubImpl$Input$OrganizationFilter<TRes>
    implements CopyWith$Input$OrganizationFilter<TRes> {
  _CopyWithStubImpl$Input$OrganizationFilter(this._res);

  TRes _res;

  call({
    String? name,
    Enum$OrganizationSortEnum? sortBy,
    Enum$SortDirectionEnum? sortDirection,
  }) =>
      _res;
}

class Input$OrganizationUpdateInput {
  factory Input$OrganizationUpdateInput({
    required String id,
    String? name,
  }) =>
      Input$OrganizationUpdateInput._({
        r'id': id,
        if (name != null) r'name': name,
      });

  Input$OrganizationUpdateInput._(this._$data);

  factory Input$OrganizationUpdateInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    return Input$OrganizationUpdateInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  String? get name => (_$data['name'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    return result$data;
  }

  CopyWith$Input$OrganizationUpdateInput<Input$OrganizationUpdateInput>
      get copyWith => CopyWith$Input$OrganizationUpdateInput(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$OrganizationUpdateInput) ||
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
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    return Object.hashAll([
      l$id,
      _$data.containsKey('name') ? l$name : const {},
    ]);
  }
}

abstract class CopyWith$Input$OrganizationUpdateInput<TRes> {
  factory CopyWith$Input$OrganizationUpdateInput(
    Input$OrganizationUpdateInput instance,
    TRes Function(Input$OrganizationUpdateInput) then,
  ) = _CopyWithImpl$Input$OrganizationUpdateInput;

  factory CopyWith$Input$OrganizationUpdateInput.stub(TRes res) =
      _CopyWithStubImpl$Input$OrganizationUpdateInput;

  TRes call({
    String? id,
    String? name,
  });
}

class _CopyWithImpl$Input$OrganizationUpdateInput<TRes>
    implements CopyWith$Input$OrganizationUpdateInput<TRes> {
  _CopyWithImpl$Input$OrganizationUpdateInput(
    this._instance,
    this._then,
  );

  final Input$OrganizationUpdateInput _instance;

  final TRes Function(Input$OrganizationUpdateInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
  }) =>
      _then(Input$OrganizationUpdateInput._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
        if (name != _undefined) 'name': (name as String?),
      }));
}

class _CopyWithStubImpl$Input$OrganizationUpdateInput<TRes>
    implements CopyWith$Input$OrganizationUpdateInput<TRes> {
  _CopyWithStubImpl$Input$OrganizationUpdateInput(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
  }) =>
      _res;
}

class Input$ProjectCreateInput {
  factory Input$ProjectCreateInput({
    required String name,
    String? color,
    String? description,
    String? tag,
  }) =>
      Input$ProjectCreateInput._({
        r'name': name,
        if (color != null) r'color': color,
        if (description != null) r'description': description,
        if (tag != null) r'tag': tag,
      });

  Input$ProjectCreateInput._(this._$data);

  factory Input$ProjectCreateInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    if (data.containsKey('color')) {
      final l$color = data['color'];
      result$data['color'] = (l$color as String?);
    }
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    if (data.containsKey('tag')) {
      final l$tag = data['tag'];
      result$data['tag'] = (l$tag as String?);
    }
    return Input$ProjectCreateInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);
  String? get color => (_$data['color'] as String?);
  String? get description => (_$data['description'] as String?);
  String? get tag => (_$data['tag'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    if (_$data.containsKey('color')) {
      final l$color = color;
      result$data['color'] = l$color;
    }
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    if (_$data.containsKey('tag')) {
      final l$tag = tag;
      result$data['tag'] = l$tag;
    }
    return result$data;
  }

  CopyWith$Input$ProjectCreateInput<Input$ProjectCreateInput> get copyWith =>
      CopyWith$Input$ProjectCreateInput(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$ProjectCreateInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$color = color;
    final lOther$color = other.color;
    if (_$data.containsKey('color') != other._$data.containsKey('color')) {
      return false;
    }
    if (l$color != lOther$color) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (_$data.containsKey('description') !=
        other._$data.containsKey('description')) {
      return false;
    }
    if (l$description != lOther$description) {
      return false;
    }
    final l$tag = tag;
    final lOther$tag = other.tag;
    if (_$data.containsKey('tag') != other._$data.containsKey('tag')) {
      return false;
    }
    if (l$tag != lOther$tag) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$color = color;
    final l$description = description;
    final l$tag = tag;
    return Object.hashAll([
      l$name,
      _$data.containsKey('color') ? l$color : const {},
      _$data.containsKey('description') ? l$description : const {},
      _$data.containsKey('tag') ? l$tag : const {},
    ]);
  }
}

abstract class CopyWith$Input$ProjectCreateInput<TRes> {
  factory CopyWith$Input$ProjectCreateInput(
    Input$ProjectCreateInput instance,
    TRes Function(Input$ProjectCreateInput) then,
  ) = _CopyWithImpl$Input$ProjectCreateInput;

  factory CopyWith$Input$ProjectCreateInput.stub(TRes res) =
      _CopyWithStubImpl$Input$ProjectCreateInput;

  TRes call({
    String? name,
    String? color,
    String? description,
    String? tag,
  });
}

class _CopyWithImpl$Input$ProjectCreateInput<TRes>
    implements CopyWith$Input$ProjectCreateInput<TRes> {
  _CopyWithImpl$Input$ProjectCreateInput(
    this._instance,
    this._then,
  );

  final Input$ProjectCreateInput _instance;

  final TRes Function(Input$ProjectCreateInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? color = _undefined,
    Object? description = _undefined,
    Object? tag = _undefined,
  }) =>
      _then(Input$ProjectCreateInput._({
        ..._instance._$data,
        if (name != _undefined && name != null) 'name': (name as String),
        if (color != _undefined) 'color': (color as String?),
        if (description != _undefined) 'description': (description as String?),
        if (tag != _undefined) 'tag': (tag as String?),
      }));
}

class _CopyWithStubImpl$Input$ProjectCreateInput<TRes>
    implements CopyWith$Input$ProjectCreateInput<TRes> {
  _CopyWithStubImpl$Input$ProjectCreateInput(this._res);

  TRes _res;

  call({
    String? name,
    String? color,
    String? description,
    String? tag,
  }) =>
      _res;
}

class Input$ProjectDeleteInput {
  factory Input$ProjectDeleteInput({required String id}) =>
      Input$ProjectDeleteInput._({
        r'id': id,
      });

  Input$ProjectDeleteInput._(this._$data);

  factory Input$ProjectDeleteInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Input$ProjectDeleteInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Input$ProjectDeleteInput<Input$ProjectDeleteInput> get copyWith =>
      CopyWith$Input$ProjectDeleteInput(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$ProjectDeleteInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Input$ProjectDeleteInput<TRes> {
  factory CopyWith$Input$ProjectDeleteInput(
    Input$ProjectDeleteInput instance,
    TRes Function(Input$ProjectDeleteInput) then,
  ) = _CopyWithImpl$Input$ProjectDeleteInput;

  factory CopyWith$Input$ProjectDeleteInput.stub(TRes res) =
      _CopyWithStubImpl$Input$ProjectDeleteInput;

  TRes call({String? id});
}

class _CopyWithImpl$Input$ProjectDeleteInput<TRes>
    implements CopyWith$Input$ProjectDeleteInput<TRes> {
  _CopyWithImpl$Input$ProjectDeleteInput(
    this._instance,
    this._then,
  );

  final Input$ProjectDeleteInput _instance;

  final TRes Function(Input$ProjectDeleteInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(Input$ProjectDeleteInput._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Input$ProjectDeleteInput<TRes>
    implements CopyWith$Input$ProjectDeleteInput<TRes> {
  _CopyWithStubImpl$Input$ProjectDeleteInput(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Input$ProjectFilter {
  factory Input$ProjectFilter({
    List<String>? ids,
    String? name,
    List<Enum$ProjectStatusEnum>? status,
    List<String>? tag,
    Enum$ProjectSortEnum? sortBy,
    Enum$SortDirectionEnum? sortDirection,
  }) =>
      Input$ProjectFilter._({
        if (ids != null) r'ids': ids,
        if (name != null) r'name': name,
        if (status != null) r'status': status,
        if (tag != null) r'tag': tag,
        if (sortBy != null) r'sortBy': sortBy,
        if (sortDirection != null) r'sortDirection': sortDirection,
      });

  Input$ProjectFilter._(this._$data);

  factory Input$ProjectFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('ids')) {
      final l$ids = data['ids'];
      result$data['ids'] =
          (l$ids as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = (l$status as List<dynamic>?)
          ?.map((e) => fromJson$Enum$ProjectStatusEnum((e as String)))
          .toList();
    }
    if (data.containsKey('tag')) {
      final l$tag = data['tag'];
      result$data['tag'] =
          (l$tag as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('sortBy')) {
      final l$sortBy = data['sortBy'];
      result$data['sortBy'] = l$sortBy == null
          ? null
          : fromJson$Enum$ProjectSortEnum((l$sortBy as String));
    }
    if (data.containsKey('sortDirection')) {
      final l$sortDirection = data['sortDirection'];
      result$data['sortDirection'] = l$sortDirection == null
          ? null
          : fromJson$Enum$SortDirectionEnum((l$sortDirection as String));
    }
    return Input$ProjectFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  List<String>? get ids => (_$data['ids'] as List<String>?);
  String? get name => (_$data['name'] as String?);
  List<Enum$ProjectStatusEnum>? get status =>
      (_$data['status'] as List<Enum$ProjectStatusEnum>?);
  List<String>? get tag => (_$data['tag'] as List<String>?);
  Enum$ProjectSortEnum? get sortBy =>
      (_$data['sortBy'] as Enum$ProjectSortEnum?);
  Enum$SortDirectionEnum? get sortDirection =>
      (_$data['sortDirection'] as Enum$SortDirectionEnum?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('ids')) {
      final l$ids = ids;
      result$data['ids'] = l$ids?.map((e) => e).toList();
    }
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] =
          l$status?.map((e) => toJson$Enum$ProjectStatusEnum(e)).toList();
    }
    if (_$data.containsKey('tag')) {
      final l$tag = tag;
      result$data['tag'] = l$tag?.map((e) => e).toList();
    }
    if (_$data.containsKey('sortBy')) {
      final l$sortBy = sortBy;
      result$data['sortBy'] =
          l$sortBy == null ? null : toJson$Enum$ProjectSortEnum(l$sortBy);
    }
    if (_$data.containsKey('sortDirection')) {
      final l$sortDirection = sortDirection;
      result$data['sortDirection'] = l$sortDirection == null
          ? null
          : toJson$Enum$SortDirectionEnum(l$sortDirection);
    }
    return result$data;
  }

  CopyWith$Input$ProjectFilter<Input$ProjectFilter> get copyWith =>
      CopyWith$Input$ProjectFilter(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$ProjectFilter) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$ids = ids;
    final lOther$ids = other.ids;
    if (_$data.containsKey('ids') != other._$data.containsKey('ids')) {
      return false;
    }
    if (l$ids != null && lOther$ids != null) {
      if (l$ids.length != lOther$ids.length) {
        return false;
      }
      for (int i = 0; i < l$ids.length; i++) {
        final l$ids$entry = l$ids[i];
        final lOther$ids$entry = lOther$ids[i];
        if (l$ids$entry != lOther$ids$entry) {
          return false;
        }
      }
    } else if (l$ids != lOther$ids) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (_$data.containsKey('status') != other._$data.containsKey('status')) {
      return false;
    }
    if (l$status != null && lOther$status != null) {
      if (l$status.length != lOther$status.length) {
        return false;
      }
      for (int i = 0; i < l$status.length; i++) {
        final l$status$entry = l$status[i];
        final lOther$status$entry = lOther$status[i];
        if (l$status$entry != lOther$status$entry) {
          return false;
        }
      }
    } else if (l$status != lOther$status) {
      return false;
    }
    final l$tag = tag;
    final lOther$tag = other.tag;
    if (_$data.containsKey('tag') != other._$data.containsKey('tag')) {
      return false;
    }
    if (l$tag != null && lOther$tag != null) {
      if (l$tag.length != lOther$tag.length) {
        return false;
      }
      for (int i = 0; i < l$tag.length; i++) {
        final l$tag$entry = l$tag[i];
        final lOther$tag$entry = lOther$tag[i];
        if (l$tag$entry != lOther$tag$entry) {
          return false;
        }
      }
    } else if (l$tag != lOther$tag) {
      return false;
    }
    final l$sortBy = sortBy;
    final lOther$sortBy = other.sortBy;
    if (_$data.containsKey('sortBy') != other._$data.containsKey('sortBy')) {
      return false;
    }
    if (l$sortBy != lOther$sortBy) {
      return false;
    }
    final l$sortDirection = sortDirection;
    final lOther$sortDirection = other.sortDirection;
    if (_$data.containsKey('sortDirection') !=
        other._$data.containsKey('sortDirection')) {
      return false;
    }
    if (l$sortDirection != lOther$sortDirection) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$ids = ids;
    final l$name = name;
    final l$status = status;
    final l$tag = tag;
    final l$sortBy = sortBy;
    final l$sortDirection = sortDirection;
    return Object.hashAll([
      _$data.containsKey('ids')
          ? l$ids == null
              ? null
              : Object.hashAll(l$ids.map((v) => v))
          : const {},
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('status')
          ? l$status == null
              ? null
              : Object.hashAll(l$status.map((v) => v))
          : const {},
      _$data.containsKey('tag')
          ? l$tag == null
              ? null
              : Object.hashAll(l$tag.map((v) => v))
          : const {},
      _$data.containsKey('sortBy') ? l$sortBy : const {},
      _$data.containsKey('sortDirection') ? l$sortDirection : const {},
    ]);
  }
}

abstract class CopyWith$Input$ProjectFilter<TRes> {
  factory CopyWith$Input$ProjectFilter(
    Input$ProjectFilter instance,
    TRes Function(Input$ProjectFilter) then,
  ) = _CopyWithImpl$Input$ProjectFilter;

  factory CopyWith$Input$ProjectFilter.stub(TRes res) =
      _CopyWithStubImpl$Input$ProjectFilter;

  TRes call({
    List<String>? ids,
    String? name,
    List<Enum$ProjectStatusEnum>? status,
    List<String>? tag,
    Enum$ProjectSortEnum? sortBy,
    Enum$SortDirectionEnum? sortDirection,
  });
}

class _CopyWithImpl$Input$ProjectFilter<TRes>
    implements CopyWith$Input$ProjectFilter<TRes> {
  _CopyWithImpl$Input$ProjectFilter(
    this._instance,
    this._then,
  );

  final Input$ProjectFilter _instance;

  final TRes Function(Input$ProjectFilter) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? ids = _undefined,
    Object? name = _undefined,
    Object? status = _undefined,
    Object? tag = _undefined,
    Object? sortBy = _undefined,
    Object? sortDirection = _undefined,
  }) =>
      _then(Input$ProjectFilter._({
        ..._instance._$data,
        if (ids != _undefined) 'ids': (ids as List<String>?),
        if (name != _undefined) 'name': (name as String?),
        if (status != _undefined)
          'status': (status as List<Enum$ProjectStatusEnum>?),
        if (tag != _undefined) 'tag': (tag as List<String>?),
        if (sortBy != _undefined) 'sortBy': (sortBy as Enum$ProjectSortEnum?),
        if (sortDirection != _undefined)
          'sortDirection': (sortDirection as Enum$SortDirectionEnum?),
      }));
}

class _CopyWithStubImpl$Input$ProjectFilter<TRes>
    implements CopyWith$Input$ProjectFilter<TRes> {
  _CopyWithStubImpl$Input$ProjectFilter(this._res);

  TRes _res;

  call({
    List<String>? ids,
    String? name,
    List<Enum$ProjectStatusEnum>? status,
    List<String>? tag,
    Enum$ProjectSortEnum? sortBy,
    Enum$SortDirectionEnum? sortDirection,
  }) =>
      _res;
}

class Input$ProjectUpdateInput {
  factory Input$ProjectUpdateInput({
    required String id,
    String? name,
    String? color,
    Enum$ProjectStatusEnum? status,
    String? description,
    String? tag,
  }) =>
      Input$ProjectUpdateInput._({
        r'id': id,
        if (name != null) r'name': name,
        if (color != null) r'color': color,
        if (status != null) r'status': status,
        if (description != null) r'description': description,
        if (tag != null) r'tag': tag,
      });

  Input$ProjectUpdateInput._(this._$data);

  factory Input$ProjectUpdateInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('color')) {
      final l$color = data['color'];
      result$data['color'] = (l$color as String?);
    }
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = l$status == null
          ? null
          : fromJson$Enum$ProjectStatusEnum((l$status as String));
    }
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    if (data.containsKey('tag')) {
      final l$tag = data['tag'];
      result$data['tag'] = (l$tag as String?);
    }
    return Input$ProjectUpdateInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  String? get name => (_$data['name'] as String?);
  String? get color => (_$data['color'] as String?);
  Enum$ProjectStatusEnum? get status =>
      (_$data['status'] as Enum$ProjectStatusEnum?);
  String? get description => (_$data['description'] as String?);
  String? get tag => (_$data['tag'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('color')) {
      final l$color = color;
      result$data['color'] = l$color;
    }
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] =
          l$status == null ? null : toJson$Enum$ProjectStatusEnum(l$status);
    }
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    if (_$data.containsKey('tag')) {
      final l$tag = tag;
      result$data['tag'] = l$tag;
    }
    return result$data;
  }

  CopyWith$Input$ProjectUpdateInput<Input$ProjectUpdateInput> get copyWith =>
      CopyWith$Input$ProjectUpdateInput(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$ProjectUpdateInput) ||
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
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$color = color;
    final lOther$color = other.color;
    if (_$data.containsKey('color') != other._$data.containsKey('color')) {
      return false;
    }
    if (l$color != lOther$color) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (_$data.containsKey('status') != other._$data.containsKey('status')) {
      return false;
    }
    if (l$status != lOther$status) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (_$data.containsKey('description') !=
        other._$data.containsKey('description')) {
      return false;
    }
    if (l$description != lOther$description) {
      return false;
    }
    final l$tag = tag;
    final lOther$tag = other.tag;
    if (_$data.containsKey('tag') != other._$data.containsKey('tag')) {
      return false;
    }
    if (l$tag != lOther$tag) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$color = color;
    final l$status = status;
    final l$description = description;
    final l$tag = tag;
    return Object.hashAll([
      l$id,
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('color') ? l$color : const {},
      _$data.containsKey('status') ? l$status : const {},
      _$data.containsKey('description') ? l$description : const {},
      _$data.containsKey('tag') ? l$tag : const {},
    ]);
  }
}

abstract class CopyWith$Input$ProjectUpdateInput<TRes> {
  factory CopyWith$Input$ProjectUpdateInput(
    Input$ProjectUpdateInput instance,
    TRes Function(Input$ProjectUpdateInput) then,
  ) = _CopyWithImpl$Input$ProjectUpdateInput;

  factory CopyWith$Input$ProjectUpdateInput.stub(TRes res) =
      _CopyWithStubImpl$Input$ProjectUpdateInput;

  TRes call({
    String? id,
    String? name,
    String? color,
    Enum$ProjectStatusEnum? status,
    String? description,
    String? tag,
  });
}

class _CopyWithImpl$Input$ProjectUpdateInput<TRes>
    implements CopyWith$Input$ProjectUpdateInput<TRes> {
  _CopyWithImpl$Input$ProjectUpdateInput(
    this._instance,
    this._then,
  );

  final Input$ProjectUpdateInput _instance;

  final TRes Function(Input$ProjectUpdateInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? color = _undefined,
    Object? status = _undefined,
    Object? description = _undefined,
    Object? tag = _undefined,
  }) =>
      _then(Input$ProjectUpdateInput._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
        if (name != _undefined) 'name': (name as String?),
        if (color != _undefined) 'color': (color as String?),
        if (status != _undefined) 'status': (status as Enum$ProjectStatusEnum?),
        if (description != _undefined) 'description': (description as String?),
        if (tag != _undefined) 'tag': (tag as String?),
      }));
}

class _CopyWithStubImpl$Input$ProjectUpdateInput<TRes>
    implements CopyWith$Input$ProjectUpdateInput<TRes> {
  _CopyWithStubImpl$Input$ProjectUpdateInput(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? color,
    Enum$ProjectStatusEnum? status,
    String? description,
    String? tag,
  }) =>
      _res;
}

class Input$SettingUpdateInput {
  factory Input$SettingUpdateInput({
    required String id,
    Enum$CustomerSettingEnum? customer,
    Enum$ProjectSettingEnum? project,
    int? minuteStep,
    bool? closeTimesheetAutomatically,
  }) =>
      Input$SettingUpdateInput._({
        r'id': id,
        if (customer != null) r'customer': customer,
        if (project != null) r'project': project,
        if (minuteStep != null) r'minuteStep': minuteStep,
        if (closeTimesheetAutomatically != null)
          r'closeTimesheetAutomatically': closeTimesheetAutomatically,
      });

  Input$SettingUpdateInput._(this._$data);

  factory Input$SettingUpdateInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('customer')) {
      final l$customer = data['customer'];
      result$data['customer'] = l$customer == null
          ? null
          : fromJson$Enum$CustomerSettingEnum((l$customer as String));
    }
    if (data.containsKey('project')) {
      final l$project = data['project'];
      result$data['project'] = l$project == null
          ? null
          : fromJson$Enum$ProjectSettingEnum((l$project as String));
    }
    if (data.containsKey('minuteStep')) {
      final l$minuteStep = data['minuteStep'];
      result$data['minuteStep'] = (l$minuteStep as int?);
    }
    if (data.containsKey('closeTimesheetAutomatically')) {
      final l$closeTimesheetAutomatically = data['closeTimesheetAutomatically'];
      result$data['closeTimesheetAutomatically'] =
          (l$closeTimesheetAutomatically as bool?);
    }
    return Input$SettingUpdateInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  Enum$CustomerSettingEnum? get customer =>
      (_$data['customer'] as Enum$CustomerSettingEnum?);
  Enum$ProjectSettingEnum? get project =>
      (_$data['project'] as Enum$ProjectSettingEnum?);
  int? get minuteStep => (_$data['minuteStep'] as int?);
  bool? get closeTimesheetAutomatically =>
      (_$data['closeTimesheetAutomatically'] as bool?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('customer')) {
      final l$customer = customer;
      result$data['customer'] = l$customer == null
          ? null
          : toJson$Enum$CustomerSettingEnum(l$customer);
    }
    if (_$data.containsKey('project')) {
      final l$project = project;
      result$data['project'] =
          l$project == null ? null : toJson$Enum$ProjectSettingEnum(l$project);
    }
    if (_$data.containsKey('minuteStep')) {
      final l$minuteStep = minuteStep;
      result$data['minuteStep'] = l$minuteStep;
    }
    if (_$data.containsKey('closeTimesheetAutomatically')) {
      final l$closeTimesheetAutomatically = closeTimesheetAutomatically;
      result$data['closeTimesheetAutomatically'] =
          l$closeTimesheetAutomatically;
    }
    return result$data;
  }

  CopyWith$Input$SettingUpdateInput<Input$SettingUpdateInput> get copyWith =>
      CopyWith$Input$SettingUpdateInput(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$SettingUpdateInput) ||
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
    if (_$data.containsKey('customer') !=
        other._$data.containsKey('customer')) {
      return false;
    }
    if (l$customer != lOther$customer) {
      return false;
    }
    final l$project = project;
    final lOther$project = other.project;
    if (_$data.containsKey('project') != other._$data.containsKey('project')) {
      return false;
    }
    if (l$project != lOther$project) {
      return false;
    }
    final l$minuteStep = minuteStep;
    final lOther$minuteStep = other.minuteStep;
    if (_$data.containsKey('minuteStep') !=
        other._$data.containsKey('minuteStep')) {
      return false;
    }
    if (l$minuteStep != lOther$minuteStep) {
      return false;
    }
    final l$closeTimesheetAutomatically = closeTimesheetAutomatically;
    final lOther$closeTimesheetAutomatically =
        other.closeTimesheetAutomatically;
    if (_$data.containsKey('closeTimesheetAutomatically') !=
        other._$data.containsKey('closeTimesheetAutomatically')) {
      return false;
    }
    if (l$closeTimesheetAutomatically != lOther$closeTimesheetAutomatically) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$customer = customer;
    final l$project = project;
    final l$minuteStep = minuteStep;
    final l$closeTimesheetAutomatically = closeTimesheetAutomatically;
    return Object.hashAll([
      l$id,
      _$data.containsKey('customer') ? l$customer : const {},
      _$data.containsKey('project') ? l$project : const {},
      _$data.containsKey('minuteStep') ? l$minuteStep : const {},
      _$data.containsKey('closeTimesheetAutomatically')
          ? l$closeTimesheetAutomatically
          : const {},
    ]);
  }
}

abstract class CopyWith$Input$SettingUpdateInput<TRes> {
  factory CopyWith$Input$SettingUpdateInput(
    Input$SettingUpdateInput instance,
    TRes Function(Input$SettingUpdateInput) then,
  ) = _CopyWithImpl$Input$SettingUpdateInput;

  factory CopyWith$Input$SettingUpdateInput.stub(TRes res) =
      _CopyWithStubImpl$Input$SettingUpdateInput;

  TRes call({
    String? id,
    Enum$CustomerSettingEnum? customer,
    Enum$ProjectSettingEnum? project,
    int? minuteStep,
    bool? closeTimesheetAutomatically,
  });
}

class _CopyWithImpl$Input$SettingUpdateInput<TRes>
    implements CopyWith$Input$SettingUpdateInput<TRes> {
  _CopyWithImpl$Input$SettingUpdateInput(
    this._instance,
    this._then,
  );

  final Input$SettingUpdateInput _instance;

  final TRes Function(Input$SettingUpdateInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? customer = _undefined,
    Object? project = _undefined,
    Object? minuteStep = _undefined,
    Object? closeTimesheetAutomatically = _undefined,
  }) =>
      _then(Input$SettingUpdateInput._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
        if (customer != _undefined)
          'customer': (customer as Enum$CustomerSettingEnum?),
        if (project != _undefined)
          'project': (project as Enum$ProjectSettingEnum?),
        if (minuteStep != _undefined) 'minuteStep': (minuteStep as int?),
        if (closeTimesheetAutomatically != _undefined)
          'closeTimesheetAutomatically': (closeTimesheetAutomatically as bool?),
      }));
}

class _CopyWithStubImpl$Input$SettingUpdateInput<TRes>
    implements CopyWith$Input$SettingUpdateInput<TRes> {
  _CopyWithStubImpl$Input$SettingUpdateInput(this._res);

  TRes _res;

  call({
    String? id,
    Enum$CustomerSettingEnum? customer,
    Enum$ProjectSettingEnum? project,
    int? minuteStep,
    bool? closeTimesheetAutomatically,
  }) =>
      _res;
}

class Input$TimesheetCreateInput {
  factory Input$TimesheetCreateInput({
    required String month,
    List<Input$ActivityCreateInput>? activities,
  }) =>
      Input$TimesheetCreateInput._({
        r'month': month,
        if (activities != null) r'activities': activities,
      });

  Input$TimesheetCreateInput._(this._$data);

  factory Input$TimesheetCreateInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$month = data['month'];
    result$data['month'] = (l$month as String);
    if (data.containsKey('activities')) {
      final l$activities = data['activities'];
      result$data['activities'] = (l$activities as List<dynamic>?)
          ?.map((e) =>
              Input$ActivityCreateInput.fromJson((e as Map<String, dynamic>)))
          .toList();
    }
    return Input$TimesheetCreateInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get month => (_$data['month'] as String);
  List<Input$ActivityCreateInput>? get activities =>
      (_$data['activities'] as List<Input$ActivityCreateInput>?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$month = month;
    result$data['month'] = l$month;
    if (_$data.containsKey('activities')) {
      final l$activities = activities;
      result$data['activities'] = l$activities?.map((e) => e.toJson()).toList();
    }
    return result$data;
  }

  CopyWith$Input$TimesheetCreateInput<Input$TimesheetCreateInput>
      get copyWith => CopyWith$Input$TimesheetCreateInput(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$TimesheetCreateInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$month = month;
    final lOther$month = other.month;
    if (l$month != lOther$month) {
      return false;
    }
    final l$activities = activities;
    final lOther$activities = other.activities;
    if (_$data.containsKey('activities') !=
        other._$data.containsKey('activities')) {
      return false;
    }
    if (l$activities != null && lOther$activities != null) {
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
    } else if (l$activities != lOther$activities) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$month = month;
    final l$activities = activities;
    return Object.hashAll([
      l$month,
      _$data.containsKey('activities')
          ? l$activities == null
              ? null
              : Object.hashAll(l$activities.map((v) => v))
          : const {},
    ]);
  }
}

abstract class CopyWith$Input$TimesheetCreateInput<TRes> {
  factory CopyWith$Input$TimesheetCreateInput(
    Input$TimesheetCreateInput instance,
    TRes Function(Input$TimesheetCreateInput) then,
  ) = _CopyWithImpl$Input$TimesheetCreateInput;

  factory CopyWith$Input$TimesheetCreateInput.stub(TRes res) =
      _CopyWithStubImpl$Input$TimesheetCreateInput;

  TRes call({
    String? month,
    List<Input$ActivityCreateInput>? activities,
  });
  TRes activities(
      Iterable<Input$ActivityCreateInput>? Function(
              Iterable<
                  CopyWith$Input$ActivityCreateInput<
                      Input$ActivityCreateInput>>?)
          _fn);
}

class _CopyWithImpl$Input$TimesheetCreateInput<TRes>
    implements CopyWith$Input$TimesheetCreateInput<TRes> {
  _CopyWithImpl$Input$TimesheetCreateInput(
    this._instance,
    this._then,
  );

  final Input$TimesheetCreateInput _instance;

  final TRes Function(Input$TimesheetCreateInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? month = _undefined,
    Object? activities = _undefined,
  }) =>
      _then(Input$TimesheetCreateInput._({
        ..._instance._$data,
        if (month != _undefined && month != null) 'month': (month as String),
        if (activities != _undefined)
          'activities': (activities as List<Input$ActivityCreateInput>?),
      }));
  TRes activities(
          Iterable<Input$ActivityCreateInput>? Function(
                  Iterable<
                      CopyWith$Input$ActivityCreateInput<
                          Input$ActivityCreateInput>>?)
              _fn) =>
      call(
          activities: _fn(_instance.activities
              ?.map((e) => CopyWith$Input$ActivityCreateInput(
                    e,
                    (i) => i,
                  )))?.toList());
}

class _CopyWithStubImpl$Input$TimesheetCreateInput<TRes>
    implements CopyWith$Input$TimesheetCreateInput<TRes> {
  _CopyWithStubImpl$Input$TimesheetCreateInput(this._res);

  TRes _res;

  call({
    String? month,
    List<Input$ActivityCreateInput>? activities,
  }) =>
      _res;
  activities(_fn) => _res;
}

class Input$TimesheetFilter {
  factory Input$TimesheetFilter({
    List<String>? ids,
    String? year,
    String? month,
    String? fromMonth,
    String? toMonth,
    List<Enum$TimesheetStatusEnum?>? status,
    Enum$TimesheetSortEnum? sortBy,
    Enum$SortDirectionEnum? sortDirection,
  }) =>
      Input$TimesheetFilter._({
        if (ids != null) r'ids': ids,
        if (year != null) r'year': year,
        if (month != null) r'month': month,
        if (fromMonth != null) r'fromMonth': fromMonth,
        if (toMonth != null) r'toMonth': toMonth,
        if (status != null) r'status': status,
        if (sortBy != null) r'sortBy': sortBy,
        if (sortDirection != null) r'sortDirection': sortDirection,
      });

  Input$TimesheetFilter._(this._$data);

  factory Input$TimesheetFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('ids')) {
      final l$ids = data['ids'];
      result$data['ids'] =
          (l$ids as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('year')) {
      final l$year = data['year'];
      result$data['year'] = (l$year as String?);
    }
    if (data.containsKey('month')) {
      final l$month = data['month'];
      result$data['month'] = (l$month as String?);
    }
    if (data.containsKey('fromMonth')) {
      final l$fromMonth = data['fromMonth'];
      result$data['fromMonth'] = (l$fromMonth as String?);
    }
    if (data.containsKey('toMonth')) {
      final l$toMonth = data['toMonth'];
      result$data['toMonth'] = (l$toMonth as String?);
    }
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = (l$status as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : fromJson$Enum$TimesheetStatusEnum((e as String)))
          .toList();
    }
    if (data.containsKey('sortBy')) {
      final l$sortBy = data['sortBy'];
      result$data['sortBy'] = l$sortBy == null
          ? null
          : fromJson$Enum$TimesheetSortEnum((l$sortBy as String));
    }
    if (data.containsKey('sortDirection')) {
      final l$sortDirection = data['sortDirection'];
      result$data['sortDirection'] = l$sortDirection == null
          ? null
          : fromJson$Enum$SortDirectionEnum((l$sortDirection as String));
    }
    return Input$TimesheetFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  List<String>? get ids => (_$data['ids'] as List<String>?);
  String? get year => (_$data['year'] as String?);
  String? get month => (_$data['month'] as String?);
  String? get fromMonth => (_$data['fromMonth'] as String?);
  String? get toMonth => (_$data['toMonth'] as String?);
  List<Enum$TimesheetStatusEnum?>? get status =>
      (_$data['status'] as List<Enum$TimesheetStatusEnum?>?);
  Enum$TimesheetSortEnum? get sortBy =>
      (_$data['sortBy'] as Enum$TimesheetSortEnum?);
  Enum$SortDirectionEnum? get sortDirection =>
      (_$data['sortDirection'] as Enum$SortDirectionEnum?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('ids')) {
      final l$ids = ids;
      result$data['ids'] = l$ids?.map((e) => e).toList();
    }
    if (_$data.containsKey('year')) {
      final l$year = year;
      result$data['year'] = l$year;
    }
    if (_$data.containsKey('month')) {
      final l$month = month;
      result$data['month'] = l$month;
    }
    if (_$data.containsKey('fromMonth')) {
      final l$fromMonth = fromMonth;
      result$data['fromMonth'] = l$fromMonth;
    }
    if (_$data.containsKey('toMonth')) {
      final l$toMonth = toMonth;
      result$data['toMonth'] = l$toMonth;
    }
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] = l$status
          ?.map((e) => e == null ? null : toJson$Enum$TimesheetStatusEnum(e))
          .toList();
    }
    if (_$data.containsKey('sortBy')) {
      final l$sortBy = sortBy;
      result$data['sortBy'] =
          l$sortBy == null ? null : toJson$Enum$TimesheetSortEnum(l$sortBy);
    }
    if (_$data.containsKey('sortDirection')) {
      final l$sortDirection = sortDirection;
      result$data['sortDirection'] = l$sortDirection == null
          ? null
          : toJson$Enum$SortDirectionEnum(l$sortDirection);
    }
    return result$data;
  }

  CopyWith$Input$TimesheetFilter<Input$TimesheetFilter> get copyWith =>
      CopyWith$Input$TimesheetFilter(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$TimesheetFilter) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$ids = ids;
    final lOther$ids = other.ids;
    if (_$data.containsKey('ids') != other._$data.containsKey('ids')) {
      return false;
    }
    if (l$ids != null && lOther$ids != null) {
      if (l$ids.length != lOther$ids.length) {
        return false;
      }
      for (int i = 0; i < l$ids.length; i++) {
        final l$ids$entry = l$ids[i];
        final lOther$ids$entry = lOther$ids[i];
        if (l$ids$entry != lOther$ids$entry) {
          return false;
        }
      }
    } else if (l$ids != lOther$ids) {
      return false;
    }
    final l$year = year;
    final lOther$year = other.year;
    if (_$data.containsKey('year') != other._$data.containsKey('year')) {
      return false;
    }
    if (l$year != lOther$year) {
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
    final l$fromMonth = fromMonth;
    final lOther$fromMonth = other.fromMonth;
    if (_$data.containsKey('fromMonth') !=
        other._$data.containsKey('fromMonth')) {
      return false;
    }
    if (l$fromMonth != lOther$fromMonth) {
      return false;
    }
    final l$toMonth = toMonth;
    final lOther$toMonth = other.toMonth;
    if (_$data.containsKey('toMonth') != other._$data.containsKey('toMonth')) {
      return false;
    }
    if (l$toMonth != lOther$toMonth) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (_$data.containsKey('status') != other._$data.containsKey('status')) {
      return false;
    }
    if (l$status != null && lOther$status != null) {
      if (l$status.length != lOther$status.length) {
        return false;
      }
      for (int i = 0; i < l$status.length; i++) {
        final l$status$entry = l$status[i];
        final lOther$status$entry = lOther$status[i];
        if (l$status$entry != lOther$status$entry) {
          return false;
        }
      }
    } else if (l$status != lOther$status) {
      return false;
    }
    final l$sortBy = sortBy;
    final lOther$sortBy = other.sortBy;
    if (_$data.containsKey('sortBy') != other._$data.containsKey('sortBy')) {
      return false;
    }
    if (l$sortBy != lOther$sortBy) {
      return false;
    }
    final l$sortDirection = sortDirection;
    final lOther$sortDirection = other.sortDirection;
    if (_$data.containsKey('sortDirection') !=
        other._$data.containsKey('sortDirection')) {
      return false;
    }
    if (l$sortDirection != lOther$sortDirection) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$ids = ids;
    final l$year = year;
    final l$month = month;
    final l$fromMonth = fromMonth;
    final l$toMonth = toMonth;
    final l$status = status;
    final l$sortBy = sortBy;
    final l$sortDirection = sortDirection;
    return Object.hashAll([
      _$data.containsKey('ids')
          ? l$ids == null
              ? null
              : Object.hashAll(l$ids.map((v) => v))
          : const {},
      _$data.containsKey('year') ? l$year : const {},
      _$data.containsKey('month') ? l$month : const {},
      _$data.containsKey('fromMonth') ? l$fromMonth : const {},
      _$data.containsKey('toMonth') ? l$toMonth : const {},
      _$data.containsKey('status')
          ? l$status == null
              ? null
              : Object.hashAll(l$status.map((v) => v))
          : const {},
      _$data.containsKey('sortBy') ? l$sortBy : const {},
      _$data.containsKey('sortDirection') ? l$sortDirection : const {},
    ]);
  }
}

abstract class CopyWith$Input$TimesheetFilter<TRes> {
  factory CopyWith$Input$TimesheetFilter(
    Input$TimesheetFilter instance,
    TRes Function(Input$TimesheetFilter) then,
  ) = _CopyWithImpl$Input$TimesheetFilter;

  factory CopyWith$Input$TimesheetFilter.stub(TRes res) =
      _CopyWithStubImpl$Input$TimesheetFilter;

  TRes call({
    List<String>? ids,
    String? year,
    String? month,
    String? fromMonth,
    String? toMonth,
    List<Enum$TimesheetStatusEnum?>? status,
    Enum$TimesheetSortEnum? sortBy,
    Enum$SortDirectionEnum? sortDirection,
  });
}

class _CopyWithImpl$Input$TimesheetFilter<TRes>
    implements CopyWith$Input$TimesheetFilter<TRes> {
  _CopyWithImpl$Input$TimesheetFilter(
    this._instance,
    this._then,
  );

  final Input$TimesheetFilter _instance;

  final TRes Function(Input$TimesheetFilter) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? ids = _undefined,
    Object? year = _undefined,
    Object? month = _undefined,
    Object? fromMonth = _undefined,
    Object? toMonth = _undefined,
    Object? status = _undefined,
    Object? sortBy = _undefined,
    Object? sortDirection = _undefined,
  }) =>
      _then(Input$TimesheetFilter._({
        ..._instance._$data,
        if (ids != _undefined) 'ids': (ids as List<String>?),
        if (year != _undefined) 'year': (year as String?),
        if (month != _undefined) 'month': (month as String?),
        if (fromMonth != _undefined) 'fromMonth': (fromMonth as String?),
        if (toMonth != _undefined) 'toMonth': (toMonth as String?),
        if (status != _undefined)
          'status': (status as List<Enum$TimesheetStatusEnum?>?),
        if (sortBy != _undefined) 'sortBy': (sortBy as Enum$TimesheetSortEnum?),
        if (sortDirection != _undefined)
          'sortDirection': (sortDirection as Enum$SortDirectionEnum?),
      }));
}

class _CopyWithStubImpl$Input$TimesheetFilter<TRes>
    implements CopyWith$Input$TimesheetFilter<TRes> {
  _CopyWithStubImpl$Input$TimesheetFilter(this._res);

  TRes _res;

  call({
    List<String>? ids,
    String? year,
    String? month,
    String? fromMonth,
    String? toMonth,
    List<Enum$TimesheetStatusEnum?>? status,
    Enum$TimesheetSortEnum? sortBy,
    Enum$SortDirectionEnum? sortDirection,
  }) =>
      _res;
}

class Input$TimesheetUpdateInput {
  factory Input$TimesheetUpdateInput({
    required String id,
    Enum$TimesheetStatusEnum? status,
    List<Input$ActivityCreateInput>? activities,
  }) =>
      Input$TimesheetUpdateInput._({
        r'id': id,
        if (status != null) r'status': status,
        if (activities != null) r'activities': activities,
      });

  Input$TimesheetUpdateInput._(this._$data);

  factory Input$TimesheetUpdateInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = l$status == null
          ? null
          : fromJson$Enum$TimesheetStatusEnum((l$status as String));
    }
    if (data.containsKey('activities')) {
      final l$activities = data['activities'];
      result$data['activities'] = (l$activities as List<dynamic>?)
          ?.map((e) =>
              Input$ActivityCreateInput.fromJson((e as Map<String, dynamic>)))
          .toList();
    }
    return Input$TimesheetUpdateInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  Enum$TimesheetStatusEnum? get status =>
      (_$data['status'] as Enum$TimesheetStatusEnum?);
  List<Input$ActivityCreateInput>? get activities =>
      (_$data['activities'] as List<Input$ActivityCreateInput>?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] =
          l$status == null ? null : toJson$Enum$TimesheetStatusEnum(l$status);
    }
    if (_$data.containsKey('activities')) {
      final l$activities = activities;
      result$data['activities'] = l$activities?.map((e) => e.toJson()).toList();
    }
    return result$data;
  }

  CopyWith$Input$TimesheetUpdateInput<Input$TimesheetUpdateInput>
      get copyWith => CopyWith$Input$TimesheetUpdateInput(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$TimesheetUpdateInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (_$data.containsKey('status') != other._$data.containsKey('status')) {
      return false;
    }
    if (l$status != lOther$status) {
      return false;
    }
    final l$activities = activities;
    final lOther$activities = other.activities;
    if (_$data.containsKey('activities') !=
        other._$data.containsKey('activities')) {
      return false;
    }
    if (l$activities != null && lOther$activities != null) {
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
    } else if (l$activities != lOther$activities) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$status = status;
    final l$activities = activities;
    return Object.hashAll([
      l$id,
      _$data.containsKey('status') ? l$status : const {},
      _$data.containsKey('activities')
          ? l$activities == null
              ? null
              : Object.hashAll(l$activities.map((v) => v))
          : const {},
    ]);
  }
}

abstract class CopyWith$Input$TimesheetUpdateInput<TRes> {
  factory CopyWith$Input$TimesheetUpdateInput(
    Input$TimesheetUpdateInput instance,
    TRes Function(Input$TimesheetUpdateInput) then,
  ) = _CopyWithImpl$Input$TimesheetUpdateInput;

  factory CopyWith$Input$TimesheetUpdateInput.stub(TRes res) =
      _CopyWithStubImpl$Input$TimesheetUpdateInput;

  TRes call({
    String? id,
    Enum$TimesheetStatusEnum? status,
    List<Input$ActivityCreateInput>? activities,
  });
  TRes activities(
      Iterable<Input$ActivityCreateInput>? Function(
              Iterable<
                  CopyWith$Input$ActivityCreateInput<
                      Input$ActivityCreateInput>>?)
          _fn);
}

class _CopyWithImpl$Input$TimesheetUpdateInput<TRes>
    implements CopyWith$Input$TimesheetUpdateInput<TRes> {
  _CopyWithImpl$Input$TimesheetUpdateInput(
    this._instance,
    this._then,
  );

  final Input$TimesheetUpdateInput _instance;

  final TRes Function(Input$TimesheetUpdateInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? activities = _undefined,
  }) =>
      _then(Input$TimesheetUpdateInput._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
        if (status != _undefined)
          'status': (status as Enum$TimesheetStatusEnum?),
        if (activities != _undefined)
          'activities': (activities as List<Input$ActivityCreateInput>?),
      }));
  TRes activities(
          Iterable<Input$ActivityCreateInput>? Function(
                  Iterable<
                      CopyWith$Input$ActivityCreateInput<
                          Input$ActivityCreateInput>>?)
              _fn) =>
      call(
          activities: _fn(_instance.activities
              ?.map((e) => CopyWith$Input$ActivityCreateInput(
                    e,
                    (i) => i,
                  )))?.toList());
}

class _CopyWithStubImpl$Input$TimesheetUpdateInput<TRes>
    implements CopyWith$Input$TimesheetUpdateInput<TRes> {
  _CopyWithStubImpl$Input$TimesheetUpdateInput(this._res);

  TRes _res;

  call({
    String? id,
    Enum$TimesheetStatusEnum? status,
    List<Input$ActivityCreateInput>? activities,
  }) =>
      _res;
  activities(_fn) => _res;
}

class Input$UserCreateInput {
  factory Input$UserCreateInput({
    required String displayName,
    required String email,
    required String password,
    String? organizationId,
  }) =>
      Input$UserCreateInput._({
        r'displayName': displayName,
        r'email': email,
        r'password': password,
        if (organizationId != null) r'organizationId': organizationId,
      });

  Input$UserCreateInput._(this._$data);

  factory Input$UserCreateInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$displayName = data['displayName'];
    result$data['displayName'] = (l$displayName as String);
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    final l$password = data['password'];
    result$data['password'] = (l$password as String);
    if (data.containsKey('organizationId')) {
      final l$organizationId = data['organizationId'];
      result$data['organizationId'] = (l$organizationId as String?);
    }
    return Input$UserCreateInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get displayName => (_$data['displayName'] as String);
  String get email => (_$data['email'] as String);
  String get password => (_$data['password'] as String);
  String? get organizationId => (_$data['organizationId'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$displayName = displayName;
    result$data['displayName'] = l$displayName;
    final l$email = email;
    result$data['email'] = l$email;
    final l$password = password;
    result$data['password'] = l$password;
    if (_$data.containsKey('organizationId')) {
      final l$organizationId = organizationId;
      result$data['organizationId'] = l$organizationId;
    }
    return result$data;
  }

  CopyWith$Input$UserCreateInput<Input$UserCreateInput> get copyWith =>
      CopyWith$Input$UserCreateInput(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$UserCreateInput) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$displayName = displayName;
    final lOther$displayName = other.displayName;
    if (l$displayName != lOther$displayName) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$password = password;
    final lOther$password = other.password;
    if (l$password != lOther$password) {
      return false;
    }
    final l$organizationId = organizationId;
    final lOther$organizationId = other.organizationId;
    if (_$data.containsKey('organizationId') !=
        other._$data.containsKey('organizationId')) {
      return false;
    }
    if (l$organizationId != lOther$organizationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$displayName = displayName;
    final l$email = email;
    final l$password = password;
    final l$organizationId = organizationId;
    return Object.hashAll([
      l$displayName,
      l$email,
      l$password,
      _$data.containsKey('organizationId') ? l$organizationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$UserCreateInput<TRes> {
  factory CopyWith$Input$UserCreateInput(
    Input$UserCreateInput instance,
    TRes Function(Input$UserCreateInput) then,
  ) = _CopyWithImpl$Input$UserCreateInput;

  factory CopyWith$Input$UserCreateInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UserCreateInput;

  TRes call({
    String? displayName,
    String? email,
    String? password,
    String? organizationId,
  });
}

class _CopyWithImpl$Input$UserCreateInput<TRes>
    implements CopyWith$Input$UserCreateInput<TRes> {
  _CopyWithImpl$Input$UserCreateInput(
    this._instance,
    this._then,
  );

  final Input$UserCreateInput _instance;

  final TRes Function(Input$UserCreateInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? displayName = _undefined,
    Object? email = _undefined,
    Object? password = _undefined,
    Object? organizationId = _undefined,
  }) =>
      _then(Input$UserCreateInput._({
        ..._instance._$data,
        if (displayName != _undefined && displayName != null)
          'displayName': (displayName as String),
        if (email != _undefined && email != null) 'email': (email as String),
        if (password != _undefined && password != null)
          'password': (password as String),
        if (organizationId != _undefined)
          'organizationId': (organizationId as String?),
      }));
}

class _CopyWithStubImpl$Input$UserCreateInput<TRes>
    implements CopyWith$Input$UserCreateInput<TRes> {
  _CopyWithStubImpl$Input$UserCreateInput(this._res);

  TRes _res;

  call({
    String? displayName,
    String? email,
    String? password,
    String? organizationId,
  }) =>
      _res;
}

class Input$UserDeleteInput {
  factory Input$UserDeleteInput({required String id}) =>
      Input$UserDeleteInput._({
        r'id': id,
      });

  Input$UserDeleteInput._(this._$data);

  factory Input$UserDeleteInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Input$UserDeleteInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Input$UserDeleteInput<Input$UserDeleteInput> get copyWith =>
      CopyWith$Input$UserDeleteInput(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$UserDeleteInput) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Input$UserDeleteInput<TRes> {
  factory CopyWith$Input$UserDeleteInput(
    Input$UserDeleteInput instance,
    TRes Function(Input$UserDeleteInput) then,
  ) = _CopyWithImpl$Input$UserDeleteInput;

  factory CopyWith$Input$UserDeleteInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UserDeleteInput;

  TRes call({String? id});
}

class _CopyWithImpl$Input$UserDeleteInput<TRes>
    implements CopyWith$Input$UserDeleteInput<TRes> {
  _CopyWithImpl$Input$UserDeleteInput(
    this._instance,
    this._then,
  );

  final Input$UserDeleteInput _instance;

  final TRes Function(Input$UserDeleteInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(Input$UserDeleteInput._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Input$UserDeleteInput<TRes>
    implements CopyWith$Input$UserDeleteInput<TRes> {
  _CopyWithStubImpl$Input$UserDeleteInput(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Input$UserFilter {
  factory Input$UserFilter({
    String? search,
    String? displayName,
    String? email,
    List<String>? organizationId,
    Enum$UserSortEnum? sortBy,
    Enum$SortDirectionEnum? sortDirection,
  }) =>
      Input$UserFilter._({
        if (search != null) r'search': search,
        if (displayName != null) r'displayName': displayName,
        if (email != null) r'email': email,
        if (organizationId != null) r'organizationId': organizationId,
        if (sortBy != null) r'sortBy': sortBy,
        if (sortDirection != null) r'sortDirection': sortDirection,
      });

  Input$UserFilter._(this._$data);

  factory Input$UserFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('search')) {
      final l$search = data['search'];
      result$data['search'] = (l$search as String?);
    }
    if (data.containsKey('displayName')) {
      final l$displayName = data['displayName'];
      result$data['displayName'] = (l$displayName as String?);
    }
    if (data.containsKey('email')) {
      final l$email = data['email'];
      result$data['email'] = (l$email as String?);
    }
    if (data.containsKey('organizationId')) {
      final l$organizationId = data['organizationId'];
      result$data['organizationId'] = (l$organizationId as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    if (data.containsKey('sortBy')) {
      final l$sortBy = data['sortBy'];
      result$data['sortBy'] = l$sortBy == null
          ? null
          : fromJson$Enum$UserSortEnum((l$sortBy as String));
    }
    if (data.containsKey('sortDirection')) {
      final l$sortDirection = data['sortDirection'];
      result$data['sortDirection'] = l$sortDirection == null
          ? null
          : fromJson$Enum$SortDirectionEnum((l$sortDirection as String));
    }
    return Input$UserFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get search => (_$data['search'] as String?);
  String? get displayName => (_$data['displayName'] as String?);
  String? get email => (_$data['email'] as String?);
  List<String>? get organizationId =>
      (_$data['organizationId'] as List<String>?);
  Enum$UserSortEnum? get sortBy => (_$data['sortBy'] as Enum$UserSortEnum?);
  Enum$SortDirectionEnum? get sortDirection =>
      (_$data['sortDirection'] as Enum$SortDirectionEnum?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('search')) {
      final l$search = search;
      result$data['search'] = l$search;
    }
    if (_$data.containsKey('displayName')) {
      final l$displayName = displayName;
      result$data['displayName'] = l$displayName;
    }
    if (_$data.containsKey('email')) {
      final l$email = email;
      result$data['email'] = l$email;
    }
    if (_$data.containsKey('organizationId')) {
      final l$organizationId = organizationId;
      result$data['organizationId'] = l$organizationId?.map((e) => e).toList();
    }
    if (_$data.containsKey('sortBy')) {
      final l$sortBy = sortBy;
      result$data['sortBy'] =
          l$sortBy == null ? null : toJson$Enum$UserSortEnum(l$sortBy);
    }
    if (_$data.containsKey('sortDirection')) {
      final l$sortDirection = sortDirection;
      result$data['sortDirection'] = l$sortDirection == null
          ? null
          : toJson$Enum$SortDirectionEnum(l$sortDirection);
    }
    return result$data;
  }

  CopyWith$Input$UserFilter<Input$UserFilter> get copyWith =>
      CopyWith$Input$UserFilter(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$UserFilter) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$search = search;
    final lOther$search = other.search;
    if (_$data.containsKey('search') != other._$data.containsKey('search')) {
      return false;
    }
    if (l$search != lOther$search) {
      return false;
    }
    final l$displayName = displayName;
    final lOther$displayName = other.displayName;
    if (_$data.containsKey('displayName') !=
        other._$data.containsKey('displayName')) {
      return false;
    }
    if (l$displayName != lOther$displayName) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (_$data.containsKey('email') != other._$data.containsKey('email')) {
      return false;
    }
    if (l$email != lOther$email) {
      return false;
    }
    final l$organizationId = organizationId;
    final lOther$organizationId = other.organizationId;
    if (_$data.containsKey('organizationId') !=
        other._$data.containsKey('organizationId')) {
      return false;
    }
    if (l$organizationId != null && lOther$organizationId != null) {
      if (l$organizationId.length != lOther$organizationId.length) {
        return false;
      }
      for (int i = 0; i < l$organizationId.length; i++) {
        final l$organizationId$entry = l$organizationId[i];
        final lOther$organizationId$entry = lOther$organizationId[i];
        if (l$organizationId$entry != lOther$organizationId$entry) {
          return false;
        }
      }
    } else if (l$organizationId != lOther$organizationId) {
      return false;
    }
    final l$sortBy = sortBy;
    final lOther$sortBy = other.sortBy;
    if (_$data.containsKey('sortBy') != other._$data.containsKey('sortBy')) {
      return false;
    }
    if (l$sortBy != lOther$sortBy) {
      return false;
    }
    final l$sortDirection = sortDirection;
    final lOther$sortDirection = other.sortDirection;
    if (_$data.containsKey('sortDirection') !=
        other._$data.containsKey('sortDirection')) {
      return false;
    }
    if (l$sortDirection != lOther$sortDirection) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$search = search;
    final l$displayName = displayName;
    final l$email = email;
    final l$organizationId = organizationId;
    final l$sortBy = sortBy;
    final l$sortDirection = sortDirection;
    return Object.hashAll([
      _$data.containsKey('search') ? l$search : const {},
      _$data.containsKey('displayName') ? l$displayName : const {},
      _$data.containsKey('email') ? l$email : const {},
      _$data.containsKey('organizationId')
          ? l$organizationId == null
              ? null
              : Object.hashAll(l$organizationId.map((v) => v))
          : const {},
      _$data.containsKey('sortBy') ? l$sortBy : const {},
      _$data.containsKey('sortDirection') ? l$sortDirection : const {},
    ]);
  }
}

abstract class CopyWith$Input$UserFilter<TRes> {
  factory CopyWith$Input$UserFilter(
    Input$UserFilter instance,
    TRes Function(Input$UserFilter) then,
  ) = _CopyWithImpl$Input$UserFilter;

  factory CopyWith$Input$UserFilter.stub(TRes res) =
      _CopyWithStubImpl$Input$UserFilter;

  TRes call({
    String? search,
    String? displayName,
    String? email,
    List<String>? organizationId,
    Enum$UserSortEnum? sortBy,
    Enum$SortDirectionEnum? sortDirection,
  });
}

class _CopyWithImpl$Input$UserFilter<TRes>
    implements CopyWith$Input$UserFilter<TRes> {
  _CopyWithImpl$Input$UserFilter(
    this._instance,
    this._then,
  );

  final Input$UserFilter _instance;

  final TRes Function(Input$UserFilter) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? search = _undefined,
    Object? displayName = _undefined,
    Object? email = _undefined,
    Object? organizationId = _undefined,
    Object? sortBy = _undefined,
    Object? sortDirection = _undefined,
  }) =>
      _then(Input$UserFilter._({
        ..._instance._$data,
        if (search != _undefined) 'search': (search as String?),
        if (displayName != _undefined) 'displayName': (displayName as String?),
        if (email != _undefined) 'email': (email as String?),
        if (organizationId != _undefined)
          'organizationId': (organizationId as List<String>?),
        if (sortBy != _undefined) 'sortBy': (sortBy as Enum$UserSortEnum?),
        if (sortDirection != _undefined)
          'sortDirection': (sortDirection as Enum$SortDirectionEnum?),
      }));
}

class _CopyWithStubImpl$Input$UserFilter<TRes>
    implements CopyWith$Input$UserFilter<TRes> {
  _CopyWithStubImpl$Input$UserFilter(this._res);

  TRes _res;

  call({
    String? search,
    String? displayName,
    String? email,
    List<String>? organizationId,
    Enum$UserSortEnum? sortBy,
    Enum$SortDirectionEnum? sortDirection,
  }) =>
      _res;
}

class Input$UserUpdateInput {
  factory Input$UserUpdateInput({
    required String id,
    required String displayName,
    String? password,
    required String email,
  }) =>
      Input$UserUpdateInput._({
        r'id': id,
        r'displayName': displayName,
        if (password != null) r'password': password,
        r'email': email,
      });

  Input$UserUpdateInput._(this._$data);

  factory Input$UserUpdateInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$displayName = data['displayName'];
    result$data['displayName'] = (l$displayName as String);
    if (data.containsKey('password')) {
      final l$password = data['password'];
      result$data['password'] = (l$password as String?);
    }
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    return Input$UserUpdateInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  String get displayName => (_$data['displayName'] as String);
  String? get password => (_$data['password'] as String?);
  String get email => (_$data['email'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$displayName = displayName;
    result$data['displayName'] = l$displayName;
    if (_$data.containsKey('password')) {
      final l$password = password;
      result$data['password'] = l$password;
    }
    final l$email = email;
    result$data['email'] = l$email;
    return result$data;
  }

  CopyWith$Input$UserUpdateInput<Input$UserUpdateInput> get copyWith =>
      CopyWith$Input$UserUpdateInput(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$UserUpdateInput) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$displayName = displayName;
    final lOther$displayName = other.displayName;
    if (l$displayName != lOther$displayName) {
      return false;
    }
    final l$password = password;
    final lOther$password = other.password;
    if (_$data.containsKey('password') !=
        other._$data.containsKey('password')) {
      return false;
    }
    if (l$password != lOther$password) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$displayName = displayName;
    final l$password = password;
    final l$email = email;
    return Object.hashAll([
      l$id,
      l$displayName,
      _$data.containsKey('password') ? l$password : const {},
      l$email,
    ]);
  }
}

abstract class CopyWith$Input$UserUpdateInput<TRes> {
  factory CopyWith$Input$UserUpdateInput(
    Input$UserUpdateInput instance,
    TRes Function(Input$UserUpdateInput) then,
  ) = _CopyWithImpl$Input$UserUpdateInput;

  factory CopyWith$Input$UserUpdateInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UserUpdateInput;

  TRes call({
    String? id,
    String? displayName,
    String? password,
    String? email,
  });
}

class _CopyWithImpl$Input$UserUpdateInput<TRes>
    implements CopyWith$Input$UserUpdateInput<TRes> {
  _CopyWithImpl$Input$UserUpdateInput(
    this._instance,
    this._then,
  );

  final Input$UserUpdateInput _instance;

  final TRes Function(Input$UserUpdateInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? displayName = _undefined,
    Object? password = _undefined,
    Object? email = _undefined,
  }) =>
      _then(Input$UserUpdateInput._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
        if (displayName != _undefined && displayName != null)
          'displayName': (displayName as String),
        if (password != _undefined) 'password': (password as String?),
        if (email != _undefined && email != null) 'email': (email as String),
      }));
}

class _CopyWithStubImpl$Input$UserUpdateInput<TRes>
    implements CopyWith$Input$UserUpdateInput<TRes> {
  _CopyWithStubImpl$Input$UserUpdateInput(this._res);

  TRes _res;

  call({
    String? id,
    String? displayName,
    String? password,
    String? email,
  }) =>
      _res;
}

enum Enum$CustomerSettingEnum { HIDDEN, VISIBLE, REQUIRED, $unknown }

String toJson$Enum$CustomerSettingEnum(Enum$CustomerSettingEnum e) {
  switch (e) {
    case Enum$CustomerSettingEnum.HIDDEN:
      return r'HIDDEN';
    case Enum$CustomerSettingEnum.VISIBLE:
      return r'VISIBLE';
    case Enum$CustomerSettingEnum.REQUIRED:
      return r'REQUIRED';
    case Enum$CustomerSettingEnum.$unknown:
      return r'$unknown';
  }
}

Enum$CustomerSettingEnum fromJson$Enum$CustomerSettingEnum(String value) {
  switch (value) {
    case r'HIDDEN':
      return Enum$CustomerSettingEnum.HIDDEN;
    case r'VISIBLE':
      return Enum$CustomerSettingEnum.VISIBLE;
    case r'REQUIRED':
      return Enum$CustomerSettingEnum.REQUIRED;
    default:
      return Enum$CustomerSettingEnum.$unknown;
  }
}

enum Enum$CustomerSortEnum { NAME, CREATED_AT, $unknown }

String toJson$Enum$CustomerSortEnum(Enum$CustomerSortEnum e) {
  switch (e) {
    case Enum$CustomerSortEnum.NAME:
      return r'NAME';
    case Enum$CustomerSortEnum.CREATED_AT:
      return r'CREATED_AT';
    case Enum$CustomerSortEnum.$unknown:
      return r'$unknown';
  }
}

Enum$CustomerSortEnum fromJson$Enum$CustomerSortEnum(String value) {
  switch (value) {
    case r'NAME':
      return Enum$CustomerSortEnum.NAME;
    case r'CREATED_AT':
      return Enum$CustomerSortEnum.CREATED_AT;
    default:
      return Enum$CustomerSortEnum.$unknown;
  }
}

enum Enum$OrganizationSortEnum { NAME, $unknown }

String toJson$Enum$OrganizationSortEnum(Enum$OrganizationSortEnum e) {
  switch (e) {
    case Enum$OrganizationSortEnum.NAME:
      return r'NAME';
    case Enum$OrganizationSortEnum.$unknown:
      return r'$unknown';
  }
}

Enum$OrganizationSortEnum fromJson$Enum$OrganizationSortEnum(String value) {
  switch (value) {
    case r'NAME':
      return Enum$OrganizationSortEnum.NAME;
    default:
      return Enum$OrganizationSortEnum.$unknown;
  }
}

enum Enum$ProjectSettingEnum { HIDDEN, VISIBLE, REQUIRED, $unknown }

String toJson$Enum$ProjectSettingEnum(Enum$ProjectSettingEnum e) {
  switch (e) {
    case Enum$ProjectSettingEnum.HIDDEN:
      return r'HIDDEN';
    case Enum$ProjectSettingEnum.VISIBLE:
      return r'VISIBLE';
    case Enum$ProjectSettingEnum.REQUIRED:
      return r'REQUIRED';
    case Enum$ProjectSettingEnum.$unknown:
      return r'$unknown';
  }
}

Enum$ProjectSettingEnum fromJson$Enum$ProjectSettingEnum(String value) {
  switch (value) {
    case r'HIDDEN':
      return Enum$ProjectSettingEnum.HIDDEN;
    case r'VISIBLE':
      return Enum$ProjectSettingEnum.VISIBLE;
    case r'REQUIRED':
      return Enum$ProjectSettingEnum.REQUIRED;
    default:
      return Enum$ProjectSettingEnum.$unknown;
  }
}

enum Enum$ProjectSortEnum { NAME, CREATED_AT, $unknown }

String toJson$Enum$ProjectSortEnum(Enum$ProjectSortEnum e) {
  switch (e) {
    case Enum$ProjectSortEnum.NAME:
      return r'NAME';
    case Enum$ProjectSortEnum.CREATED_AT:
      return r'CREATED_AT';
    case Enum$ProjectSortEnum.$unknown:
      return r'$unknown';
  }
}

Enum$ProjectSortEnum fromJson$Enum$ProjectSortEnum(String value) {
  switch (value) {
    case r'NAME':
      return Enum$ProjectSortEnum.NAME;
    case r'CREATED_AT':
      return Enum$ProjectSortEnum.CREATED_AT;
    default:
      return Enum$ProjectSortEnum.$unknown;
  }
}

enum Enum$ProjectStatusEnum { IN_PROGRESS, COMPLETED, $unknown }

String toJson$Enum$ProjectStatusEnum(Enum$ProjectStatusEnum e) {
  switch (e) {
    case Enum$ProjectStatusEnum.IN_PROGRESS:
      return r'IN_PROGRESS';
    case Enum$ProjectStatusEnum.COMPLETED:
      return r'COMPLETED';
    case Enum$ProjectStatusEnum.$unknown:
      return r'$unknown';
  }
}

Enum$ProjectStatusEnum fromJson$Enum$ProjectStatusEnum(String value) {
  switch (value) {
    case r'IN_PROGRESS':
      return Enum$ProjectStatusEnum.IN_PROGRESS;
    case r'COMPLETED':
      return Enum$ProjectStatusEnum.COMPLETED;
    default:
      return Enum$ProjectStatusEnum.$unknown;
  }
}

enum Enum$SortDirectionEnum { ASC, DESC, $unknown }

String toJson$Enum$SortDirectionEnum(Enum$SortDirectionEnum e) {
  switch (e) {
    case Enum$SortDirectionEnum.ASC:
      return r'ASC';
    case Enum$SortDirectionEnum.DESC:
      return r'DESC';
    case Enum$SortDirectionEnum.$unknown:
      return r'$unknown';
  }
}

Enum$SortDirectionEnum fromJson$Enum$SortDirectionEnum(String value) {
  switch (value) {
    case r'ASC':
      return Enum$SortDirectionEnum.ASC;
    case r'DESC':
      return Enum$SortDirectionEnum.DESC;
    default:
      return Enum$SortDirectionEnum.$unknown;
  }
}

enum Enum$TimesheetSortEnum { MONTH, STATUS, TOTAL_HOURS, $unknown }

String toJson$Enum$TimesheetSortEnum(Enum$TimesheetSortEnum e) {
  switch (e) {
    case Enum$TimesheetSortEnum.MONTH:
      return r'MONTH';
    case Enum$TimesheetSortEnum.STATUS:
      return r'STATUS';
    case Enum$TimesheetSortEnum.TOTAL_HOURS:
      return r'TOTAL_HOURS';
    case Enum$TimesheetSortEnum.$unknown:
      return r'$unknown';
  }
}

Enum$TimesheetSortEnum fromJson$Enum$TimesheetSortEnum(String value) {
  switch (value) {
    case r'MONTH':
      return Enum$TimesheetSortEnum.MONTH;
    case r'STATUS':
      return Enum$TimesheetSortEnum.STATUS;
    case r'TOTAL_HOURS':
      return Enum$TimesheetSortEnum.TOTAL_HOURS;
    default:
      return Enum$TimesheetSortEnum.$unknown;
  }
}

enum Enum$TimesheetStatusEnum { OPEN, PENDING, REJECTED, CLOSED, $unknown }

String toJson$Enum$TimesheetStatusEnum(Enum$TimesheetStatusEnum e) {
  switch (e) {
    case Enum$TimesheetStatusEnum.OPEN:
      return r'OPEN';
    case Enum$TimesheetStatusEnum.PENDING:
      return r'PENDING';
    case Enum$TimesheetStatusEnum.REJECTED:
      return r'REJECTED';
    case Enum$TimesheetStatusEnum.CLOSED:
      return r'CLOSED';
    case Enum$TimesheetStatusEnum.$unknown:
      return r'$unknown';
  }
}

Enum$TimesheetStatusEnum fromJson$Enum$TimesheetStatusEnum(String value) {
  switch (value) {
    case r'OPEN':
      return Enum$TimesheetStatusEnum.OPEN;
    case r'PENDING':
      return Enum$TimesheetStatusEnum.PENDING;
    case r'REJECTED':
      return Enum$TimesheetStatusEnum.REJECTED;
    case r'CLOSED':
      return Enum$TimesheetStatusEnum.CLOSED;
    default:
      return Enum$TimesheetStatusEnum.$unknown;
  }
}

enum Enum$UserSortEnum { DISPLAY_NAME, EMAIL, $unknown }

String toJson$Enum$UserSortEnum(Enum$UserSortEnum e) {
  switch (e) {
    case Enum$UserSortEnum.DISPLAY_NAME:
      return r'DISPLAY_NAME';
    case Enum$UserSortEnum.EMAIL:
      return r'EMAIL';
    case Enum$UserSortEnum.$unknown:
      return r'$unknown';
  }
}

Enum$UserSortEnum fromJson$Enum$UserSortEnum(String value) {
  switch (value) {
    case r'DISPLAY_NAME':
      return Enum$UserSortEnum.DISPLAY_NAME;
    case r'EMAIL':
      return Enum$UserSortEnum.EMAIL;
    default:
      return Enum$UserSortEnum.$unknown;
  }
}

enum Enum$__TypeKind {
  SCALAR,
  OBJECT,
  INTERFACE,
  UNION,
  ENUM,
  INPUT_OBJECT,
  LIST,
  NON_NULL,
  $unknown
}

String toJson$Enum$__TypeKind(Enum$__TypeKind e) {
  switch (e) {
    case Enum$__TypeKind.SCALAR:
      return r'SCALAR';
    case Enum$__TypeKind.OBJECT:
      return r'OBJECT';
    case Enum$__TypeKind.INTERFACE:
      return r'INTERFACE';
    case Enum$__TypeKind.UNION:
      return r'UNION';
    case Enum$__TypeKind.ENUM:
      return r'ENUM';
    case Enum$__TypeKind.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__TypeKind.LIST:
      return r'LIST';
    case Enum$__TypeKind.NON_NULL:
      return r'NON_NULL';
    case Enum$__TypeKind.$unknown:
      return r'$unknown';
  }
}

Enum$__TypeKind fromJson$Enum$__TypeKind(String value) {
  switch (value) {
    case r'SCALAR':
      return Enum$__TypeKind.SCALAR;
    case r'OBJECT':
      return Enum$__TypeKind.OBJECT;
    case r'INTERFACE':
      return Enum$__TypeKind.INTERFACE;
    case r'UNION':
      return Enum$__TypeKind.UNION;
    case r'ENUM':
      return Enum$__TypeKind.ENUM;
    case r'INPUT_OBJECT':
      return Enum$__TypeKind.INPUT_OBJECT;
    case r'LIST':
      return Enum$__TypeKind.LIST;
    case r'NON_NULL':
      return Enum$__TypeKind.NON_NULL;
    default:
      return Enum$__TypeKind.$unknown;
  }
}

enum Enum$__DirectiveLocation {
  QUERY,
  MUTATION,
  SUBSCRIPTION,
  FIELD,
  FRAGMENT_DEFINITION,
  FRAGMENT_SPREAD,
  INLINE_FRAGMENT,
  VARIABLE_DEFINITION,
  SCHEMA,
  SCALAR,
  OBJECT,
  FIELD_DEFINITION,
  ARGUMENT_DEFINITION,
  INTERFACE,
  UNION,
  ENUM,
  ENUM_VALUE,
  INPUT_OBJECT,
  INPUT_FIELD_DEFINITION,
  $unknown
}

String toJson$Enum$__DirectiveLocation(Enum$__DirectiveLocation e) {
  switch (e) {
    case Enum$__DirectiveLocation.QUERY:
      return r'QUERY';
    case Enum$__DirectiveLocation.MUTATION:
      return r'MUTATION';
    case Enum$__DirectiveLocation.SUBSCRIPTION:
      return r'SUBSCRIPTION';
    case Enum$__DirectiveLocation.FIELD:
      return r'FIELD';
    case Enum$__DirectiveLocation.FRAGMENT_DEFINITION:
      return r'FRAGMENT_DEFINITION';
    case Enum$__DirectiveLocation.FRAGMENT_SPREAD:
      return r'FRAGMENT_SPREAD';
    case Enum$__DirectiveLocation.INLINE_FRAGMENT:
      return r'INLINE_FRAGMENT';
    case Enum$__DirectiveLocation.VARIABLE_DEFINITION:
      return r'VARIABLE_DEFINITION';
    case Enum$__DirectiveLocation.SCHEMA:
      return r'SCHEMA';
    case Enum$__DirectiveLocation.SCALAR:
      return r'SCALAR';
    case Enum$__DirectiveLocation.OBJECT:
      return r'OBJECT';
    case Enum$__DirectiveLocation.FIELD_DEFINITION:
      return r'FIELD_DEFINITION';
    case Enum$__DirectiveLocation.ARGUMENT_DEFINITION:
      return r'ARGUMENT_DEFINITION';
    case Enum$__DirectiveLocation.INTERFACE:
      return r'INTERFACE';
    case Enum$__DirectiveLocation.UNION:
      return r'UNION';
    case Enum$__DirectiveLocation.ENUM:
      return r'ENUM';
    case Enum$__DirectiveLocation.ENUM_VALUE:
      return r'ENUM_VALUE';
    case Enum$__DirectiveLocation.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION:
      return r'INPUT_FIELD_DEFINITION';
    case Enum$__DirectiveLocation.$unknown:
      return r'$unknown';
  }
}

Enum$__DirectiveLocation fromJson$Enum$__DirectiveLocation(String value) {
  switch (value) {
    case r'QUERY':
      return Enum$__DirectiveLocation.QUERY;
    case r'MUTATION':
      return Enum$__DirectiveLocation.MUTATION;
    case r'SUBSCRIPTION':
      return Enum$__DirectiveLocation.SUBSCRIPTION;
    case r'FIELD':
      return Enum$__DirectiveLocation.FIELD;
    case r'FRAGMENT_DEFINITION':
      return Enum$__DirectiveLocation.FRAGMENT_DEFINITION;
    case r'FRAGMENT_SPREAD':
      return Enum$__DirectiveLocation.FRAGMENT_SPREAD;
    case r'INLINE_FRAGMENT':
      return Enum$__DirectiveLocation.INLINE_FRAGMENT;
    case r'VARIABLE_DEFINITION':
      return Enum$__DirectiveLocation.VARIABLE_DEFINITION;
    case r'SCHEMA':
      return Enum$__DirectiveLocation.SCHEMA;
    case r'SCALAR':
      return Enum$__DirectiveLocation.SCALAR;
    case r'OBJECT':
      return Enum$__DirectiveLocation.OBJECT;
    case r'FIELD_DEFINITION':
      return Enum$__DirectiveLocation.FIELD_DEFINITION;
    case r'ARGUMENT_DEFINITION':
      return Enum$__DirectiveLocation.ARGUMENT_DEFINITION;
    case r'INTERFACE':
      return Enum$__DirectiveLocation.INTERFACE;
    case r'UNION':
      return Enum$__DirectiveLocation.UNION;
    case r'ENUM':
      return Enum$__DirectiveLocation.ENUM;
    case r'ENUM_VALUE':
      return Enum$__DirectiveLocation.ENUM_VALUE;
    case r'INPUT_OBJECT':
      return Enum$__DirectiveLocation.INPUT_OBJECT;
    case r'INPUT_FIELD_DEFINITION':
      return Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION;
    default:
      return Enum$__DirectiveLocation.$unknown;
  }
}

const possibleTypesMap = <String, Set<String>>{};
