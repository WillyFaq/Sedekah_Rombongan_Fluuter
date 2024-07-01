// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getCarouselHash() => r'2501cdf619638cea797f0551749c591f1c9ae083';

/// See also [getCarousel].
@ProviderFor(getCarousel)
final getCarouselProvider =
    AutoDisposeFutureProvider<List<CarouselModel>>.internal(
  getCarousel,
  name: r'getCarouselProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getCarouselHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetCarouselRef = AutoDisposeFutureProviderRef<List<CarouselModel>>;
String _$getCategoriesHash() => r'3afe4d23d90d54dd60aa5aa1d50b8ee550a68d29';

/// See also [getCategories].
@ProviderFor(getCategories)
final getCategoriesProvider =
    AutoDisposeFutureProvider<List<Map<String, dynamic>>>.internal(
  getCategories,
  name: r'getCategoriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getCategoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetCategoriesRef
    = AutoDisposeFutureProviderRef<List<Map<String, dynamic>>>;
String _$getAllProgramsHash() => r'cc3e72ca60aac73f69697c8fa361f361b68151cc';

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

/// See also [getAllPrograms].
@ProviderFor(getAllPrograms)
const getAllProgramsProvider = GetAllProgramsFamily();

/// See also [getAllPrograms].
class GetAllProgramsFamily extends Family<AsyncValue<PaginationProgramModel>> {
  /// See also [getAllPrograms].
  const GetAllProgramsFamily();

  /// See also [getAllPrograms].
  GetAllProgramsProvider call(
    int cat,
    int page,
    String qry,
  ) {
    return GetAllProgramsProvider(
      cat,
      page,
      qry,
    );
  }

  @override
  GetAllProgramsProvider getProviderOverride(
    covariant GetAllProgramsProvider provider,
  ) {
    return call(
      provider.cat,
      provider.page,
      provider.qry,
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
  String? get name => r'getAllProgramsProvider';
}

/// See also [getAllPrograms].
class GetAllProgramsProvider
    extends AutoDisposeFutureProvider<PaginationProgramModel> {
  /// See also [getAllPrograms].
  GetAllProgramsProvider(
    int cat,
    int page,
    String qry,
  ) : this._internal(
          (ref) => getAllPrograms(
            ref as GetAllProgramsRef,
            cat,
            page,
            qry,
          ),
          from: getAllProgramsProvider,
          name: r'getAllProgramsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAllProgramsHash,
          dependencies: GetAllProgramsFamily._dependencies,
          allTransitiveDependencies:
              GetAllProgramsFamily._allTransitiveDependencies,
          cat: cat,
          page: page,
          qry: qry,
        );

  GetAllProgramsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.cat,
    required this.page,
    required this.qry,
  }) : super.internal();

  final int cat;
  final int page;
  final String qry;

  @override
  Override overrideWith(
    FutureOr<PaginationProgramModel> Function(GetAllProgramsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAllProgramsProvider._internal(
        (ref) => create(ref as GetAllProgramsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        cat: cat,
        page: page,
        qry: qry,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PaginationProgramModel> createElement() {
    return _GetAllProgramsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAllProgramsProvider &&
        other.cat == cat &&
        other.page == page &&
        other.qry == qry;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cat.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, qry.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetAllProgramsRef
    on AutoDisposeFutureProviderRef<PaginationProgramModel> {
  /// The parameter `cat` of this provider.
  int get cat;

  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `qry` of this provider.
  String get qry;
}

class _GetAllProgramsProviderElement
    extends AutoDisposeFutureProviderElement<PaginationProgramModel>
    with GetAllProgramsRef {
  _GetAllProgramsProviderElement(super.provider);

  @override
  int get cat => (origin as GetAllProgramsProvider).cat;
  @override
  int get page => (origin as GetAllProgramsProvider).page;
  @override
  String get qry => (origin as GetAllProgramsProvider).qry;
}

String _$homeViewModelHash() => r'b7d2bc4fcb1e31f0700101a7dc05e368df9b4959';

/// See also [HomeViewModel].
@ProviderFor(HomeViewModel)
final homeViewModelProvider =
    AutoDisposeNotifierProvider<HomeViewModel, AsyncValue?>.internal(
  HomeViewModel.new,
  name: r'homeViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$homeViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HomeViewModel = AutoDisposeNotifier<AsyncValue?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
