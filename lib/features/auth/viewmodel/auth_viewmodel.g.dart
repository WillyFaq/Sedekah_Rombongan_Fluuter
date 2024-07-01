// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getCurUserHash() => r'ab63387c1b76f31b33df963ed400e24d52e68929';

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

/// See also [getCurUser].
@ProviderFor(getCurUser)
const getCurUserProvider = GetCurUserFamily();

/// See also [getCurUser].
class GetCurUserFamily extends Family<AsyncValue<UserModel>> {
  /// See also [getCurUser].
  const GetCurUserFamily();

  /// See also [getCurUser].
  GetCurUserProvider call(
    String token,
  ) {
    return GetCurUserProvider(
      token,
    );
  }

  @override
  GetCurUserProvider getProviderOverride(
    covariant GetCurUserProvider provider,
  ) {
    return call(
      provider.token,
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
  String? get name => r'getCurUserProvider';
}

/// See also [getCurUser].
class GetCurUserProvider extends AutoDisposeFutureProvider<UserModel> {
  /// See also [getCurUser].
  GetCurUserProvider(
    String token,
  ) : this._internal(
          (ref) => getCurUser(
            ref as GetCurUserRef,
            token,
          ),
          from: getCurUserProvider,
          name: r'getCurUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCurUserHash,
          dependencies: GetCurUserFamily._dependencies,
          allTransitiveDependencies:
              GetCurUserFamily._allTransitiveDependencies,
          token: token,
        );

  GetCurUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.token,
  }) : super.internal();

  final String token;

  @override
  Override overrideWith(
    FutureOr<UserModel> Function(GetCurUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCurUserProvider._internal(
        (ref) => create(ref as GetCurUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        token: token,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<UserModel> createElement() {
    return _GetCurUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCurUserProvider && other.token == token;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, token.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetCurUserRef on AutoDisposeFutureProviderRef<UserModel> {
  /// The parameter `token` of this provider.
  String get token;
}

class _GetCurUserProviderElement
    extends AutoDisposeFutureProviderElement<UserModel> with GetCurUserRef {
  _GetCurUserProviderElement(super.provider);

  @override
  String get token => (origin as GetCurUserProvider).token;
}

String _$getUserDonationsHash() => r'3c0441969bd7a51ff04ff90c3e36d8af58039a4c';

/// See also [getUserDonations].
@ProviderFor(getUserDonations)
const getUserDonationsProvider = GetUserDonationsFamily();

/// See also [getUserDonations].
class GetUserDonationsFamily extends Family<AsyncValue<ListUserDonasi>> {
  /// See also [getUserDonations].
  const GetUserDonationsFamily();

  /// See also [getUserDonations].
  GetUserDonationsProvider call(
    int page,
  ) {
    return GetUserDonationsProvider(
      page,
    );
  }

  @override
  GetUserDonationsProvider getProviderOverride(
    covariant GetUserDonationsProvider provider,
  ) {
    return call(
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
  String? get name => r'getUserDonationsProvider';
}

/// See also [getUserDonations].
class GetUserDonationsProvider
    extends AutoDisposeFutureProvider<ListUserDonasi> {
  /// See also [getUserDonations].
  GetUserDonationsProvider(
    int page,
  ) : this._internal(
          (ref) => getUserDonations(
            ref as GetUserDonationsRef,
            page,
          ),
          from: getUserDonationsProvider,
          name: r'getUserDonationsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getUserDonationsHash,
          dependencies: GetUserDonationsFamily._dependencies,
          allTransitiveDependencies:
              GetUserDonationsFamily._allTransitiveDependencies,
          page: page,
        );

  GetUserDonationsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
  }) : super.internal();

  final int page;

  @override
  Override overrideWith(
    FutureOr<ListUserDonasi> Function(GetUserDonationsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetUserDonationsProvider._internal(
        (ref) => create(ref as GetUserDonationsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ListUserDonasi> createElement() {
    return _GetUserDonationsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUserDonationsProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetUserDonationsRef on AutoDisposeFutureProviderRef<ListUserDonasi> {
  /// The parameter `page` of this provider.
  int get page;
}

class _GetUserDonationsProviderElement
    extends AutoDisposeFutureProviderElement<ListUserDonasi>
    with GetUserDonationsRef {
  _GetUserDonationsProviderElement(super.provider);

  @override
  int get page => (origin as GetUserDonationsProvider).page;
}

String _$authViewmodelHash() => r'23b8099a16d1392da8e1ca3f2cba338eb3aab043';

/// See also [AuthViewmodel].
@ProviderFor(AuthViewmodel)
final authViewmodelProvider =
    AutoDisposeNotifierProvider<AuthViewmodel, AsyncValue<UserModel>?>.internal(
  AuthViewmodel.new,
  name: r'authViewmodelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authViewmodelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthViewmodel = AutoDisposeNotifier<AsyncValue<UserModel>?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
