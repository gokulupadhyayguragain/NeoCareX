// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summarization_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SummarizationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit) fetchSummarization,
    required TResult Function(SummarizationData summarizationData)
        onSummarizationUpdate,
    required TResult Function() retryFetch,
    required TResult Function() loadNextPage,
    required TResult Function() loadPreviousPage,
    required TResult Function(int page) goToPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit)? fetchSummarization,
    TResult? Function(SummarizationData summarizationData)?
        onSummarizationUpdate,
    TResult? Function()? retryFetch,
    TResult? Function()? loadNextPage,
    TResult? Function()? loadPreviousPage,
    TResult? Function(int page)? goToPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit)? fetchSummarization,
    TResult Function(SummarizationData summarizationData)?
        onSummarizationUpdate,
    TResult Function()? retryFetch,
    TResult Function()? loadNextPage,
    TResult Function()? loadPreviousPage,
    TResult Function(int page)? goToPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchSummarization value) fetchSummarization,
    required TResult Function(OnSummarizationUpdate value)
        onSummarizationUpdate,
    required TResult Function(RetryFetch value) retryFetch,
    required TResult Function(LoadNextPage value) loadNextPage,
    required TResult Function(LoadPreviousPage value) loadPreviousPage,
    required TResult Function(GoToPage value) goToPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchSummarization value)? fetchSummarization,
    TResult? Function(OnSummarizationUpdate value)? onSummarizationUpdate,
    TResult? Function(RetryFetch value)? retryFetch,
    TResult? Function(LoadNextPage value)? loadNextPage,
    TResult? Function(LoadPreviousPage value)? loadPreviousPage,
    TResult? Function(GoToPage value)? goToPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchSummarization value)? fetchSummarization,
    TResult Function(OnSummarizationUpdate value)? onSummarizationUpdate,
    TResult Function(RetryFetch value)? retryFetch,
    TResult Function(LoadNextPage value)? loadNextPage,
    TResult Function(LoadPreviousPage value)? loadPreviousPage,
    TResult Function(GoToPage value)? goToPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SummarizationEventCopyWith<$Res> {
  factory $SummarizationEventCopyWith(
          SummarizationEvent value, $Res Function(SummarizationEvent) then) =
      _$SummarizationEventCopyWithImpl<$Res, SummarizationEvent>;
}

/// @nodoc
class _$SummarizationEventCopyWithImpl<$Res, $Val extends SummarizationEvent>
    implements $SummarizationEventCopyWith<$Res> {
  _$SummarizationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchSummarizationImplCopyWith<$Res> {
  factory _$$FetchSummarizationImplCopyWith(_$FetchSummarizationImpl value,
          $Res Function(_$FetchSummarizationImpl) then) =
      __$$FetchSummarizationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page, int limit});
}

/// @nodoc
class __$$FetchSummarizationImplCopyWithImpl<$Res>
    extends _$SummarizationEventCopyWithImpl<$Res, _$FetchSummarizationImpl>
    implements _$$FetchSummarizationImplCopyWith<$Res> {
  __$$FetchSummarizationImplCopyWithImpl(_$FetchSummarizationImpl _value,
      $Res Function(_$FetchSummarizationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(_$FetchSummarizationImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FetchSummarizationImpl implements FetchSummarization {
  const _$FetchSummarizationImpl({this.page = 1, this.limit = 10});

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;

  @override
  String toString() {
    return 'SummarizationEvent.fetchSummarization(page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchSummarizationImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchSummarizationImplCopyWith<_$FetchSummarizationImpl> get copyWith =>
      __$$FetchSummarizationImplCopyWithImpl<_$FetchSummarizationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit) fetchSummarization,
    required TResult Function(SummarizationData summarizationData)
        onSummarizationUpdate,
    required TResult Function() retryFetch,
    required TResult Function() loadNextPage,
    required TResult Function() loadPreviousPage,
    required TResult Function(int page) goToPage,
  }) {
    return fetchSummarization(page, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit)? fetchSummarization,
    TResult? Function(SummarizationData summarizationData)?
        onSummarizationUpdate,
    TResult? Function()? retryFetch,
    TResult? Function()? loadNextPage,
    TResult? Function()? loadPreviousPage,
    TResult? Function(int page)? goToPage,
  }) {
    return fetchSummarization?.call(page, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit)? fetchSummarization,
    TResult Function(SummarizationData summarizationData)?
        onSummarizationUpdate,
    TResult Function()? retryFetch,
    TResult Function()? loadNextPage,
    TResult Function()? loadPreviousPage,
    TResult Function(int page)? goToPage,
    required TResult orElse(),
  }) {
    if (fetchSummarization != null) {
      return fetchSummarization(page, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchSummarization value) fetchSummarization,
    required TResult Function(OnSummarizationUpdate value)
        onSummarizationUpdate,
    required TResult Function(RetryFetch value) retryFetch,
    required TResult Function(LoadNextPage value) loadNextPage,
    required TResult Function(LoadPreviousPage value) loadPreviousPage,
    required TResult Function(GoToPage value) goToPage,
  }) {
    return fetchSummarization(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchSummarization value)? fetchSummarization,
    TResult? Function(OnSummarizationUpdate value)? onSummarizationUpdate,
    TResult? Function(RetryFetch value)? retryFetch,
    TResult? Function(LoadNextPage value)? loadNextPage,
    TResult? Function(LoadPreviousPage value)? loadPreviousPage,
    TResult? Function(GoToPage value)? goToPage,
  }) {
    return fetchSummarization?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchSummarization value)? fetchSummarization,
    TResult Function(OnSummarizationUpdate value)? onSummarizationUpdate,
    TResult Function(RetryFetch value)? retryFetch,
    TResult Function(LoadNextPage value)? loadNextPage,
    TResult Function(LoadPreviousPage value)? loadPreviousPage,
    TResult Function(GoToPage value)? goToPage,
    required TResult orElse(),
  }) {
    if (fetchSummarization != null) {
      return fetchSummarization(this);
    }
    return orElse();
  }
}

abstract class FetchSummarization implements SummarizationEvent {
  const factory FetchSummarization({final int page, final int limit}) =
      _$FetchSummarizationImpl;

  int get page;
  int get limit;
  @JsonKey(ignore: true)
  _$$FetchSummarizationImplCopyWith<_$FetchSummarizationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnSummarizationUpdateImplCopyWith<$Res> {
  factory _$$OnSummarizationUpdateImplCopyWith(
          _$OnSummarizationUpdateImpl value,
          $Res Function(_$OnSummarizationUpdateImpl) then) =
      __$$OnSummarizationUpdateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SummarizationData summarizationData});

  $SummarizationDataCopyWith<$Res> get summarizationData;
}

/// @nodoc
class __$$OnSummarizationUpdateImplCopyWithImpl<$Res>
    extends _$SummarizationEventCopyWithImpl<$Res, _$OnSummarizationUpdateImpl>
    implements _$$OnSummarizationUpdateImplCopyWith<$Res> {
  __$$OnSummarizationUpdateImplCopyWithImpl(_$OnSummarizationUpdateImpl _value,
      $Res Function(_$OnSummarizationUpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summarizationData = null,
  }) {
    return _then(_$OnSummarizationUpdateImpl(
      summarizationData: null == summarizationData
          ? _value.summarizationData
          : summarizationData // ignore: cast_nullable_to_non_nullable
              as SummarizationData,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SummarizationDataCopyWith<$Res> get summarizationData {
    return $SummarizationDataCopyWith<$Res>(_value.summarizationData, (value) {
      return _then(_value.copyWith(summarizationData: value));
    });
  }
}

/// @nodoc

class _$OnSummarizationUpdateImpl implements OnSummarizationUpdate {
  const _$OnSummarizationUpdateImpl({required this.summarizationData});

  @override
  final SummarizationData summarizationData;

  @override
  String toString() {
    return 'SummarizationEvent.onSummarizationUpdate(summarizationData: $summarizationData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnSummarizationUpdateImpl &&
            (identical(other.summarizationData, summarizationData) ||
                other.summarizationData == summarizationData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, summarizationData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnSummarizationUpdateImplCopyWith<_$OnSummarizationUpdateImpl>
      get copyWith => __$$OnSummarizationUpdateImplCopyWithImpl<
          _$OnSummarizationUpdateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit) fetchSummarization,
    required TResult Function(SummarizationData summarizationData)
        onSummarizationUpdate,
    required TResult Function() retryFetch,
    required TResult Function() loadNextPage,
    required TResult Function() loadPreviousPage,
    required TResult Function(int page) goToPage,
  }) {
    return onSummarizationUpdate(summarizationData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit)? fetchSummarization,
    TResult? Function(SummarizationData summarizationData)?
        onSummarizationUpdate,
    TResult? Function()? retryFetch,
    TResult? Function()? loadNextPage,
    TResult? Function()? loadPreviousPage,
    TResult? Function(int page)? goToPage,
  }) {
    return onSummarizationUpdate?.call(summarizationData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit)? fetchSummarization,
    TResult Function(SummarizationData summarizationData)?
        onSummarizationUpdate,
    TResult Function()? retryFetch,
    TResult Function()? loadNextPage,
    TResult Function()? loadPreviousPage,
    TResult Function(int page)? goToPage,
    required TResult orElse(),
  }) {
    if (onSummarizationUpdate != null) {
      return onSummarizationUpdate(summarizationData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchSummarization value) fetchSummarization,
    required TResult Function(OnSummarizationUpdate value)
        onSummarizationUpdate,
    required TResult Function(RetryFetch value) retryFetch,
    required TResult Function(LoadNextPage value) loadNextPage,
    required TResult Function(LoadPreviousPage value) loadPreviousPage,
    required TResult Function(GoToPage value) goToPage,
  }) {
    return onSummarizationUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchSummarization value)? fetchSummarization,
    TResult? Function(OnSummarizationUpdate value)? onSummarizationUpdate,
    TResult? Function(RetryFetch value)? retryFetch,
    TResult? Function(LoadNextPage value)? loadNextPage,
    TResult? Function(LoadPreviousPage value)? loadPreviousPage,
    TResult? Function(GoToPage value)? goToPage,
  }) {
    return onSummarizationUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchSummarization value)? fetchSummarization,
    TResult Function(OnSummarizationUpdate value)? onSummarizationUpdate,
    TResult Function(RetryFetch value)? retryFetch,
    TResult Function(LoadNextPage value)? loadNextPage,
    TResult Function(LoadPreviousPage value)? loadPreviousPage,
    TResult Function(GoToPage value)? goToPage,
    required TResult orElse(),
  }) {
    if (onSummarizationUpdate != null) {
      return onSummarizationUpdate(this);
    }
    return orElse();
  }
}

abstract class OnSummarizationUpdate implements SummarizationEvent {
  const factory OnSummarizationUpdate(
          {required final SummarizationData summarizationData}) =
      _$OnSummarizationUpdateImpl;

  SummarizationData get summarizationData;
  @JsonKey(ignore: true)
  _$$OnSummarizationUpdateImplCopyWith<_$OnSummarizationUpdateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RetryFetchImplCopyWith<$Res> {
  factory _$$RetryFetchImplCopyWith(
          _$RetryFetchImpl value, $Res Function(_$RetryFetchImpl) then) =
      __$$RetryFetchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RetryFetchImplCopyWithImpl<$Res>
    extends _$SummarizationEventCopyWithImpl<$Res, _$RetryFetchImpl>
    implements _$$RetryFetchImplCopyWith<$Res> {
  __$$RetryFetchImplCopyWithImpl(
      _$RetryFetchImpl _value, $Res Function(_$RetryFetchImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RetryFetchImpl implements RetryFetch {
  const _$RetryFetchImpl();

  @override
  String toString() {
    return 'SummarizationEvent.retryFetch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RetryFetchImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit) fetchSummarization,
    required TResult Function(SummarizationData summarizationData)
        onSummarizationUpdate,
    required TResult Function() retryFetch,
    required TResult Function() loadNextPage,
    required TResult Function() loadPreviousPage,
    required TResult Function(int page) goToPage,
  }) {
    return retryFetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit)? fetchSummarization,
    TResult? Function(SummarizationData summarizationData)?
        onSummarizationUpdate,
    TResult? Function()? retryFetch,
    TResult? Function()? loadNextPage,
    TResult? Function()? loadPreviousPage,
    TResult? Function(int page)? goToPage,
  }) {
    return retryFetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit)? fetchSummarization,
    TResult Function(SummarizationData summarizationData)?
        onSummarizationUpdate,
    TResult Function()? retryFetch,
    TResult Function()? loadNextPage,
    TResult Function()? loadPreviousPage,
    TResult Function(int page)? goToPage,
    required TResult orElse(),
  }) {
    if (retryFetch != null) {
      return retryFetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchSummarization value) fetchSummarization,
    required TResult Function(OnSummarizationUpdate value)
        onSummarizationUpdate,
    required TResult Function(RetryFetch value) retryFetch,
    required TResult Function(LoadNextPage value) loadNextPage,
    required TResult Function(LoadPreviousPage value) loadPreviousPage,
    required TResult Function(GoToPage value) goToPage,
  }) {
    return retryFetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchSummarization value)? fetchSummarization,
    TResult? Function(OnSummarizationUpdate value)? onSummarizationUpdate,
    TResult? Function(RetryFetch value)? retryFetch,
    TResult? Function(LoadNextPage value)? loadNextPage,
    TResult? Function(LoadPreviousPage value)? loadPreviousPage,
    TResult? Function(GoToPage value)? goToPage,
  }) {
    return retryFetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchSummarization value)? fetchSummarization,
    TResult Function(OnSummarizationUpdate value)? onSummarizationUpdate,
    TResult Function(RetryFetch value)? retryFetch,
    TResult Function(LoadNextPage value)? loadNextPage,
    TResult Function(LoadPreviousPage value)? loadPreviousPage,
    TResult Function(GoToPage value)? goToPage,
    required TResult orElse(),
  }) {
    if (retryFetch != null) {
      return retryFetch(this);
    }
    return orElse();
  }
}

abstract class RetryFetch implements SummarizationEvent {
  const factory RetryFetch() = _$RetryFetchImpl;
}

/// @nodoc
abstract class _$$LoadNextPageImplCopyWith<$Res> {
  factory _$$LoadNextPageImplCopyWith(
          _$LoadNextPageImpl value, $Res Function(_$LoadNextPageImpl) then) =
      __$$LoadNextPageImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadNextPageImplCopyWithImpl<$Res>
    extends _$SummarizationEventCopyWithImpl<$Res, _$LoadNextPageImpl>
    implements _$$LoadNextPageImplCopyWith<$Res> {
  __$$LoadNextPageImplCopyWithImpl(
      _$LoadNextPageImpl _value, $Res Function(_$LoadNextPageImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadNextPageImpl implements LoadNextPage {
  const _$LoadNextPageImpl();

  @override
  String toString() {
    return 'SummarizationEvent.loadNextPage()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadNextPageImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit) fetchSummarization,
    required TResult Function(SummarizationData summarizationData)
        onSummarizationUpdate,
    required TResult Function() retryFetch,
    required TResult Function() loadNextPage,
    required TResult Function() loadPreviousPage,
    required TResult Function(int page) goToPage,
  }) {
    return loadNextPage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit)? fetchSummarization,
    TResult? Function(SummarizationData summarizationData)?
        onSummarizationUpdate,
    TResult? Function()? retryFetch,
    TResult? Function()? loadNextPage,
    TResult? Function()? loadPreviousPage,
    TResult? Function(int page)? goToPage,
  }) {
    return loadNextPage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit)? fetchSummarization,
    TResult Function(SummarizationData summarizationData)?
        onSummarizationUpdate,
    TResult Function()? retryFetch,
    TResult Function()? loadNextPage,
    TResult Function()? loadPreviousPage,
    TResult Function(int page)? goToPage,
    required TResult orElse(),
  }) {
    if (loadNextPage != null) {
      return loadNextPage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchSummarization value) fetchSummarization,
    required TResult Function(OnSummarizationUpdate value)
        onSummarizationUpdate,
    required TResult Function(RetryFetch value) retryFetch,
    required TResult Function(LoadNextPage value) loadNextPage,
    required TResult Function(LoadPreviousPage value) loadPreviousPage,
    required TResult Function(GoToPage value) goToPage,
  }) {
    return loadNextPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchSummarization value)? fetchSummarization,
    TResult? Function(OnSummarizationUpdate value)? onSummarizationUpdate,
    TResult? Function(RetryFetch value)? retryFetch,
    TResult? Function(LoadNextPage value)? loadNextPage,
    TResult? Function(LoadPreviousPage value)? loadPreviousPage,
    TResult? Function(GoToPage value)? goToPage,
  }) {
    return loadNextPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchSummarization value)? fetchSummarization,
    TResult Function(OnSummarizationUpdate value)? onSummarizationUpdate,
    TResult Function(RetryFetch value)? retryFetch,
    TResult Function(LoadNextPage value)? loadNextPage,
    TResult Function(LoadPreviousPage value)? loadPreviousPage,
    TResult Function(GoToPage value)? goToPage,
    required TResult orElse(),
  }) {
    if (loadNextPage != null) {
      return loadNextPage(this);
    }
    return orElse();
  }
}

abstract class LoadNextPage implements SummarizationEvent {
  const factory LoadNextPage() = _$LoadNextPageImpl;
}

/// @nodoc
abstract class _$$LoadPreviousPageImplCopyWith<$Res> {
  factory _$$LoadPreviousPageImplCopyWith(_$LoadPreviousPageImpl value,
          $Res Function(_$LoadPreviousPageImpl) then) =
      __$$LoadPreviousPageImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadPreviousPageImplCopyWithImpl<$Res>
    extends _$SummarizationEventCopyWithImpl<$Res, _$LoadPreviousPageImpl>
    implements _$$LoadPreviousPageImplCopyWith<$Res> {
  __$$LoadPreviousPageImplCopyWithImpl(_$LoadPreviousPageImpl _value,
      $Res Function(_$LoadPreviousPageImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadPreviousPageImpl implements LoadPreviousPage {
  const _$LoadPreviousPageImpl();

  @override
  String toString() {
    return 'SummarizationEvent.loadPreviousPage()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadPreviousPageImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit) fetchSummarization,
    required TResult Function(SummarizationData summarizationData)
        onSummarizationUpdate,
    required TResult Function() retryFetch,
    required TResult Function() loadNextPage,
    required TResult Function() loadPreviousPage,
    required TResult Function(int page) goToPage,
  }) {
    return loadPreviousPage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit)? fetchSummarization,
    TResult? Function(SummarizationData summarizationData)?
        onSummarizationUpdate,
    TResult? Function()? retryFetch,
    TResult? Function()? loadNextPage,
    TResult? Function()? loadPreviousPage,
    TResult? Function(int page)? goToPage,
  }) {
    return loadPreviousPage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit)? fetchSummarization,
    TResult Function(SummarizationData summarizationData)?
        onSummarizationUpdate,
    TResult Function()? retryFetch,
    TResult Function()? loadNextPage,
    TResult Function()? loadPreviousPage,
    TResult Function(int page)? goToPage,
    required TResult orElse(),
  }) {
    if (loadPreviousPage != null) {
      return loadPreviousPage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchSummarization value) fetchSummarization,
    required TResult Function(OnSummarizationUpdate value)
        onSummarizationUpdate,
    required TResult Function(RetryFetch value) retryFetch,
    required TResult Function(LoadNextPage value) loadNextPage,
    required TResult Function(LoadPreviousPage value) loadPreviousPage,
    required TResult Function(GoToPage value) goToPage,
  }) {
    return loadPreviousPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchSummarization value)? fetchSummarization,
    TResult? Function(OnSummarizationUpdate value)? onSummarizationUpdate,
    TResult? Function(RetryFetch value)? retryFetch,
    TResult? Function(LoadNextPage value)? loadNextPage,
    TResult? Function(LoadPreviousPage value)? loadPreviousPage,
    TResult? Function(GoToPage value)? goToPage,
  }) {
    return loadPreviousPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchSummarization value)? fetchSummarization,
    TResult Function(OnSummarizationUpdate value)? onSummarizationUpdate,
    TResult Function(RetryFetch value)? retryFetch,
    TResult Function(LoadNextPage value)? loadNextPage,
    TResult Function(LoadPreviousPage value)? loadPreviousPage,
    TResult Function(GoToPage value)? goToPage,
    required TResult orElse(),
  }) {
    if (loadPreviousPage != null) {
      return loadPreviousPage(this);
    }
    return orElse();
  }
}

abstract class LoadPreviousPage implements SummarizationEvent {
  const factory LoadPreviousPage() = _$LoadPreviousPageImpl;
}

/// @nodoc
abstract class _$$GoToPageImplCopyWith<$Res> {
  factory _$$GoToPageImplCopyWith(
          _$GoToPageImpl value, $Res Function(_$GoToPageImpl) then) =
      __$$GoToPageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page});
}

/// @nodoc
class __$$GoToPageImplCopyWithImpl<$Res>
    extends _$SummarizationEventCopyWithImpl<$Res, _$GoToPageImpl>
    implements _$$GoToPageImplCopyWith<$Res> {
  __$$GoToPageImplCopyWithImpl(
      _$GoToPageImpl _value, $Res Function(_$GoToPageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
  }) {
    return _then(_$GoToPageImpl(
      null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GoToPageImpl implements GoToPage {
  const _$GoToPageImpl(this.page);

  @override
  final int page;

  @override
  String toString() {
    return 'SummarizationEvent.goToPage(page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoToPageImpl &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GoToPageImplCopyWith<_$GoToPageImpl> get copyWith =>
      __$$GoToPageImplCopyWithImpl<_$GoToPageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit) fetchSummarization,
    required TResult Function(SummarizationData summarizationData)
        onSummarizationUpdate,
    required TResult Function() retryFetch,
    required TResult Function() loadNextPage,
    required TResult Function() loadPreviousPage,
    required TResult Function(int page) goToPage,
  }) {
    return goToPage(page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit)? fetchSummarization,
    TResult? Function(SummarizationData summarizationData)?
        onSummarizationUpdate,
    TResult? Function()? retryFetch,
    TResult? Function()? loadNextPage,
    TResult? Function()? loadPreviousPage,
    TResult? Function(int page)? goToPage,
  }) {
    return goToPage?.call(page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit)? fetchSummarization,
    TResult Function(SummarizationData summarizationData)?
        onSummarizationUpdate,
    TResult Function()? retryFetch,
    TResult Function()? loadNextPage,
    TResult Function()? loadPreviousPage,
    TResult Function(int page)? goToPage,
    required TResult orElse(),
  }) {
    if (goToPage != null) {
      return goToPage(page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchSummarization value) fetchSummarization,
    required TResult Function(OnSummarizationUpdate value)
        onSummarizationUpdate,
    required TResult Function(RetryFetch value) retryFetch,
    required TResult Function(LoadNextPage value) loadNextPage,
    required TResult Function(LoadPreviousPage value) loadPreviousPage,
    required TResult Function(GoToPage value) goToPage,
  }) {
    return goToPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchSummarization value)? fetchSummarization,
    TResult? Function(OnSummarizationUpdate value)? onSummarizationUpdate,
    TResult? Function(RetryFetch value)? retryFetch,
    TResult? Function(LoadNextPage value)? loadNextPage,
    TResult? Function(LoadPreviousPage value)? loadPreviousPage,
    TResult? Function(GoToPage value)? goToPage,
  }) {
    return goToPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchSummarization value)? fetchSummarization,
    TResult Function(OnSummarizationUpdate value)? onSummarizationUpdate,
    TResult Function(RetryFetch value)? retryFetch,
    TResult Function(LoadNextPage value)? loadNextPage,
    TResult Function(LoadPreviousPage value)? loadPreviousPage,
    TResult Function(GoToPage value)? goToPage,
    required TResult orElse(),
  }) {
    if (goToPage != null) {
      return goToPage(this);
    }
    return orElse();
  }
}

abstract class GoToPage implements SummarizationEvent {
  const factory GoToPage(final int page) = _$GoToPageImpl;

  int get page;
  @JsonKey(ignore: true)
  _$$GoToPageImplCopyWith<_$GoToPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
