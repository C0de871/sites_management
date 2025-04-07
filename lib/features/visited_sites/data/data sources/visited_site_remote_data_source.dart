// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sites_management/core/databases/storage/external_storage_manager.dart';
import 'package:sites_management/core/shared/enums/visited_site_additional_images_type.dart';
import 'package:sites_management/core/shared/models/message_model.dart';
import 'package:sites_management/core/utils/constants/constant.dart';
import 'package:sites_management/features/visited_sites/data/model/get_visited_sites/get_visited_sites_model.dart';

import '../../../../core/databases/api/api_consumer.dart';
import '../../../../core/databases/api/end_points.dart';
import '../model/add_visited_site/add_visited_site_model.dart';
import '../model/get_visited_site_images/get_visited_site_images_model.dart';
import '../model/show_site_details/show_site_details_model.dart';

class VisitedSiteRemoteDataSource {
  final ApiConsumer api;
  final ExternalStorageManager externalStorageManager;
  VisitedSiteRemoteDataSource({
    required this.api,
    required this.externalStorageManager,
  });
  Future<AddVisitedSiteModel> addVisitedSite({required Map<String, dynamic> body}) async {
    final response = await api.post(
      EndPoints.postVisitedSite,
      data: body,
      isFormData: true,
    );
    return AddVisitedSiteModel.fromMap(response);
  }

  Future<List<GetVisitedSitesModel>> getVisitedSites() async {
    final List response = await api.get(
      EndPoints.getVisitedSites,
    );
    return response.map((site) => GetVisitedSitesModel.fromMap(site)).toList();
  }

  Future<ShowSiteDetailsModel> showSiteDetails({required String id}) async {
    final response = await api.get(
      "${EndPoints.showSiteDetails}/$id",
    );
    return ShowSiteDetailsModel.fromJson(response);
  }

  Future<MessageModel> deleteSites({required Map<String, dynamic> body}) async {
    final response = await api.delete(
      EndPoints.deleteSites,
      data: body,
    );
    return MessageModel.fromJson(response);
  }

  Future<MessageModel> editSite({required Map<String, dynamic> body, required String id}) async {
    final response = await api.put(
      "${EndPoints.editSite}/$id",
      data: body,
    );
    return MessageModel.fromJson(response);
  }

  Future<GetVisitedSiteImagesModel> getAdditionalSiteImages({required String id, required VisitedSiteAdditionalImagesType type}) async {
    final response = await api.get(
      "${EndPoints.getAdditionalSiteImages}/$id/${type.name}",
    );
    return GetVisitedSiteImagesModel.fromJson(response);
  }

  Future<GetVisitedSiteImagesModel> getSectionImages({required String id, required VisitedSiteAdditionalImagesType type}) async {
    final response = await api.get(
      "${EndPoints.getSectionImages}/$id/${type.name}",
    );
    return GetVisitedSiteImagesModel.fromJson(response);
  }

  Future<MessageModel> exportSites({required Map<String, dynamic> body, required String fileName}) async {
    final response = await api.post(
      EndPoints.exportSites,
      data: body,
      responseType: ResponseType.bytes,
    );
    final baseDirPath = externalStorageManager.baseDirPath;
    log("base dir path: $baseDirPath");
    final file = await externalStorageManager.createFile("$baseDirPath/$fileName.xls");
    log("file is created");
    await externalStorageManager.writeBytesOnFile(file, response as List<int>);
    log("bytes written on the file");
    return MessageModel.fromJson(Constant.massageMap("seleceted visited sites exported successfully"));
  }
}
