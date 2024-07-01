import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sedekah_rombongan_flutter/features/home/models/carousel_model.dart';
import 'package:sedekah_rombongan_flutter/features/home/models/pagination_program_model.dart';
import 'package:sedekah_rombongan_flutter/features/home/repositories/program_remote_repository.dart';
part 'home_viewmodel.g.dart';

@riverpod
Future<List<CarouselModel>> getCarousel(GetCarouselRef ref) async {
  final res = await ref.watch(programRemoteRepositoryProvider).getCarousel();
  return switch (res) {
    Left(value: final l) => throw l.message,
    Right(value: final r) => r,
  };
}

@riverpod
Future<List<Map<String, dynamic>>> getCategories(GetCategoriesRef ref) async {
  final res = await ref.watch(programRemoteRepositoryProvider).getCategories();
  return switch (res) {
    Left(value: final l) => throw l.message,
    Right(value: final r) => r,
  };
}

@riverpod
Future<PaginationProgramModel> getAllPrograms(
    GetAllProgramsRef ref, int cat, int page, String qry) async {
  String murl = "project?page=${page.toString()}";
  if (cat != 0) {
    murl = "category/${cat.toString()}?page=${page.toString()}";
  }
  if (qry != "") {
    murl = "$murl&search=$qry";
  }
  final res = await ref
      .watch(programRemoteRepositoryProvider)
      .getAllPrograms(url: murl);
  // .getAllPrograms(url: "category/1?page=${page.toString()}");
  return switch (res) {
    Left(value: final l) => throw l.message,
    Right(value: final r) => r,
  };
}

final mainPageIndex = StateProvider<int>((ref) {
  return 0;
});

final categoryForProgram = StateProvider<int>((ref) {
  return 0;
});

final cariQuery = StateProvider<String>((ref) {
  return "";
});

@riverpod
class HomeViewModel extends _$HomeViewModel {
  late ProgramRemoteRepository _programRemoteRepository;

  @override
  AsyncValue? build() {
    _programRemoteRepository = ref.watch(programRemoteRepositoryProvider);
    return null;
  }

  Future<PaginationProgramModel> getAllPrograms() async {
    final res = await _programRemoteRepository.getAllPrograms(url: "project");
    return switch (res) {
      Left(value: final l) => throw l.message,
      Right(value: final r) => r,
    };
  }
}
