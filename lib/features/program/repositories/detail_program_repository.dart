import 'dart:convert';
import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sedekah_rombongan_flutter/core/constants/server_constant.dart';
import 'package:sedekah_rombongan_flutter/core/failure/failure.dart';
import 'package:sedekah_rombongan_flutter/core/models/comment_model.dart';
import 'package:sedekah_rombongan_flutter/core/models/donation_model.dart';
import 'package:sedekah_rombongan_flutter/core/models/program_model.dart';
import 'package:http/http.dart' as http;
import 'package:sedekah_rombongan_flutter/core/utils.dart';
import 'package:sedekah_rombongan_flutter/features/program/models/list_comment.dart';
import 'package:sedekah_rombongan_flutter/features/program/models/list_donation.dart';
part 'detail_program_repository.g.dart';

@riverpod
DetailProgramRepository detailProgramRepository(
    DetailProgramRepositoryRef ref) {
  return DetailProgramRepository();
}

class DetailProgramRepository {
  Future<Either<AppFailure, ProgramModel>> getDetailProgram(String slug) async {
    try {
      String gurl = "${ServerConstant.serverURL}/api/project/$slug";
      final res = await http.get(Uri.parse(gurl));
      log(gurl);
      final resBodyMap = jsonDecode(res.body) as Map<String, dynamic>;
      log("STATUS CODE ${res.statusCode}");
      if (res.statusCode != 200) {
        String ermsg = "";
        Map<String, dynamic> erm = resBodyMap["errors"];
        erm.forEach((k, v) => ermsg += '${k.capitalize()} - ${v.join(", ")}\n');
        return Left(AppFailure(ermsg));
      }
      return Right(ProgramModel.fromMap(resBodyMap["data"]));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<AppFailure, ListComment>> getComments(String param) async {
    try {
      String gurl = "${ServerConstant.serverURL}/api/comments/project/$param";
      final res = await http.get(Uri.parse(gurl));
      log(gurl);
      var resBodyMap = jsonDecode(res.body) as Map<String, dynamic>;
      if (res.statusCode != 200) {
        return Left(AppFailure(resBodyMap['errors'].toString()));
      }
      // log(ListComment.fromMap(resBodyMap).toString());
      return Right(ListComment.fromMap(resBodyMap));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<AppFailure, ListDonation>> getDonations(String param) async {
    try {
      String gurl = "${ServerConstant.serverURL}/api/donations/project/$param";
      final res = await http.get(Uri.parse(gurl));
      log(gurl);
      var resBodyMap = jsonDecode(res.body) as Map<String, dynamic>;
      if (res.statusCode != 200) {
        return Left(AppFailure(resBodyMap['errors'].toString()));
      }
      // log(ListComment.fromMap(resBodyMap).toString());
      return Right(ListDonation.fromMap(resBodyMap));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<AppFailure, CommentModel>> aminkan(String id) async {
    try {
      String murl = "${ServerConstant.serverURL}/api/comments/aminkan/$id";
      final response = await http.post(
        Uri.parse(murl),
      );
      log(murl);
      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;
      if (response.statusCode != 200) {
        return Left(AppFailure("Amin Failed"));
      }
      return Right(CommentModel.fromMap(resBodyMap["data"]));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<AppFailure, DonationModel>> goDonasi(
      int projectId, int jumlah, bool anonim, String token) async {
    try {
      String murl = "${ServerConstant.serverURL}/api/donations";
      final response = await http.post(
        Uri.parse(murl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token,
        },
        body: jsonEncode(
          {
            'project_id': projectId,
            'jumlah': jumlah,
            'anonim': anonim,
          },
        ),
      );
      log(murl);
      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;
      if (response.statusCode != 201) {
        return Left(AppFailure("Donation Failed"));
      }
      return Right(DonationModel.fromMap(resBodyMap["data"]));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<AppFailure, CommentModel>> goKomen(
      int projectId, String isiKomentar, bool anonim, String token) async {
    try {
      String murl = "${ServerConstant.serverURL}/api/comments";
      final response = await http.post(
        Uri.parse(murl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token,
        },
        body: jsonEncode(
          {
            'project_id': projectId,
            'isi_komentar': isiKomentar,
            'anonim': anonim,
          },
        ),
      );
      log(murl);
      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;
      if (response.statusCode != 201) {
        return Left(AppFailure("Donation Failed"));
      }
      return Right(CommentModel.fromMap(resBodyMap["data"]));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<AppFailure, CommentModel>> goKomenOnly(
      String slug, String isiKomentar, bool anonim, String token) async {
    try {
      String murl = "${ServerConstant.serverURL}/api/comments";
      final response = await http.post(
        Uri.parse(murl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token,
        },
        body: jsonEncode(
          {
            'slug': slug,
            'isi_komentar': isiKomentar,
            'anonim': anonim,
          },
        ),
      );
      log(murl);
      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;
      if (response.statusCode != 201) {
        return Left(AppFailure("Donation Failed"));
      }
      return Right(CommentModel.fromMap(resBodyMap["data"]));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
