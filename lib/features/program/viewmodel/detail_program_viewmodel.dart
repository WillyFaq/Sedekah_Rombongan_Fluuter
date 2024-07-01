import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sedekah_rombongan_flutter/core/models/comment_model.dart';
import 'package:sedekah_rombongan_flutter/core/models/donation_model.dart';
import 'package:sedekah_rombongan_flutter/core/models/program_model.dart';
import 'package:sedekah_rombongan_flutter/features/program/models/list_comment.dart';
import 'package:sedekah_rombongan_flutter/features/program/models/list_donation.dart';
import 'package:sedekah_rombongan_flutter/features/program/repositories/detail_program_repository.dart';

part 'detail_program_viewmodel.g.dart';

@riverpod
Future<ProgramModel> getDetailProgram(
    GetDetailProgramRef ref, String slug) async {
  final res =
      await ref.watch(detailProgramRepositoryProvider).getDetailProgram(slug);
  return switch (res) {
    Left(value: final l) => throw l.message,
    Right(value: final r) => r,
  };
}

@riverpod
Future<ListComment> getComments(
    GetCommentsRef ref, String slug, int page) async {
  String murl = "$slug?page=${page.toString()}";
  final res =
      await ref.watch(detailProgramRepositoryProvider).getComments(murl);
  return switch (res) {
    Left(value: final l) => throw l.message,
    Right(value: final r) => r,
  };
}

@riverpod
Future<ListDonation> getDonations(
    GetDonationsRef ref, String slug, int page) async {
  String murl = "$slug?page=${page.toString()}";
  final res =
      await ref.watch(detailProgramRepositoryProvider).getDonations(murl);
  return switch (res) {
    Left(value: final l) => throw l.message,
    Right(value: final r) => r,
  };
}

@riverpod
Future<CommentModel> aminkan(AminkanRef ref, String id) async {
  final res = await ref.watch(detailProgramRepositoryProvider).aminkan(id);
  return switch (res) {
    Left(value: final l) => throw l.message,
    Right(value: final r) => r,
  };
}

class DetailProgramViewModel {}

@riverpod
class AminComment extends _$AminComment {
  late DetailProgramRepository _detailProgramRepository;

  @override
  AsyncValue<CommentModel>? build() {
    _detailProgramRepository = ref.watch(detailProgramRepositoryProvider);
    return null;
  }

  Future<void> aminn({required String id}) async {
    state = const AsyncValue.loading();
    final res = await _detailProgramRepository.aminkan(id);
    final val = switch (res) {
      Left(value: final l) => state = AsyncValue.error(
          l.message,
          StackTrace.current,
        ),
      Right(value: final r) => state = AsyncValue.data(r),
    };
    log(val.toString());
  }

  Future<void> goComment({
    required String slug,
    required String doa,
    required bool anonim,
    required String token,
  }) async {
    state = const AsyncValue.loading();
    final res =
        await _detailProgramRepository.goKomenOnly(slug, doa, anonim, token);
    final val = switch (res) {
      Left(value: final l) => state = AsyncValue.error(
          l.message,
          StackTrace.current,
        ),
      Right(value: final r) => state = AsyncValue.data(r),
    };
    log(val.toString());
  }
}

@riverpod
class AyoDonasi extends _$AyoDonasi {
  late DetailProgramRepository _detailProgramRepository;

  @override
  AsyncValue<DonationModel>? build() {
    _detailProgramRepository = ref.watch(detailProgramRepositoryProvider);
    return null;
  }

  Future<void> goDonasi({
    required int projectId,
    required int jumlah,
    required bool anonim,
    required String token,
    required String doa,
  }) async {
    state = const AsyncValue.loading();
    final res = await _detailProgramRepository.goDonasi(
        projectId, jumlah, anonim, token);
    final val = switch (res) {
      Left(value: final l) => state = AsyncValue.error(
          l.message,
          StackTrace.current,
        ),
      Right(value: final r) => state = AsyncValue.data(r),
    };
    log(val.toString());
    if (doa != "") {
      // final ares =
      await _detailProgramRepository.goKomen(projectId, doa, anonim, token);
      // final aval = switch (ares) {
      //   Left(value: final l) => state = AsyncValue.error(
      //       l.message,
      //       StackTrace.current,
      //     ),
      //   Right(value: final r) => state = AsyncValue.data(val),
      // };
      // log(aval.toString());
    }
  }
}
