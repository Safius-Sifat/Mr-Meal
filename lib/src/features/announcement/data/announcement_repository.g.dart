// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$announcementRepositoryHash() =>
    r'0b0a16973d70b4271d054c3996ca9983523baacd';

/// See also [announcementRepository].
@ProviderFor(announcementRepository)
final announcementRepositoryProvider =
    AutoDisposeProvider<AnnouncementRepository>.internal(
  announcementRepository,
  name: r'announcementRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$announcementRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AnnouncementRepositoryRef
    = AutoDisposeProviderRef<AnnouncementRepository>;
String _$fetchAnnouncementHash() => r'1eaf4144d9c9d07da1bfb2de31f3e453e8857667';

/// See also [fetchAnnouncement].
@ProviderFor(fetchAnnouncement)
final fetchAnnouncementProvider =
    AutoDisposeFutureProvider<List<Announcement>>.internal(
  fetchAnnouncement,
  name: r'fetchAnnouncementProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchAnnouncementHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchAnnouncementRef = AutoDisposeFutureProviderRef<List<Announcement>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
