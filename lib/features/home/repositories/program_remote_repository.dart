import 'dart:convert';
import 'dart:developer';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sedekah_rombongan_flutter/core/constants/server_constant.dart';
import 'package:sedekah_rombongan_flutter/core/failure/failure.dart';
import 'package:sedekah_rombongan_flutter/features/home/models/carousel_model.dart';
import 'package:sedekah_rombongan_flutter/features/home/models/pagination_program_model.dart';
import 'package:http/http.dart' as http;
part 'program_remote_repository.g.dart';

@riverpod
ProgramRemoteRepository programRemoteRepository(
    ProgramRemoteRepositoryRef ref) {
  return ProgramRemoteRepository();
}

class ProgramRemoteRepository {
  Future<Either<AppFailure, List<CarouselModel>>> getCarousel() async {
    try {
      final res = await http
          .get(Uri.parse('${ServerConstant.serverURL}/api/project/carousel'));
      log('${ServerConstant.serverURL}/api/project/carousel');
      var resBodyMap = jsonDecode(res.body);
      if (res.statusCode != 200) {
        return Left(AppFailure(resBodyMap['errors'].toString()));
      }
      resBodyMap = resBodyMap["data"] as List;
      List<CarouselModel> data = [];
      for (final map in resBodyMap) {
        data.add(CarouselModel.fromMap(map));
      }
      return Right(data);
      // return Right(PaginationProgramModel.fromMap(resBodyMap));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<AppFailure, List<Map<String, dynamic>>>> getCategories() async {
    try {
      final res =
          await http.get(Uri.parse('${ServerConstant.serverURL}/api/category'));
      log('${ServerConstant.serverURL}/api/category');
      var resBodyMap = jsonDecode(res.body);
      if (res.statusCode != 200) {
        return Left(AppFailure(resBodyMap['errors'].toString()));
      }
      List<Map<String, dynamic>> data = [];
      for (final map in resBodyMap["data"]) {
        Map<String, dynamic> tmp = map;
        data.add(tmp);
      }
      // return Right(resBodyMap["data"] as List<Map<String, dynamic>>);
      return Right(data);
      // return Right(PaginationProgramModel.fromMap(resBodyMap));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<AppFailure, PaginationProgramModel>> getAllPrograms(
      {required url}) async {
    try {
      final res =
          await http.get(Uri.parse('${ServerConstant.serverURL}/api/$url'));
      // print();
      log('${ServerConstant.serverURL}/api/$url');
      var resBodyMap = jsonDecode(res.body) as Map<String, dynamic>;
      if (res.statusCode != 200) {
        // resBodyMap = resBodyMap as Map<String, dynamic>;
        return Left(AppFailure(resBodyMap['errors'].toString()));
      }
      // resBodyMap = resBodyMap["data"] as List;
      // List<ProgramModel> data = [];
      // for (final map in resBodyMap) {
      //   data.add(ProgramModel.fromMap(map));
      // }
      // return Right(data);
      return Right(PaginationProgramModel.fromMap(resBodyMap));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
