import 'dart:convert';
import 'dart:developer';
import 'package:sedekah_rombongan_flutter/core/constants/server_constant.dart';
import 'package:sedekah_rombongan_flutter/core/failure/failure.dart';
import 'package:sedekah_rombongan_flutter/core/models/user_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sedekah_rombongan_flutter/core/utils.dart';

part 'auth_remote_repository.g.dart';

@riverpod
AuthRemoteRepository authRemoteRepository(AuthRemoteRepositoryRef ref) {
  return AuthRemoteRepository();
}

class AuthRemoteRepository {
  Future<Either<AppFailure, UserModel>> signup({
    required String name,
    required String email,
    required String password,
    required String nomorTelepon,
    required String alamat,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(
          '${ServerConstant.serverURL}/api/user',
        ),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          {
            'nama': name,
            'email': email,
            'password': password,
            'nomor_telepon': nomorTelepon,
            "alamat": alamat
          },
        ),
      );

      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode != 201) {
        String ermsg = "";
        Map<String, dynamic> erm = resBodyMap["errors"];
        erm.forEach((k, v) => ermsg += '${k.capitalize()} - ${v.join(", ")}\n');
        return Left(AppFailure(ermsg));
      }

      return Right(UserModel.fromMap(resBodyMap["data"]));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<AppFailure, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(
          '${ServerConstant.serverURL}/api/user/login',
        ),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          {
            'email': email,
            'password': password,
          },
        ),
      );
      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode != 200) {
        String ermsg = "";
        Map<String, dynamic> erm = resBodyMap["errors"];
        erm.forEach((k, v) => ermsg += '${k.capitalize()} - ${v.join(", ")}\n');
        return Left(AppFailure(ermsg));
        // return Left(AppFailure(resBodyMap['errors']));
      }

      return Right(
        // UserModel.fromMap(resBodyMap['user']).copyWith(
        //   token: resBodyMap['remember_token'],
        // ),
        UserModel.fromMap(resBodyMap['data']),
      );
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<AppFailure, UserModel>> getCurrentUserData(String token) async {
    log("getCurrentUserData Call ->");
    try {
      String murl = '${ServerConstant.serverURL}/api/user';
      final response = await http.get(
        Uri.parse(
          murl,
        ),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token,
        },
      );
      log(murl);
      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;
      log(response.body);
      if (response.statusCode != 200) {
        return Left(AppFailure(resBodyMap['errors']["message"].toString()));
      }
      UserModel data = UserModel.fromMap(resBodyMap["data"]);
      return Right(
        data,
      );
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
