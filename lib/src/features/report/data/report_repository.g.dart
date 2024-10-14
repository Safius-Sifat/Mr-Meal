// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$reportRepositoryHash() => r'382cd7ee8477b9970dc8f4999368b394f8276bdc';

/// See also [reportRepository].
@ProviderFor(reportRepository)
final reportRepositoryProvider = AutoDisposeProvider<ReportRepository>.internal(
  reportRepository,
  name: r'reportRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$reportRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ReportRepositoryRef = AutoDisposeProviderRef<ReportRepository>;
String _$fetchHistoryHash() => r'02b16af63bf16dd595d715cb6fb8c51031bbe98f';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [fetchHistory].
@ProviderFor(fetchHistory)
const fetchHistoryProvider = FetchHistoryFamily();

/// See also [fetchHistory].
class FetchHistoryFamily extends Family<AsyncValue<History>> {
  /// See also [fetchHistory].
  const FetchHistoryFamily();

  /// See also [fetchHistory].
  FetchHistoryProvider call({
    required int page,
    required String type,
  }) {
    return FetchHistoryProvider(
      page: page,
      type: type,
    );
  }

  @override
  FetchHistoryProvider getProviderOverride(
    covariant FetchHistoryProvider provider,
  ) {
    return call(
      page: provider.page,
      type: provider.type,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchHistoryProvider';
}

/// See also [fetchHistory].
class FetchHistoryProvider extends AutoDisposeFutureProvider<History> {
  /// See also [fetchHistory].
  FetchHistoryProvider({
    required int page,
    required String type,
  }) : this._internal(
          (ref) => fetchHistory(
            ref as FetchHistoryRef,
            page: page,
            type: type,
          ),
          from: fetchHistoryProvider,
          name: r'fetchHistoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchHistoryHash,
          dependencies: FetchHistoryFamily._dependencies,
          allTransitiveDependencies:
              FetchHistoryFamily._allTransitiveDependencies,
          page: page,
          type: type,
        );

  FetchHistoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
    required this.type,
  }) : super.internal();

  final int page;
  final String type;

  @override
  Override overrideWith(
    FutureOr<History> Function(FetchHistoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchHistoryProvider._internal(
        (ref) => create(ref as FetchHistoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
        type: type,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<History> createElement() {
    return _FetchHistoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchHistoryProvider &&
        other.page == page &&
        other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchHistoryRef on AutoDisposeFutureProviderRef<History> {
  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `type` of this provider.
  String get type;
}

class _FetchHistoryProviderElement
    extends AutoDisposeFutureProviderElement<History> with FetchHistoryRef {
  _FetchHistoryProviderElement(super.provider);

  @override
  int get page => (origin as FetchHistoryProvider).page;
  @override
  String get type => (origin as FetchHistoryProvider).type;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
