// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'home_bloc.dart';

class HomeEventMapper extends ClassMapperBase<HomeEvent> {
  HomeEventMapper._();

  static HomeEventMapper? _instance;
  static HomeEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HomeEventMapper._());
      InitializeEventMapper.ensureInitialized();
      NextImageEventMapper.ensureInitialized();
      FetchAnotherImageEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'HomeEvent';

  @override
  final MappableFields<HomeEvent> fields = const {};

  static HomeEvent _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('HomeEvent');
  }

  @override
  final Function instantiate = _instantiate;

  static HomeEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HomeEvent>(map);
  }

  static HomeEvent fromJson(String json) {
    return ensureInitialized().decodeJson<HomeEvent>(json);
  }
}

mixin HomeEventMappable {
  String toJson();
  Map<String, dynamic> toMap();
  HomeEventCopyWith<HomeEvent, HomeEvent, HomeEvent> get copyWith;
}

abstract class HomeEventCopyWith<$R, $In extends HomeEvent, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  HomeEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class InitializeEventMapper extends ClassMapperBase<InitializeEvent> {
  InitializeEventMapper._();

  static InitializeEventMapper? _instance;
  static InitializeEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = InitializeEventMapper._());
      HomeEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'InitializeEvent';

  @override
  final MappableFields<InitializeEvent> fields = const {};

  static InitializeEvent _instantiate(DecodingData data) {
    return InitializeEvent();
  }

  @override
  final Function instantiate = _instantiate;

  static InitializeEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<InitializeEvent>(map);
  }

  static InitializeEvent fromJson(String json) {
    return ensureInitialized().decodeJson<InitializeEvent>(json);
  }
}

mixin InitializeEventMappable {
  String toJson() {
    return InitializeEventMapper.ensureInitialized()
        .encodeJson<InitializeEvent>(this as InitializeEvent);
  }

  Map<String, dynamic> toMap() {
    return InitializeEventMapper.ensureInitialized().encodeMap<InitializeEvent>(
      this as InitializeEvent,
    );
  }

  InitializeEventCopyWith<InitializeEvent, InitializeEvent, InitializeEvent>
  get copyWith =>
      _InitializeEventCopyWithImpl<InitializeEvent, InitializeEvent>(
        this as InitializeEvent,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return InitializeEventMapper.ensureInitialized().stringifyValue(
      this as InitializeEvent,
    );
  }

  @override
  bool operator ==(Object other) {
    return InitializeEventMapper.ensureInitialized().equalsValue(
      this as InitializeEvent,
      other,
    );
  }

  @override
  int get hashCode {
    return InitializeEventMapper.ensureInitialized().hashValue(
      this as InitializeEvent,
    );
  }
}

extension InitializeEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, InitializeEvent, $Out> {
  InitializeEventCopyWith<$R, InitializeEvent, $Out> get $asInitializeEvent =>
      $base.as((v, t, t2) => _InitializeEventCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class InitializeEventCopyWith<$R, $In extends InitializeEvent, $Out>
    implements HomeEventCopyWith<$R, $In, $Out> {
  @override
  $R call();
  InitializeEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _InitializeEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, InitializeEvent, $Out>
    implements InitializeEventCopyWith<$R, InitializeEvent, $Out> {
  _InitializeEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<InitializeEvent> $mapper =
      InitializeEventMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  InitializeEvent $make(CopyWithData data) => InitializeEvent();

  @override
  InitializeEventCopyWith<$R2, InitializeEvent, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _InitializeEventCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class NextImageEventMapper extends ClassMapperBase<NextImageEvent> {
  NextImageEventMapper._();

  static NextImageEventMapper? _instance;
  static NextImageEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NextImageEventMapper._());
      HomeEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'NextImageEvent';

  @override
  final MappableFields<NextImageEvent> fields = const {};

  static NextImageEvent _instantiate(DecodingData data) {
    return NextImageEvent();
  }

  @override
  final Function instantiate = _instantiate;

  static NextImageEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NextImageEvent>(map);
  }

  static NextImageEvent fromJson(String json) {
    return ensureInitialized().decodeJson<NextImageEvent>(json);
  }
}

mixin NextImageEventMappable {
  String toJson() {
    return NextImageEventMapper.ensureInitialized().encodeJson<NextImageEvent>(
      this as NextImageEvent,
    );
  }

  Map<String, dynamic> toMap() {
    return NextImageEventMapper.ensureInitialized().encodeMap<NextImageEvent>(
      this as NextImageEvent,
    );
  }

  NextImageEventCopyWith<NextImageEvent, NextImageEvent, NextImageEvent>
  get copyWith => _NextImageEventCopyWithImpl<NextImageEvent, NextImageEvent>(
    this as NextImageEvent,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return NextImageEventMapper.ensureInitialized().stringifyValue(
      this as NextImageEvent,
    );
  }

  @override
  bool operator ==(Object other) {
    return NextImageEventMapper.ensureInitialized().equalsValue(
      this as NextImageEvent,
      other,
    );
  }

  @override
  int get hashCode {
    return NextImageEventMapper.ensureInitialized().hashValue(
      this as NextImageEvent,
    );
  }
}

extension NextImageEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NextImageEvent, $Out> {
  NextImageEventCopyWith<$R, NextImageEvent, $Out> get $asNextImageEvent =>
      $base.as((v, t, t2) => _NextImageEventCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class NextImageEventCopyWith<$R, $In extends NextImageEvent, $Out>
    implements HomeEventCopyWith<$R, $In, $Out> {
  @override
  $R call();
  NextImageEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _NextImageEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NextImageEvent, $Out>
    implements NextImageEventCopyWith<$R, NextImageEvent, $Out> {
  _NextImageEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NextImageEvent> $mapper =
      NextImageEventMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  NextImageEvent $make(CopyWithData data) => NextImageEvent();

  @override
  NextImageEventCopyWith<$R2, NextImageEvent, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _NextImageEventCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class FetchAnotherImageEventMapper
    extends ClassMapperBase<FetchAnotherImageEvent> {
  FetchAnotherImageEventMapper._();

  static FetchAnotherImageEventMapper? _instance;
  static FetchAnotherImageEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FetchAnotherImageEventMapper._());
      HomeEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FetchAnotherImageEvent';

  @override
  final MappableFields<FetchAnotherImageEvent> fields = const {};

  static FetchAnotherImageEvent _instantiate(DecodingData data) {
    return FetchAnotherImageEvent();
  }

  @override
  final Function instantiate = _instantiate;

  static FetchAnotherImageEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FetchAnotherImageEvent>(map);
  }

  static FetchAnotherImageEvent fromJson(String json) {
    return ensureInitialized().decodeJson<FetchAnotherImageEvent>(json);
  }
}

mixin FetchAnotherImageEventMappable {
  String toJson() {
    return FetchAnotherImageEventMapper.ensureInitialized()
        .encodeJson<FetchAnotherImageEvent>(this as FetchAnotherImageEvent);
  }

  Map<String, dynamic> toMap() {
    return FetchAnotherImageEventMapper.ensureInitialized()
        .encodeMap<FetchAnotherImageEvent>(this as FetchAnotherImageEvent);
  }

  FetchAnotherImageEventCopyWith<
    FetchAnotherImageEvent,
    FetchAnotherImageEvent,
    FetchAnotherImageEvent
  >
  get copyWith =>
      _FetchAnotherImageEventCopyWithImpl<
        FetchAnotherImageEvent,
        FetchAnotherImageEvent
      >(this as FetchAnotherImageEvent, $identity, $identity);
  @override
  String toString() {
    return FetchAnotherImageEventMapper.ensureInitialized().stringifyValue(
      this as FetchAnotherImageEvent,
    );
  }

  @override
  bool operator ==(Object other) {
    return FetchAnotherImageEventMapper.ensureInitialized().equalsValue(
      this as FetchAnotherImageEvent,
      other,
    );
  }

  @override
  int get hashCode {
    return FetchAnotherImageEventMapper.ensureInitialized().hashValue(
      this as FetchAnotherImageEvent,
    );
  }
}

extension FetchAnotherImageEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FetchAnotherImageEvent, $Out> {
  FetchAnotherImageEventCopyWith<$R, FetchAnotherImageEvent, $Out>
  get $asFetchAnotherImageEvent => $base.as(
    (v, t, t2) => _FetchAnotherImageEventCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class FetchAnotherImageEventCopyWith<
  $R,
  $In extends FetchAnotherImageEvent,
  $Out
>
    implements HomeEventCopyWith<$R, $In, $Out> {
  @override
  $R call();
  FetchAnotherImageEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _FetchAnotherImageEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FetchAnotherImageEvent, $Out>
    implements
        FetchAnotherImageEventCopyWith<$R, FetchAnotherImageEvent, $Out> {
  _FetchAnotherImageEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FetchAnotherImageEvent> $mapper =
      FetchAnotherImageEventMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  FetchAnotherImageEvent $make(CopyWithData data) => FetchAnotherImageEvent();

  @override
  FetchAnotherImageEventCopyWith<$R2, FetchAnotherImageEvent, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _FetchAnotherImageEventCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class HomeStateMapper extends ClassMapperBase<HomeState> {
  HomeStateMapper._();

  static HomeStateMapper? _instance;
  static HomeStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HomeStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'HomeState';

  static bool _$isLoading(HomeState v) => v.isLoading;
  static const Field<HomeState, bool> _f$isLoading = Field(
    'isLoading',
    _$isLoading,
  );
  static ImageProvider<Object>? _$currentImage(HomeState v) => v.currentImage;
  static const Field<HomeState, ImageProvider<Object>> _f$currentImage = Field(
    'currentImage',
    _$currentImage,
    opt: true,
  );
  static List<ImageProvider<Object>> _$buffer(HomeState v) => v.buffer;
  static const Field<HomeState, List<ImageProvider<Object>>> _f$buffer = Field(
    'buffer',
    _$buffer,
    opt: true,
    def: const [],
  );
  static Object? _$error(HomeState v) => v.error;
  static const Field<HomeState, Object> _f$error = Field(
    'error',
    _$error,
    opt: true,
  );

  @override
  final MappableFields<HomeState> fields = const {
    #isLoading: _f$isLoading,
    #currentImage: _f$currentImage,
    #buffer: _f$buffer,
    #error: _f$error,
  };

  static HomeState _instantiate(DecodingData data) {
    return HomeState(
      isLoading: data.dec(_f$isLoading),
      currentImage: data.dec(_f$currentImage),
      buffer: data.dec(_f$buffer),
      error: data.dec(_f$error),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static HomeState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HomeState>(map);
  }

  static HomeState fromJson(String json) {
    return ensureInitialized().decodeJson<HomeState>(json);
  }
}

mixin HomeStateMappable {
  String toJson() {
    return HomeStateMapper.ensureInitialized().encodeJson<HomeState>(
      this as HomeState,
    );
  }

  Map<String, dynamic> toMap() {
    return HomeStateMapper.ensureInitialized().encodeMap<HomeState>(
      this as HomeState,
    );
  }

  HomeStateCopyWith<HomeState, HomeState, HomeState> get copyWith =>
      _HomeStateCopyWithImpl<HomeState, HomeState>(
        this as HomeState,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return HomeStateMapper.ensureInitialized().stringifyValue(
      this as HomeState,
    );
  }

  @override
  bool operator ==(Object other) {
    return HomeStateMapper.ensureInitialized().equalsValue(
      this as HomeState,
      other,
    );
  }

  @override
  int get hashCode {
    return HomeStateMapper.ensureInitialized().hashValue(this as HomeState);
  }
}

extension HomeStateValueCopy<$R, $Out> on ObjectCopyWith<$R, HomeState, $Out> {
  HomeStateCopyWith<$R, HomeState, $Out> get $asHomeState =>
      $base.as((v, t, t2) => _HomeStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class HomeStateCopyWith<$R, $In extends HomeState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    ImageProvider<Object>,
    ObjectCopyWith<$R, ImageProvider<Object>, ImageProvider<Object>>
  >
  get buffer;
  $R call({
    bool? isLoading,
    ImageProvider<Object>? currentImage,
    List<ImageProvider<Object>>? buffer,
    Object? error,
  });
  HomeStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _HomeStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HomeState, $Out>
    implements HomeStateCopyWith<$R, HomeState, $Out> {
  _HomeStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HomeState> $mapper =
      HomeStateMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    ImageProvider<Object>,
    ObjectCopyWith<$R, ImageProvider<Object>, ImageProvider<Object>>
  >
  get buffer => ListCopyWith(
    $value.buffer,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(buffer: v),
  );
  @override
  $R call({
    bool? isLoading,
    Object? currentImage = $none,
    List<ImageProvider<Object>>? buffer,
    Object? error = $none,
  }) => $apply(
    FieldCopyWithData({
      if (isLoading != null) #isLoading: isLoading,
      if (currentImage != $none) #currentImage: currentImage,
      if (buffer != null) #buffer: buffer,
      if (error != $none) #error: error,
    }),
  );
  @override
  HomeState $make(CopyWithData data) => HomeState(
    isLoading: data.get(#isLoading, or: $value.isLoading),
    currentImage: data.get(#currentImage, or: $value.currentImage),
    buffer: data.get(#buffer, or: $value.buffer),
    error: data.get(#error, or: $value.error),
  );

  @override
  HomeStateCopyWith<$R2, HomeState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _HomeStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

