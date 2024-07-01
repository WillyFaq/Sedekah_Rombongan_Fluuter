// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_program_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getDetailProgramHash() => r'ed74669a4ddf55faf425c7526a9940133bf955bf';

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

/// See also [getDetailProgram].
@ProviderFor(getDetailProgram)
const getDetailProgramProvider = GetDetailProgramFamily();

/// See also [getDetailProgram].
class GetDetailProgramFamily extends Family<AsyncValue<ProgramModel>> {
  /// See also [getDetailProgram].
  const GetDetailProgramFamily();

  /// See also [getDetailProgram].
  GetDetailProgramProvider call(
    String slug,
  ) {
    return GetDetailProgramProvider(
      slug,
    );
  }

  @override
  GetDetailProgramProvider getProviderOverride(
    covariant GetDetailProgramProvider provider,
  ) {
    return call(
      provider.slug,
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
  String? get name => r'getDetailProgramProvider';
}

/// See also [getDetailProgram].
class GetDetailProgramProvider extends AutoDisposeFutureProvider<ProgramModel> {
  /// See also [getDetailProgram].
  GetDetailProgramProvider(
    String slug,
  ) : this._internal(
          (ref) => getDetailProgram(
            ref as GetDetailProgramRef,
            slug,
          ),
          from: getDetailProgramProvider,
          name: r'getDetailProgramProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getDetailProgramHash,
          dependencies: GetDetailProgramFamily._dependencies,
          allTransitiveDependencies:
              GetDetailProgramFamily._allTransitiveDependencies,
          slug: slug,
        );

  GetDetailProgramProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.slug,
  }) : super.internal();

  final String slug;

  @override
  Override overrideWith(
    FutureOr<ProgramModel> Function(GetDetailProgramRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetDetailProgramProvider._internal(
        (ref) => create(ref as GetDetailProgramRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        slug: slug,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ProgramModel> createElement() {
    return _GetDetailProgramProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetDetailProgramProvider && other.slug == slug;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, slug.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetDetailProgramRef on AutoDisposeFutureProviderRef<ProgramModel> {
  /// The parameter `slug` of this provider.
  String get slug;
}

class _GetDetailProgramProviderElement
    extends AutoDisposeFutureProviderElement<ProgramModel>
    with GetDetailProgramRef {
  _GetDetailProgramProviderElement(super.provider);

  @override
  String get slug => (origin as GetDetailProgramProvider).slug;
}

String _$getCommentsHash() => r'501e19e93e29de6e7ffea1a9ec7d644faa92b627';

/// See also [getComments].
@ProviderFor(getComments)
const getCommentsProvider = GetCommentsFamily();

/// See also [getComments].
class GetCommentsFamily extends Family<AsyncValue<ListComment>> {
  /// See also [getComments].
  const GetCommentsFamily();

  /// See also [getComments].
  GetCommentsProvider call(
    String slug,
    int page,
  ) {
    return GetCommentsProvider(
      slug,
      page,
    );
  }

  @override
  GetCommentsProvider getProviderOverride(
    covariant GetCommentsProvider provider,
  ) {
    return call(
      provider.slug,
      provider.page,
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
  String? get name => r'getCommentsProvider';
}

/// See also [getComments].
class GetCommentsProvider extends AutoDisposeFutureProvider<ListComment> {
  /// See also [getComments].
  GetCommentsProvider(
    String slug,
    int page,
  ) : this._internal(
          (ref) => getComments(
            ref as GetCommentsRef,
            slug,
            page,
          ),
          from: getCommentsProvider,
          name: r'getCommentsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCommentsHash,
          dependencies: GetCommentsFamily._dependencies,
          allTransitiveDependencies:
              GetCommentsFamily._allTransitiveDependencies,
          slug: slug,
          page: page,
        );

  GetCommentsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.slug,
    required this.page,
  }) : super.internal();

  final String slug;
  final int page;

  @override
  Override overrideWith(
    FutureOr<ListComment> Function(GetCommentsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCommentsProvider._internal(
        (ref) => create(ref as GetCommentsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        slug: slug,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ListComment> createElement() {
    return _GetCommentsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCommentsProvider &&
        other.slug == slug &&
        other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, slug.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetCommentsRef on AutoDisposeFutureProviderRef<ListComment> {
  /// The parameter `slug` of this provider.
  String get slug;

  /// The parameter `page` of this provider.
  int get page;
}

class _GetCommentsProviderElement
    extends AutoDisposeFutureProviderElement<ListComment> with GetCommentsRef {
  _GetCommentsProviderElement(super.provider);

  @override
  String get slug => (origin as GetCommentsProvider).slug;
  @override
  int get page => (origin as GetCommentsProvider).page;
}

String _$getDonationsHash() => r'ad720c7555c46a7684a5df9fd5c3cb45ffcaca8e';

/// See also [getDonations].
@ProviderFor(getDonations)
const getDonationsProvider = GetDonationsFamily();

/// See also [getDonations].
class GetDonationsFamily extends Family<AsyncValue<ListDonation>> {
  /// See also [getDonations].
  const GetDonationsFamily();

  /// See also [getDonations].
  GetDonationsProvider call(
    String slug,
    int page,
  ) {
    return GetDonationsProvider(
      slug,
      page,
    );
  }

  @override
  GetDonationsProvider getProviderOverride(
    covariant GetDonationsProvider provider,
  ) {
    return call(
      provider.slug,
      provider.page,
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
  String? get name => r'getDonationsProvider';
}

/// See also [getDonations].
class GetDonationsProvider extends AutoDisposeFutureProvider<ListDonation> {
  /// See also [getDonations].
  GetDonationsProvider(
    String slug,
    int page,
  ) : this._internal(
          (ref) => getDonations(
            ref as GetDonationsRef,
            slug,
            page,
          ),
          from: getDonationsProvider,
          name: r'getDonationsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getDonationsHash,
          dependencies: GetDonationsFamily._dependencies,
          allTransitiveDependencies:
              GetDonationsFamily._allTransitiveDependencies,
          slug: slug,
          page: page,
        );

  GetDonationsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.slug,
    required this.page,
  }) : super.internal();

  final String slug;
  final int page;

  @override
  Override overrideWith(
    FutureOr<ListDonation> Function(GetDonationsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetDonationsProvider._internal(
        (ref) => create(ref as GetDonationsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        slug: slug,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ListDonation> createElement() {
    return _GetDonationsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetDonationsProvider &&
        other.slug == slug &&
        other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, slug.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetDonationsRef on AutoDisposeFutureProviderRef<ListDonation> {
  /// The parameter `slug` of this provider.
  String get slug;

  /// The parameter `page` of this provider.
  int get page;
}

class _GetDonationsProviderElement
    extends AutoDisposeFutureProviderElement<ListDonation>
    with GetDonationsRef {
  _GetDonationsProviderElement(super.provider);

  @override
  String get slug => (origin as GetDonationsProvider).slug;
  @override
  int get page => (origin as GetDonationsProvider).page;
}

String _$aminkanHash() => r'746a60f9e39eaebea319cc9d84f9e0b62b02ab99';

/// See also [aminkan].
@ProviderFor(aminkan)
const aminkanProvider = AminkanFamily();

/// See also [aminkan].
class AminkanFamily extends Family<AsyncValue<CommentModel>> {
  /// See also [aminkan].
  const AminkanFamily();

  /// See also [aminkan].
  AminkanProvider call(
    String id,
  ) {
    return AminkanProvider(
      id,
    );
  }

  @override
  AminkanProvider getProviderOverride(
    covariant AminkanProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'aminkanProvider';
}

/// See also [aminkan].
class AminkanProvider extends AutoDisposeFutureProvider<CommentModel> {
  /// See also [aminkan].
  AminkanProvider(
    String id,
  ) : this._internal(
          (ref) => aminkan(
            ref as AminkanRef,
            id,
          ),
          from: aminkanProvider,
          name: r'aminkanProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$aminkanHash,
          dependencies: AminkanFamily._dependencies,
          allTransitiveDependencies: AminkanFamily._allTransitiveDependencies,
          id: id,
        );

  AminkanProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<CommentModel> Function(AminkanRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AminkanProvider._internal(
        (ref) => create(ref as AminkanRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<CommentModel> createElement() {
    return _AminkanProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AminkanProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AminkanRef on AutoDisposeFutureProviderRef<CommentModel> {
  /// The parameter `id` of this provider.
  String get id;
}

class _AminkanProviderElement
    extends AutoDisposeFutureProviderElement<CommentModel> with AminkanRef {
  _AminkanProviderElement(super.provider);

  @override
  String get id => (origin as AminkanProvider).id;
}

String _$aminCommentHash() => r'8c3e5657db0d3e2ed33df103d8ccd9b13dbb6b8d';

/// See also [AminComment].
@ProviderFor(AminComment)
final aminCommentProvider = AutoDisposeNotifierProvider<AminComment,
    AsyncValue<CommentModel>?>.internal(
  AminComment.new,
  name: r'aminCommentProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$aminCommentHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AminComment = AutoDisposeNotifier<AsyncValue<CommentModel>?>;
String _$ayoDonasiHash() => r'b2a34314278f9f7c295f7fb469f516d19134b038';

/// See also [AyoDonasi].
@ProviderFor(AyoDonasi)
final ayoDonasiProvider =
    AutoDisposeNotifierProvider<AyoDonasi, AsyncValue<DonationModel>?>.internal(
  AyoDonasi.new,
  name: r'ayoDonasiProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$ayoDonasiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AyoDonasi = AutoDisposeNotifier<AsyncValue<DonationModel>?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
