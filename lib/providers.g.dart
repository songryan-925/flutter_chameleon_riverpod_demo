// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$countGeneratorHash() => r'809163eae928fee0969e439771f185f14dbfbb76';

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

abstract class _$CountGenerator
    extends BuildlessAutoDisposeStreamNotifier<String> {
  late final int initialValue;

  Stream<String> build({
    int initialValue = 0,
  });
}

/// See also [CountGenerator].
@ProviderFor(CountGenerator)
const countGeneratorProvider = CountGeneratorFamily();

/// See also [CountGenerator].
class CountGeneratorFamily extends Family<AsyncValue<String>> {
  /// See also [CountGenerator].
  const CountGeneratorFamily();

  /// See also [CountGenerator].
  CountGeneratorProvider call({
    int initialValue = 0,
  }) {
    return CountGeneratorProvider(
      initialValue: initialValue,
    );
  }

  @override
  CountGeneratorProvider getProviderOverride(
    covariant CountGeneratorProvider provider,
  ) {
    return call(
      initialValue: provider.initialValue,
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
  String? get name => r'countGeneratorProvider';
}

/// See also [CountGenerator].
class CountGeneratorProvider
    extends AutoDisposeStreamNotifierProviderImpl<CountGenerator, String> {
  /// See also [CountGenerator].
  CountGeneratorProvider({
    this.initialValue = 0,
  }) : super.internal(
          () => CountGenerator()..initialValue = initialValue,
          from: countGeneratorProvider,
          name: r'countGeneratorProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$countGeneratorHash,
          dependencies: CountGeneratorFamily._dependencies,
          allTransitiveDependencies:
              CountGeneratorFamily._allTransitiveDependencies,
        );

  final int initialValue;

  @override
  bool operator ==(Object other) {
    return other is CountGeneratorProvider &&
        other.initialValue == initialValue;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, initialValue.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Stream<String> runNotifierBuild(
    covariant CountGenerator notifier,
  ) {
    return notifier.build(
      initialValue: initialValue,
    );
  }
}

String _$appThemeHash() => r'b5e1591e8c382f04f79b51b2955bb2fc3f3d73fa';

/// See also [AppTheme].
@ProviderFor(AppTheme)
final appThemeProvider =
    AutoDisposeNotifierProvider<AppTheme, ThemeModel>.internal(
  AppTheme.new,
  name: r'appThemeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appThemeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AppTheme = AutoDisposeNotifier<ThemeModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
