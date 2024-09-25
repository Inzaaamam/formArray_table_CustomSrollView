// import 'dart:convert';
// import 'package:comnet/db/validation/dao.dart';
// import 'package:comnet/db/validation/table.dart';
// import 'package:comnet/sdk/models/models.dart';
// import 'package:get/get.dart';

// import '../../../sdk/services/http/validation/validation_api.dart';

// class ValidationController extends GetxController {
//   final ValidationApi api;
//   var isLoading = false.obs;
//   var message = ''.obs;
//   var dataList = <ValidationClass>[];
//   var isOffline = false.obs;
//   ValidationController({required this.api});
//   @override
//   void onInit() {
//     super.onInit();
//     fetchData();
//     update();
//   }

//   Future<void> fetchData() async {
//     isLoading(true);
//     try {
//       final data = await api.fatchedValidationData();
//       var dbList = data
//           .map(
//             (item) => ValidationTable.create(
//               id: item.id!,
//               campaignName: item.campaignName!,
//               date: jsonEncode(item.toJson()),
//               status: item.status,
//             ),
//           )
//           .toList();

//       await ValidationDao.get().addValidationDataList(dbList);

//     } catch (e) {
//       await fetchLocalData();
//     } finally {
//       await fetchLocalData();
//       isLoading(false);
//     }
//   }

//   Future<void> fetchLocalData() async {
//     isLoading(true);
//     try {
//       final validationsTable = await ValidationDao.get().getValidationList();

//       List<ValidationClass> data = validationsTable.map((data) {
//         final jsonData = Map<String, dynamic>.from(jsonDecode(data.date));
//         return ValidationClass.fromJson(jsonData);
//       }).toList();

//       dataList.assignAll(data);
//       isOffline(false);
//     } catch (e) {
//       message.value = e.toString();
//     } finally {
//       isLoading(false);
//     }
//   }
// }

// import 'package:comnet/app/modules/validation/validation_getx.dart';
// import 'package:comnet/sdk/services/http/validation/validation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../styles/colors/custom_colors.dart';
// import '../../../styles/layouts/sizes.dart';
// import '../../../widgets/no_content.dart';

// class ValdationScreen extends StatelessWidget {
//   const ValdationScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     TextTheme textTheme = Theme.of(context).textTheme;
//     return GetBuilder<ValidationController>(
//         init: ValidationController(api: ValidationApi()),
//         builder: (controller) {
//           return Scaffold(
//             backgroundColor: CustomColors.secondaryScaffoldBgColor,
//             appBar: AppBar(
//               title: const Text('Validation'),
//             ),
//             body: Obx(() {
//               if (controller.isLoading.value) {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               } else if (controller.dataList.isEmpty) {
//                 return const Center(
//                     child: NoContent(
//                   title: 'No Record found',
//                 ));
//               } else {
//                 return RefreshIndicator(
//                     onRefresh: () async {
//                       // controller.fetchLocalData();
//                     },
//                     child: ListView.builder(
//                       itemCount: controller.dataList.length,
//                       itemBuilder: (context, index) {
//                         final model = controller.dataList[index];
//                         return Padding(
//                           padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
//                           child: DecoratedBox(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(
//                                 Sizes.s4,
//                               ),
//                               boxShadow: const [
//                                 BoxShadow(
//                                   color: CustomColors.shadowColor,
//                                   blurRadius: 4,
//                                   spreadRadius: 2,
//                                 ),
//                               ],
//                             ),
//                             child: Material(
//                               color: CustomColors.whiteColor,
//                               borderRadius: BorderRadius.circular(
//                                 Sizes.s4,
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(16),
//                                 child: Column(
//                                   crossAxisAlignment:
//                                       CrossAxisAlignment.stretch,
//                                   children: [
//                                     Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         const Text(
//                                           'CAMPAIGN NAME/MONTH:  ',
//                                         ),
//                                         Flexible(
//                                           child: Text(
//                                             model.campaignName ?? "",
//                                             style: textTheme.titleLarge,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         const Text(
//                                           'PROVINCE NAME:  ',
//                                         ),
//                                         Flexible(
//                                           child: Text(
//                                             model.provinceName ?? "",
//                                             style: textTheme.titleLarge,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         const Text(
//                                           'DISTRICT NAME:  ',
//                                         ),
//                                         Flexible(
//                                           child: Text(
//                                             model.districtName ?? "",
//                                             style: textTheme.titleLarge,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     const Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           'TOWN NAME:  ',
//                                         ),
//                                         // Flexible(
//                                         //   child: Text(
//                                         //     model.provinceId ?? "",
//                                         //     style: textTheme.titleLarge,
//                                         //   ),
//                                         // ),
//                                       ],
//                                     ),
//                                     Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         const Text(
//                                           'UC NAME:  ',
//                                         ),
//                                         Flexible(
//                                           child: Text(
//                                             model.ucName ?? "",
//                                             style: textTheme.titleLarge,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     if (model.budgeted != null &&
//                                         model.budgeted!.isNotEmpty)
//                                       Row(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           const Text(
//                                             'BUDGETED:  ',
//                                           ),
//                                           Flexible(
//                                             child: Text(
//                                               model.budgeted == '1'
//                                                   ? 'Yes'
//                                                   : model.budgeted == '0'
//                                                       ? 'No'
//                                                       : '',
//                                               style: textTheme.titleLarge,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         const Text(
//                                           'ACTIVITY TYPE:  ',
//                                         ),
//                                         Flexible(
//                                           child: Text(
//                                             model.actName ?? "",
//                                             style: textTheme.titleLarge,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     if (model.validated != null &&
//                                         model.validated!.isNotEmpty)
//                                       Row(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           const Text(
//                                             'VALIDATED:  ',
//                                           ),
//                                           Flexible(
//                                             child: Text(
//                                               model.validated ?? "2",
//                                               style: textTheme.titleLarge,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ));
//               }
//             }),
//           );
//         });
//   }
// }

// import 'package:comnet/db/validation/table.dart';
// import 'package:sqflite/sqflite.dart';

// import '../db_base.dart';

// class ValidationDao extends DBBase {
//   static final ValidationDao _validationDao = ValidationDao._internal();

//   //private internal constructor to make it singleton
//   ValidationDao._internal()
//       : super(
//           tableName: ValidationTable.tbValidation,
//         );

//   static ValidationDao get() {
//     return _validationDao;
//   }

//   Future<void> addValidationDataList(
//       List<ValidationTable> validationDataList, {
//         ConflictAlgorithm? conflictAlgorithm,
//       }) async {
//     await insertList(
//       validationDataList.map((e) => e.toJson()).toList(),
//       algorithm: conflictAlgorithm ?? ConflictAlgorithm.replace,
//     );
//   }

//   Future<List<ValidationTable>> getValidationList({
//     String? where,
//     List<String>? whereArgs,
//   }) async {
//     List<Map<String, dynamic>> validations = await query(
//       where: where,
//       whereArgs: whereArgs,
//     );
//     if (validations.isNotEmpty) {
//       return validations
//           .map(
//             (map) => ValidationTable.fromMap(map),
//           )
//           .toList();
//     }
//     return [];
//   }

//   Future<int> updateValidation(
//     ValidationTable? validation,
//   ) async {
//     if (validation == null) {
//       return -1;
//     }
//     return update(validation.toJson());
//   }


//   Future<int> deleteValidation() async {
//     return deleteTable();
//   }

//   Future<ValidationTable?> getValidation() async {
//     List<Map<String, dynamic>> validations = await query();
//     if (validations.isNotEmpty) {
//       return validations.map((map) => ValidationTable.fromJson(map)).first;
//     }
//   }
// }
// import '../../sdk/ast.dart';

// class ValidationTable {
//   static const tbValidation = "Validation";
//   static const dbId = "id";
//   static const dbName = "name";
//   static const dbDate = "date";
//   static const dbStatus = "status";

//   String id;
//   String campaignName;
//   String date;
//   String? status;

//   ValidationTable.create({
//     required this.id,
//     required this.campaignName,
//     required this.date,
//     this.status,
//   });

//   ValidationTable.update({
//     required this.id,
//     required this.campaignName,
//     required this.date,
//     this.status,
//   });

//   ValidationTable.fromJson(Map<String, dynamic> map)
//     : id = map[dbId],
//     campaignName = map[dbName],
//     date = map[dbDate],
//     status = map[dbStatus];


//   ValidationTable.fromMap(Map<String, dynamic> map)
//       : id = map[dbId],
//         campaignName = map[dbName],
//         date = map[dbDate],
//         status = map[dbStatus];

//   Map<String, dynamic> toJson() {
//     return {
//       dbId: id,
//       dbName: campaignName,
//       dbDate: date,
//       dbStatus: status,
//     };
//   }
// }
// import 'dart:convert';
import 'package:comnet/db/offline_date/offline.dart';
import '../../../../../app/services/auth_service.dart';
import '../validation/validation_api.dart';

class GetOfflineData {
  static void downloadData() async {
    try {
      await downloadValidationData();
    } catch (_) {}
  }

  static downloadValidationData() async {
    try {
      final ValidationApi validationApi = ValidationApi();
      List<Map<String, dynamic>> listOfMap = [];
      dynamic response = await validationApi.getValidations(
              userId: AuthService.to.user!.userId, mStart: 0);
      if (response != null) {
            for (var element in (response as List)) {
              final data = OfflineTable.create(
                      id: element['main_id'],
                      type: 'validation',
                      isSynced: '0',
                      serverData: jsonEncode(element))
                  .toJson();
              listOfMap.add(data);
            }
            await addDataToDb(listOfMap);
          }
    } catch (e) {
      print(e);
    }
  }

  static addDataToDb(dynamic data) async {
    try {
      await OfflineDao.get().addOfflineData(data);
    } catch (e) {
      print(e);
    }
  }

  static  fetchDataFromDb() async {
    try {
      final  data = await OfflineDao.get().getOfflineList();
      List<Map<String, dynamic>> dblistData = [];
      for (var item in data) {
        if (item.serverData != null) {
          Map<String, dynamic> decodedItem = jsonDecode(item.serverData!);
          dblistData.add(decodedItem);
        }
      }
      return dblistData;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
// UI
import 'package:flutter/material.dart';

import '../../../../sdk/services/http/entities/offline_data_api/offline_data_fetching.dart';
import '../../../../styles/styles.dart';

class OfflineDataScreen extends StatefulWidget {
  const OfflineDataScreen({super.key});

  @override
  _OfflineDataScreenState createState() => _OfflineDataScreenState();
}

class _OfflineDataScreenState extends State<OfflineDataScreen> {
  List<Map<String, dynamic>> offlineData = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final data = await GetOfflineData.fetchDataFromDb();
    setState(() {
      offlineData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Offline Data'),
        ),
        body: offlineData.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: () async {
                  // controller.fetchLocalData();
                },
                child: ListView.builder(
                  itemCount: offlineData.length,
                  itemBuilder: (context, index) {
                    final item = offlineData[index];
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            Sizes.s4,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: CustomColors.shadowColor,
                              blurRadius: 4,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Material(
                          color: CustomColors.whiteColor,
                          borderRadius: BorderRadius.circular(
                            Sizes.s4,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'CAMPAIGN NAME/MONTH:  ',
                                    ),
                                    Flexible(
                                      child: Text(
                                        '${item['campaign_name']}',
                                        style: textTheme.titleLarge,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'PROVINCE NAME:  ',
                                    ),
                                    Flexible(
                                      child: Text(
                                        '${item['province_name']}',
                                        style: textTheme.titleLarge,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'DISTRICT NAME:  ',
                                    ),
                                    Flexible(
                                      child: Text(
                                        '${item['district_name']}',
                                        style: textTheme.titleLarge,
                                      ),
                                    ),
                                  ],
                                ),
                                const Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'TOWN NAME:  ',
                                    ),
                                    // Flexible(
                                    //   child: Text(
                                    //     model.provinceId ?? "",
                                    //     style: textTheme.titleLarge,
                                    //   ),
                                    // ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'UC NAME:  ',
                                    ),
                                    Flexible(
                                      child: Text(
                                        '${item['uc_name']}',
                                        style: textTheme.titleLarge,
                                      ),
                                    ),
                                  ],
                                ),
                                if (item['budgeted'] != null &&
                                    item['budgeted']!.isNotEmpty)
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'BUDGETED:  ',
                                      ),
                                      Flexible(
                                        child: Text(
                                          item['budgeted'] == '1'
                                              ? 'Yes'
                                              : item['budgeted'] == '0'
                                                  ? 'No'
                                                  : '',
                                          style: textTheme.titleLarge,
                                        ),
                                      ),
                                    ],
                                  ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'ACTIVITY TYPE:  ',
                                    ),
                                    Flexible(
                                      child: Text(
                                        '${item['act_name']}',
                                        style: textTheme.titleLarge,
                                      ),
                                    ),
                                  ],
                                ),
                                // if (model.validated != null &&
                                //     model.validated!.isNotEmpty)
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'VALIDATED:  ',
                                    ),
                                    Flexible(
                                      child: Text(
                                        '${item['validated']}',
                                        style: textTheme.titleLarge,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ));
  }
}
// social profile function to store data in local db 
  static  socialProfile() async {
    try {
      final SocialProfileApi socialProfileApi = SocialProfileApi();
      ListingBaseParams params = ListingBaseParams(
        userId: AuthService.to.user?.userId ??
          ''
      );

      List<Map<String, dynamic>> listOfMap = [];
      dynamic response = await socialProfileApi.getSocialActivityListing(
        'Rest_social_profiling/get_sm',
        params: params,
        mStart: 0,
        mLength: 20,
      );

      if (response != null) {
        for (var element in (response as List)) {
          final data = OfflineTable.create(
            id: element['main_id'],
            type: 'validation',
            isSynced: '0',
            serverData: jsonEncode(element),
          ).toJson();
          listOfMap.add(data);
        }

        // Add data to the database
        await addDataToDb(listOfMap);
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}

