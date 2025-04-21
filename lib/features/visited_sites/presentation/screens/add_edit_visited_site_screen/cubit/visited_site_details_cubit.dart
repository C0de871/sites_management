import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sites_management/core/databases/errors/failure.dart';
import 'package:sites_management/core/shared/enums/form_type.dart';
import 'package:sites_management/features/visited_sites/domain/entities/show_site_details/generator_information_entity.dart';
import 'package:sites_management/features/visited_sites/domain/use_cases/edit_visited_site_use_case.dart';
import 'package:sites_management/features/visited_sites/domain/use_cases/get_additional_visited_site_images_use_case.dart';
import 'package:sites_management/features/visited_sites/domain/use_cases/show_visited_site_details_use_case.dart';
import '../../../../../../core/shared/entity/message_entity.dart';
import '../../../../../../core/shared/enums/visited_site_additional_images_type.dart';
import '../../../../../../core/utils/commands/command.dart';
import '../../../../../../core/utils/constants/constant.dart';

import '../../../../../../core/databases/api/end_points.dart';
import '../../../../../../core/utils/services/service_locator.dart';
import '../../../../domain/entities/get_visited_site_images/get_visited_site_images_entity.dart';
import '../../../../domain/entities/show_site_details/show_site_details_entity.dart';
import '../../../../domain/use_cases/add_visited_site_use_case.dart';
import '../../../../domain/use_cases/get_section_visited_site_images_use_case.dart';

part 'visited_site_details_state.dart';
// 'original',
// 'additional',
// 'transmission',
// 'fuel_cage'

// 'tower_images'
// 'solar_and_wind_batteries_images'
// 'rectifier_images' => Rectifier_information::class,
// 'rectifier_batteries_images'
// 'generator_images'
// 'rbs_images'

class VisitedSiteDetailsCubit extends Cubit<VisitedSiteDetailsState> {
  final String? visitedSiteId;

  AddVisitedSiteUseCase postVisitedSiteUseCase;
  ShowVisitedSiteDetailsUseCase showVisitedSiteDetailsUseCase;
  EditVisitedSiteUseCase editVisitedSiteUseCase;
  GetAdditionalVisitedSiteImagesUseCase getAdditionalVisitedSiteImagesUseCase;
  GetSectionVisitedSiteImagesUseCase getSectionVisitedSiteImagesUseCase;

  late final Command3<MessageEntity, String, String?, String?> editCommand;
  late final Command0<MessageEntity> postCommand;
  late final Command1<ShowSiteDetailsEntity, String> showDetailsCommand;

  late final Command2<GetVisitedSiteImagesEntity, String, VisitedSiteAdditionalImagesType> getOriginalImagesCommand;
  late final Command2<GetVisitedSiteImagesEntity, String, VisitedSiteAdditionalImagesType> getAdditionalImagesCommand;
  late final Command2<GetVisitedSiteImagesEntity, String, VisitedSiteAdditionalImagesType> getTransmissionImagesCommand;
  late final Command2<GetVisitedSiteImagesEntity, String, VisitedSiteAdditionalImagesType> getFuelCageImagesCommand;

  late final Command2<GetVisitedSiteImagesEntity, String, VisitedSiteSectionImagesType> getTowerImagesCommand;
  late final Command2<GetVisitedSiteImagesEntity, String, VisitedSiteSectionImagesType> getSolarAndWindSystemImagesCommand;
  late final Command2<GetVisitedSiteImagesEntity, String, VisitedSiteSectionImagesType> getRectifierImagesCommand;
  late final Command2<GetVisitedSiteImagesEntity, String, VisitedSiteSectionImagesType> getRectifierBatteriesImagesCommand;
  late final Command2<GetVisitedSiteImagesEntity, String, VisitedSiteSectionImagesType> getGeneratorImagesCommand;
  late final Command2<GetVisitedSiteImagesEntity, String, VisitedSiteSectionImagesType> getRbsImagesCommand;

  VisitedSiteDetailsCubit({this.visitedSiteId})
      : postVisitedSiteUseCase = getIt(),
        getAdditionalVisitedSiteImagesUseCase = getIt(),
        getSectionVisitedSiteImagesUseCase = getIt(),
        editVisitedSiteUseCase = getIt(),
        showVisitedSiteDetailsUseCase = getIt(),
        super(VisitedSiteDetailsInitial()) {
    initCommands();
    initformValues();
  }

  void initCommands() {
    editCommand = Command3<MessageEntity, String, String?, String?>((a, b, c) => editTrigger(siteId: a, generator1Id: b, generator2Id: c));
    postCommand = Command0<MessageEntity>(postVisitedSiteTrigger);
    showDetailsCommand = Command1<ShowSiteDetailsEntity, String>((a) => showDetailsTrigger(siteId: a));
    getOriginalImagesCommand = Command2<GetVisitedSiteImagesEntity, String, VisitedSiteAdditionalImagesType>((a, b) => getGeneralImagesTrigger(id: a, type: b));
    getAdditionalImagesCommand = Command2<GetVisitedSiteImagesEntity, String, VisitedSiteAdditionalImagesType>((a, b) => getGeneralImagesTrigger(id: a, type: b));
    getTransmissionImagesCommand = Command2<GetVisitedSiteImagesEntity, String, VisitedSiteAdditionalImagesType>((a, b) => getGeneralImagesTrigger(id: a, type: b));
    getFuelCageImagesCommand = Command2<GetVisitedSiteImagesEntity, String, VisitedSiteAdditionalImagesType>((a, b) => getGeneralImagesTrigger(id: a, type: b));
    getTowerImagesCommand = Command2((a, b) => getSectionImagesTrigger(id: a, type: b));
    getSolarAndWindSystemImagesCommand = Command2((a, b) => getSectionImagesTrigger(id: a, type: b));
    getRectifierImagesCommand = Command2((a, b) => getSectionImagesTrigger(id: a, type: b));
    getRectifierBatteriesImagesCommand = Command2((a, b) => getSectionImagesTrigger(id: a, type: b));
  }

  Future<void> initformValues() async {
    if (visitedSiteId != null) {
      await showDetailsCommand.execute(visitedSiteId!);
    }
    if (showDetailsCommand.state case CommandSuccess<ShowSiteDetailsEntity>(data: ShowSiteDetailsEntity siteDetails)) {
      final site = siteDetails.site;
      final towerInfo = siteDetails.towerInformations;
      final bandInfo = siteDetails.bandInformations;
      final generatorInfo = siteDetails.generatorInformations;
      final solarWindInfo = siteDetails.solarWindInformations;
      final rectifierInfo = siteDetails.rectifierInformations;
      final environmentInfo = siteDetails.environmentInformations;
      final lvdpInfo = siteDetails.lvdpInformations;
      final fiberInfo = siteDetails.fiberInformations;
      final amperesInfo = siteDetails.amperesInformations;
      final tcuInfo = siteDetails.tcuInformations;

      //! validate all forms:
      isGeneralInfoValid = true;
      isTypeAndConfigValid = true;
      isAdditionalInfoValid = true;
      isAmpereInfoValid = true;
      isTcuInfoValid = true;
      isFiberInfoValid = true;
      isGsm900InfoValid = true;
      isGsm1800InfoValid = true;
      is3GInfoValid = true;
      isLTEInfoValid = true;
      isRectifierInfoValid = true;
      isEnvironmentInfoValid = true;
      isTowerMastMonopoleInfoValid = true;
      isSolarAndWindSystemInfoValid = true;
      isGeneratorInfoValid = true;
      isLvdpInfoValid = true;
      isAdditionalPhotoInfoValid = true;

      //!init site info:
      selectedCode = site?.code;
      selectedName = site?.name;
      governorateController.text = site?.governorate ?? "";
      log("site street is ${site?.street}");
      streetController.text = site?.street ?? "";
      areaController.text = site?.area ?? "";
      cityController.text = site?.city ?? "";
      selectedSiteType = site?.type;
      numberOfCabinetsController.text = site?.cabinetNumber?.toString() ?? "";
      electricityMeterController.text = site?.electricityMeter ?? "";
      electricityMeterReadingController.text = site?.electricityMeterReading ?? "";
      generatorRemarksController.text = site?.generatorRemark ?? "";

      //! Configurations
      configurations['GSM 1900'] = site?.gsm1900 == 1;
      configurations['GSM 1800'] = site?.gsm1800 == 1;
      configurations['3G'] = site?.the3G == 1;
      configurations['LTE'] = site?.lte == 1;
      configurations['Generator'] = site?.generator == 1;
      configurations['Solar'] = site?.solar == 1;
      configurations['Wind'] = site?.wind == 1;
      configurations['Grid'] = site?.grid == 1;
      configurations['Fence'] = site?.fence == 1;

      //! Tower/Mast/Monopole Info
      structureOptions['Mast'] = towerInfo?.mast == 1;
      structureOptions['Tower'] = towerInfo?.tower == 1;
      structureOptions['Monopole'] = towerInfo?.monopole == 1;

      mastNumberController.text = towerInfo?.mastNumber?.toString() ?? "";
      mastStatusController.text = towerInfo?.mastStatus ?? "";
      towerNumberController.text = towerInfo?.towerNumber?.toString() ?? "";
      towerStatusController.text = towerInfo?.towerStatus ?? "";
      beaconStatusController.text = towerInfo?.beaconStatus ?? "";
      monopoleNumberController.text = towerInfo?.monopoleNumber?.toString() ?? "";
      monopoleStatusController.text = towerInfo?.monopoleStatus ?? "";
      mast1HeightController.text = towerInfo?.mast1Height?.toString() ?? "";
      mast2HeightController.text = towerInfo?.mast2Height?.toString() ?? "";
      mast3HeightController.text = towerInfo?.mast3Height?.toString() ?? "";
      tower1HeightController.text = towerInfo?.tower1Height?.toString() ?? "";
      tower2HeightController.text = towerInfo?.tower2Height?.toString() ?? "";
      monopoleHeightController.text = towerInfo?.monopoleHeight?.toString() ?? "";
      remarksController.text = towerInfo?.remarks ?? "";

      //! Generator Info
      if (generatorInfo?.isNotEmpty ?? false) {
        GeneratorInformationEntity? gen1, gen2;
        if (generatorInfo != null) {
          gen1 = generatorInfo.isNotEmpty ? (generatorInfo[0]) : null;
          gen2 = generatorInfo.length > 1 ? generatorInfo[1] : null;
        }

        if (gen1 != null) {
          gen1TypeAndCapacityController.text = gen1.genTypeAndCapacity ?? "";
          gen1HourMeterController.text = gen1.genHourMeter?.toString() ?? "";
          gen1FuelConsumptionController.text = gen1.genFuelConsumption?.toString() ?? "";
          internalFuelCapacity1Controller.text = gen1.internalCapacity?.toString() ?? "";
          internalExistingFuel1Controller.text = gen1.internalExistingFuel?.toString() ?? "";
          internalFuelTankCage1 = gen1.internalCage == 1;
          externalFuelCapacity1Controller.text = gen1.externalCapacity?.toString() ?? "";
          externalExistingFuel1Controller.text = gen1.externalExistingFuel?.toString() ?? "";
          externalFuelTankCage1 = gen1.externalCage == 1;
          fuelSensor1Existing = gen1.fuelSensorExiting == 1;
          fuelSensor1Working = gen1.fuelSensorWorking == 1;
          gen1FuelSensorTypeController.text = gen1.fuelSensorType ?? "";
          gen1AmpereToOwnerController.text = gen1.ampereToOwner?.toString() ?? "";
          gen1CircuitBreakersController.text = gen1.circuitBreakersQuantity?.toString() ?? "";
        }

        if (gen2 != null) {
          gen2TypeAndCapacityController.text = gen2.genTypeAndCapacity ?? "";
          gen2HourMeterController.text = gen2.genHourMeter?.toString() ?? "";
          gen2FuelConsumptionController.text = gen2.genFuelConsumption?.toString() ?? "";
          internalFuelCapacity2Controller.text = gen2.internalCapacity?.toString() ?? "";
          internalExistingFuel2Controller.text = gen2.internalExistingFuel?.toString() ?? "";
          internalFuelTankCage2 = gen2.internalCage == 1;
          externalFuelCapacity2Controller.text = gen2.externalCapacity?.toString() ?? "";
          externalExistingFuel2Controller.text = gen2.externalExistingFuel?.toString() ?? "";
          externalFuelTankCage2 = gen2.externalCage == 1;
          fuelSensor2Existing = gen2.fuelSensorExiting == 1;
          fuelSensor2Working = gen2.fuelSensorWorking == 1;
          gen2FuelSensorTypeController.text = gen2.fuelSensorType ?? "";
          gen2AmpereToOwnerController.text = gen2.ampereToOwner?.toString() ?? "";
          gen2CircuitBreakersController.text = gen2.circuitBreakersQuantity?.toString() ?? "";
        }
      }

      //! Solar and Wind System Info
      solarTypeController.text = solarWindInfo?.solarType ?? "";
      solarCapacityController.text = solarWindInfo?.solarCapacity?.toString() ?? "";
      numPanelsController.text = solarWindInfo?.numberOfPanels?.toString() ?? "";
      numModulesController.text = solarWindInfo?.numberOfModules?.toString() ?? "";
      numFaultyModulesController.text = solarWindInfo?.numberOfFaultyModules?.toString() ?? "";
      solarAndWindBatteriesNumController.text = solarWindInfo?.numberOfBatteries?.toString() ?? "";
      solarAndWindBatteriesbatteriesTypeController.text = solarWindInfo?.batteryType ?? "";
      selectedSolarAndWindBatteriesStatus = solarAndWindBatteriesStatus.containsKey(solarWindInfo?.batteryStatus) ? solarWindInfo?.batteryStatus : null;
      windRemarksController.text = solarWindInfo?.windRemarks ?? "";
      solarAndWindRemarksController.text = solarWindInfo?.remarks ?? "";

      //! Rectifier Info
      rectifier1TypeController.text = rectifierInfo?.rectifier1TypeAndVoltage ?? "";
      rectifier1ModuleQuantityController.text = rectifierInfo?.module1Quantity?.toString() ?? "";
      rectifier1FaultyModuleController.text = rectifierInfo?.faultyModule1Quantity?.toString() ?? "";
      rectifier2TypeController.text = rectifierInfo?.rectifier2TypeAndVoltage ?? "";
      rectifier2ModuleQuantityController.text = rectifierInfo?.module2Quantity?.toString() ?? "";
      rectifier2FaultyModuleController.text = rectifierInfo?.faultyModule2Quantity?.toString() ?? "";
      rectifierBatteriesNumController.text = rectifierInfo?.numberOfBatteries?.toString() ?? "";
      rectifierbatteriesTypeController.text = rectifierInfo?.batteryType ?? "";
      batteriesCabinetTypeController.text = rectifierInfo?.batteriesCabinetType ?? "";
      rectifierBatteriesRemarksController.text = rectifierInfo?.remarks ?? "";
      cabinetCage = rectifierInfo?.cabinetCage == 1;
      selectedRectifierBatteriesStatus = rectifierBatteriesStatus.containsKey(rectifierInfo?.batteriesStatus) ? rectifierInfo?.batteriesStatus : null;

      //! Environment Info
      powerControlSerialNumberController.text = environmentInfo?.powerControlSerialNumber ?? "";
      amperConsumptionController.text = environmentInfo?.ampereConsumption?.toString() ?? "";
      phaseOptions['Three Phase'] = environmentInfo?.threePhase == 1;
      phaseOptions['Mini Phase'] = environmentInfo?.miniPhase == 1;
      fanQuantityController.text = environmentInfo?.fanQuantity?.toString() ?? "";
      faultyFanQuantityController.text = environmentInfo?.faultyFanQuantity?.toString() ?? "";
      airConditioner1TypeController.text = environmentInfo?.airConditioner1Type ?? "";
      airConditioner2TypeController.text = environmentInfo?.airConditioner2Type ?? "";
      powerControlOwnershipController.text = environmentInfo?.powerControlOwnership ?? "";
      stabilizerQuantityController.text = environmentInfo?.stabilizerQuantity?.toString() ?? "";
      stabilizerTypeController.text = environmentInfo?.stabilizerType ?? "";
      earthingSystem = environmentInfo?.earthingSystem == 1;
      fireExiting = environmentInfo?.exiting == 1;
      fireWorking = environmentInfo?.working == 1;
      environmentRemarksController.text = environmentInfo?.remarks ?? "";

      //! LVDP Info
      lVDPExiting = lvdpInfo?.exiting == 1;
      lVDPWorking = lvdpInfo?.working == 1;
      lvdPStatusController.text = lvdpInfo?.status ?? "";
      lvdPRemarksController.text = lvdpInfo?.remarks ?? "";

      //! Ampere Info
      ampereCapacityController.text = amperesInfo?.capacity?.toString() ?? "";
      ampereTimeController.text = amperesInfo?.time.toString() ?? "";
      ampereCableLengthController.text = amperesInfo?.cableLength?.toString() ?? "";
      ampereDetailsController.text = amperesInfo?.details ?? "";

      //! TCU Info
      tcuConfigurations['TCU'] = (tcuInfo != null && tcuInfo.tcu != null && tcuInfo.tcu! >= 1);
      tcuConfigurations['2G'] = tcuInfo?.the2G ?? false;
      tcuConfigurations['3G'] = tcuInfo?.the3G ?? false;
      tcuConfigurations['LTE'] = tcuInfo?.lte ?? false;
      tcuRemarksController.text = tcuInfo?.remarks ?? "";

      //! Fiber Info
      fiberDestinationController.text = fiberInfo?.destination ?? "";
      fiberRemarksController.text = fiberInfo?.remarks ?? "";

      //! Band Info (GSM 900, GSM 1800, 3G, LTE)
      if (bandInfo != null) {
        final gsm900 = bandInfo.gsm900;
        getGSMController(MapKeys.gsm900, MapKeys.rbs1Type).text = gsm900?.rbs1Type ?? "";
        getGSMController(MapKeys.gsm900, MapKeys.du1Type).text = gsm900?.du1Type ?? "";
        getGSMController(MapKeys.gsm900, MapKeys.ru1Type).text = gsm900?.ru1Type ?? "";
        getGSMController(MapKeys.gsm900, MapKeys.rbs2Type).text = gsm900?.rbs2Type ?? "";
        getGSMController(MapKeys.gsm900, MapKeys.du2Type).text = gsm900?.du2Type ?? "";
        getGSMController(MapKeys.gsm900, MapKeys.ru2Type).text = gsm900?.ru2Type ?? "";
        getGSMController(MapKeys.gsm900, MapKeys.remarks).text = gsm900?.remarks ?? "";

        final gsm1800 = bandInfo.gsm1800;

        getGSMController(MapKeys.gsm1800, MapKeys.rbs1Type).text = gsm1800?.rbs1Type ?? "";
        getGSMController(MapKeys.gsm1800, MapKeys.du1Type).text = gsm1800?.du1Type ?? "";
        getGSMController(MapKeys.gsm1800, MapKeys.ru1Type).text = gsm1800?.ru1Type ?? "";
        getGSMController(MapKeys.gsm1800, MapKeys.rbs2Type).text = gsm1800?.rbs2Type ?? "";
        getGSMController(MapKeys.gsm1800, MapKeys.du2Type).text = gsm1800?.du2Type ?? "";
        getGSMController(MapKeys.gsm1800, MapKeys.ru2Type).text = gsm1800?.ru2Type ?? "";
        getGSMController(MapKeys.gsm1800, MapKeys.remarks).text = gsm1800?.remarks ?? "";
        final threeG = bandInfo.the3G;

        rbs1Type3GController.text = threeG?.rbs1Type ?? "";
        du1Type3GController.text = threeG?.du1Type ?? "";
        ru1Type3GController.text = threeG?.ru1Type ?? "";
        remarks3GController.text = threeG?.remarks ?? "";

        final lte = bandInfo.lte;
        rbs1TypeLTEController.text = lte?.rbs1Type ?? "";
        du1TypeLTEController.text = lte?.du1Type ?? "";
        ru1TypeLTEController.text = lte?.ru1Type ?? "";
        remarksLTEController.text = lte?.remarks ?? "";
      }
    }

    emit(VisitedSiteDetailsInitial()); // Emit to update UI
  }

  final siteGeneralInfoKey = GlobalKey<FormState>();
  final siteTypeAndConfigKey = GlobalKey<FormState>();
  final siteAdditionalInfoKey = GlobalKey<FormState>();
  final siteAmpereInfoKey = GlobalKey<FormState>();
  final siteTcuInfoKey = GlobalKey<FormState>();
  final siteFiberInfoKey = GlobalKey<FormState>();
  final siteGsm900InfoKey = GlobalKey<FormState>();
  final siteGsm1800InfoKey = GlobalKey<FormState>();
  final site3GInfoKey = GlobalKey<FormState>();
  final siteLTEInfoKey = GlobalKey<FormState>();
  final siteRectifierInfoKey = GlobalKey<FormState>();
  final siteEnvironmentInfoKey = GlobalKey<FormState>();
  final siteTowerMastMonopoleInfoKey = GlobalKey<FormState>();
  final siteSolarAndWindSystemInfoKey = GlobalKey<FormState>();
  final siteGeneratorInfoKey = GlobalKey<FormState>();
  final siteLvdpInfoKey = GlobalKey<FormState>();
  final siteAdditionalPhotoInfoKey = GlobalKey<FormState>();

  // Validation state variables
  bool isGeneralInfoValid = false;
  bool isTypeAndConfigValid = false;
  bool isAdditionalInfoValid = false;
  bool isAmpereInfoValid = false;
  bool isTcuInfoValid = false;
  bool isFiberInfoValid = false;
  bool isGsm900InfoValid = false;
  bool isGsm1800InfoValid = false;
  bool is3GInfoValid = false;
  bool isLTEInfoValid = false;
  bool isRectifierInfoValid = false;
  bool isEnvironmentInfoValid = false;
  bool isTowerMastMonopoleInfoValid = false;
  bool isSolarAndWindSystemInfoValid = false;
  bool isGeneratorInfoValid = false;
  bool isLvdpInfoValid = false;
  bool isAdditionalPhotoInfoValid = false;
  bool internalFuelTankCage1 = false;
  bool internalFuelTankCage2 = false;
  bool externalFuelTankCage1 = false;
  bool externalFuelTankCage2 = false;
  bool cabinetCage = false;
  bool miniPhase = false;
  bool threePhase = false;
  bool earthingSystem = false;
  bool fireExiting = false;
  bool fireWorking = false;
  bool lVDPExiting = false;
  bool lVDPWorking = false;
  bool fuelSensor1Existing = false;
  bool fuelSensor1Working = false;
  bool fuelSensor2Existing = false;
  bool fuelSensor2Working = false;

  String? selectedSiteType;
  String? selectedSolarAndWindBatteriesStatus;
  String? selectedRectifierBatteriesStatus;
  String? selectedCode;
  String? selectedName;

  List<XFile> generalSitePhotos = [];
  List<XFile> generatorImages = [];
  List<XFile> rectifierBatteriesImages = [];
  List<XFile> solarAndWindBatteriesImages = [];
  List<XFile> rectifierImages = [];
  List<XFile> rBSImages = [];
  List<XFile> itionalPhotos = [];
  List<XFile> transmissionPhotos = [];
  List<XFile> additionalPhotos = [];
  List<XFile> fuelCageImages = [];

  Map<String, bool> configurations = {
    'GSM 1900': false,
    'GSM 1800': false,
    '3G': false,
    'LTE': false,
    'Generator': false,
    'Solar': false,
    'Wind': false,
    'Grid': false,
    'Fence': false,
  };

  final Map<String, bool> structureOptions = {
    'Mast': false,
    'Tower': false,
    'Monopole': false,
  };

  // Checkboxes and Radio states
  Map<String, bool> tcuConfigurations = {
    'TCU': false,
    '2G': false,
    '3G': false,
    'LTE': false,
  };

  Map<String, bool> solarAndWindBatteriesStatus = {
    'Bad': false,
    'Good': false,
    'Very Good': false,
  };

  Map<String, bool> rectifierBatteriesStatus = {
    'Bad': false,
    'Good': false,
    'Very Good': false,
  };

  final Map<String, bool> phaseOptions = {
    'Mini Phase': false,
    'Three Phase': false,
  };

  final TextEditingController mastNumberController = TextEditingController();
  final TextEditingController mastStatusController = TextEditingController();
  final TextEditingController towerNumberController = TextEditingController();
  final TextEditingController towerStatusController = TextEditingController();
  final TextEditingController beaconStatusController = TextEditingController();
  final TextEditingController monopoleNumberController = TextEditingController();
  final TextEditingController monopoleStatusController = TextEditingController();
  final TextEditingController mast1HeightController = TextEditingController();
  final TextEditingController tower1HeightController = TextEditingController();
  final TextEditingController mast2HeightController = TextEditingController();
  final TextEditingController tower2HeightController = TextEditingController();
  final TextEditingController mast3HeightController = TextEditingController();
  final TextEditingController tower3HeightController = TextEditingController();
  final TextEditingController monopoleHeightController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();

  final TextEditingController gen1TypeAndCapacityController = TextEditingController();
  final TextEditingController gen1HourMeterController = TextEditingController();
  final TextEditingController gen1FuelConsumptionController = TextEditingController();
  final TextEditingController gen1FuelSensorTypeController = TextEditingController();
  final TextEditingController gen1AmpereToOwnerController = TextEditingController();
  final TextEditingController gen1CircuitBreakersController = TextEditingController();

  final TextEditingController gen2TypeAndCapacityController = TextEditingController();
  final TextEditingController gen2HourMeterController = TextEditingController();
  final TextEditingController gen2FuelConsumptionController = TextEditingController();
  final TextEditingController gen2FuelSensorTypeController = TextEditingController();
  final TextEditingController gen2AmpereToOwnerController = TextEditingController();
  final TextEditingController gen2CircuitBreakersController = TextEditingController();

  final TextEditingController siteNameController = TextEditingController();
  final TextEditingController siteCodeController = TextEditingController();
  final TextEditingController governorateController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  // LVDP Section Controllers
  final TextEditingController lvdPStatusController = TextEditingController();
  final TextEditingController lvdPRemarksController = TextEditingController();

  // Solar and Wind Section Controllers
  final TextEditingController solarTypeController = TextEditingController();
  final TextEditingController solarCapacityController = TextEditingController();
  final TextEditingController numPanelsController = TextEditingController();
  final TextEditingController numModulesController = TextEditingController();
  final TextEditingController numFaultyModulesController = TextEditingController();
  final TextEditingController solarAndWindBatteriesNumController = TextEditingController();
  final TextEditingController solarAndWindBatteriesbatteriesTypeController = TextEditingController();
  final TextEditingController windRemarksController = TextEditingController();
  final TextEditingController solarAndWindRemarksController = TextEditingController();

  // Ampere Section Controllers
  final TextEditingController ampereCapacityController = TextEditingController();
  final TextEditingController ampereTimeController = TextEditingController();
  final TextEditingController ampereCableLengthController = TextEditingController();
  final TextEditingController ampereDetailsController = TextEditingController();

  // TCU Section
  final tcuRemarksController = TextEditingController();

  // Fiber Section
  final fiberDestinationController = TextEditingController();
  final fiberRemarksController = TextEditingController();

  // GSM Section
  Map<String, Map<String, TextEditingController>> gsmControllers = {};

  TextEditingController getGSMController(String band, String field) {
    gsmControllers.putIfAbsent(band, () => {});
    gsmControllers[band]!.putIfAbsent(field, () => TextEditingController());
    return gsmControllers[band]![field]!;
  }

  // 3G Section
  final rbs1Type3GController = TextEditingController();
  final du1Type3GController = TextEditingController();
  final ru1Type3GController = TextEditingController();
  final remarks3GController = TextEditingController();

  // LTE Section
  final rbs1TypeLTEController = TextEditingController();
  final du1TypeLTEController = TextEditingController();
  final ru1TypeLTEController = TextEditingController();
  final remarksLTEController = TextEditingController();

  // Rectifier Section
  final rectifier1TypeController = TextEditingController();
  final rectifier1ModuleQuantityController = TextEditingController();
  final rectifier1FaultyModuleController = TextEditingController();
  final rectifier2TypeController = TextEditingController();
  final rectifier2ModuleQuantityController = TextEditingController();
  final rectifier2FaultyModuleController = TextEditingController();
  final rectifierBatteriesNumController = TextEditingController();
  final rectifierbatteriesTypeController = TextEditingController();
  final batteriesCabinetTypeController = TextEditingController();
  final rectifierBatteriesRemarksController = TextEditingController();

  TextEditingController powerControlSerialNumberController = TextEditingController();
  TextEditingController amperConsumptionController = TextEditingController();
  TextEditingController powerControlOwnershipController = TextEditingController();
  TextEditingController fanQuantityController = TextEditingController();
  TextEditingController faultyFanQuantityController = TextEditingController();
  TextEditingController airConditioner1TypeController = TextEditingController();
  TextEditingController airConditioner2TypeController = TextEditingController();
  TextEditingController stabilizerQuantityController = TextEditingController();
  TextEditingController stabilizerTypeController = TextEditingController();
  TextEditingController fireSystemController = TextEditingController();
  TextEditingController environmentRemarksController = TextEditingController();
  TextEditingController numberOfCabinetsController = TextEditingController();
  TextEditingController electricityMeterController = TextEditingController();
  TextEditingController electricityMeterReadingController = TextEditingController();
  TextEditingController fuelCapacityController = TextEditingController();
  TextEditingController existingFuelController = TextEditingController();

  TextEditingController generatorRemarksController = TextEditingController();

  TextEditingController internalFuelCapacity1Controller = TextEditingController();

  TextEditingController internalExistingFuel1Controller = TextEditingController();

  TextEditingController externalFuelCapacity1Controller = TextEditingController();

  TextEditingController externalExistingFuel1Controller = TextEditingController();

  TextEditingController internalFuelCapacity2Controller = TextEditingController();

  TextEditingController internalExistingFuel2Controller = TextEditingController();

  TextEditingController externalFuelCapacity2Controller = TextEditingController();

  TextEditingController externalExistingFuel2Controller = TextEditingController();

  Map<String, dynamic> bandsConverter(List<Map<String, dynamic>> a) {
    Map<String, dynamic> newMap = {};
    for (int i = 0; i < a.length; i++) {
      Map<String, dynamic> element = a[i];
      element.forEach((key, value) {
        newMap["${RequestKeys.bandInformations}[$i][$key]"] = value;
      });
    }
    return newMap;
  }

  Future<Map<String, dynamic>> createRequestBody({String? generator1Id, String? generator2Id}) async {
    return {
      RequestKeys.sites: {
        RequestKeys.name: selectedName,
        RequestKeys.code: selectedCode,
        RequestKeys.governorate: governorateController.text,
        RequestKeys.street: streetController.text,
        RequestKeys.area: areaController.text,
        RequestKeys.city: cityController.text,
        RequestKeys.type: selectedSiteType,
        RequestKeys.gsm1900: (configurations['GSM 1900'] ?? 0) == true ? 1 : 0,
        RequestKeys.gsm1800: (configurations['GSM 1800'] ?? 0) == true ? 1 : 0,
        RequestKeys.threeG: (configurations['3G'] ?? 0) == true ? 1 : 0,
        RequestKeys.lte: (configurations['LTE'] ?? 0) == true ? 1 : 0,
        RequestKeys.generator: (configurations['Generator'] ?? 0) == true ? 1 : 0,
        RequestKeys.solar: (configurations['Solar'] ?? 0) == true ? 1 : 0,
        RequestKeys.wind: (configurations['Wind'] ?? 0) == true ? 1 : 0,
        RequestKeys.grid: (configurations['Grid'] ?? 0) == true ? 1 : 0,
        RequestKeys.fence: (configurations['Fence'] ?? 0) == true ? 1 : 0,
        RequestKeys.cabinetNumber: numberOfCabinetsController.text,
        RequestKeys.electricityMeter: electricityMeterController.text,
        RequestKeys.electricityMeterReading: electricityMeterReadingController.text,
        RequestKeys.generatorRemark: generatorRemarksController.text,
      },
      RequestKeys.towerInformations: {
        RequestKeys.mast: (structureOptions['Mast'] == true ? 1 : 0),
        RequestKeys.tower: (structureOptions['Tower'] == true ? 1 : 0),
        RequestKeys.monopole: (structureOptions['Monopole'] == true ? 1 : 0),
        RequestKeys.mastNumber: mastNumberController.text,
        RequestKeys.mastStatus: mastStatusController.text,
        RequestKeys.monopoleNumber: monopoleNumberController.text,
        RequestKeys.monopoleStatus: monopoleStatusController.text,
        RequestKeys.towerNumber: towerNumberController.text,
        RequestKeys.towerStatus: towerStatusController.text,
        RequestKeys.beaconStatus: beaconStatusController.text,
        RequestKeys.mast1Height: mast1HeightController.text,
        RequestKeys.mast2Height: mast2HeightController.text,
        RequestKeys.mast3Height: mast3HeightController.text,
        RequestKeys.tower1Height: tower1HeightController.text,
        RequestKeys.tower2Height: tower2HeightController.text,
        RequestKeys.monopoleHeight: monopoleHeightController.text,
        RequestKeys.remarks: remarksController.text,
      },
      ...bandsConverter(
        [
          {
            RequestKeys.bandType: "GSM 900",
            RequestKeys.rbs1Type: gsmControllers[MapKeys.gsm900]?[MapKeys.rbs1Type]?.text,
            RequestKeys.du1Type: gsmControllers[MapKeys.gsm900]?[MapKeys.du1Type]?.text,
            RequestKeys.ru1Type: gsmControllers[MapKeys.gsm900]?[MapKeys.ru1Type]?.text,
            RequestKeys.rbs2Type: gsmControllers[MapKeys.gsm900]?[MapKeys.rbs2Type]?.text,
            RequestKeys.du2Type: gsmControllers[MapKeys.gsm900]?[MapKeys.du2Type]?.text,
            RequestKeys.ru2Type: gsmControllers[MapKeys.gsm900]?[MapKeys.ru2Type]?.text,
            RequestKeys.remarks: gsmControllers[MapKeys.gsm900]?[MapKeys.remarks]?.text,
          },
          {
            RequestKeys.bandType: "GSM 1800",
            RequestKeys.rbs1Type: gsmControllers[MapKeys.gsm1800]?[MapKeys.rbs1Type]?.text,
            RequestKeys.du1Type: gsmControllers[MapKeys.gsm1800]?[MapKeys.du1Type]?.text,
            RequestKeys.ru1Type: gsmControllers[MapKeys.gsm1800]?[MapKeys.ru1Type]?.text,
            RequestKeys.rbs2Type: gsmControllers[MapKeys.gsm1800]?[MapKeys.rbs2Type]?.text,
            RequestKeys.du2Type: gsmControllers[MapKeys.gsm1800]?[MapKeys.du2Type]?.text,
            RequestKeys.ru2Type: gsmControllers[MapKeys.gsm1800]?[MapKeys.ru2Type]?.text,
            RequestKeys.remarks: gsmControllers[MapKeys.gsm1800]?[MapKeys.remarks]?.text,
          },
          {
            RequestKeys.bandType: "LTE",
            RequestKeys.rbs1Type: rbs1TypeLTEController.text,
            RequestKeys.du1Type: du1TypeLTEController.text,
            RequestKeys.ru1Type: ru1TypeLTEController.text,
            RequestKeys.remarks: remarksLTEController.text,
          },
          {
            RequestKeys.bandType: "3G",
            RequestKeys.rbs1Type: rbs1Type3GController.text,
            RequestKeys.du1Type: du1Type3GController.text,
            RequestKeys.ru1Type: ru1Type3GController.text,
            RequestKeys.remarks: remarks3GController.text,
          },
        ],
      ),
      RequestKeys.generatorInformations: [
        {
          if (generator1Id != null) RequestKeys.id: generator1Id,
          RequestKeys.genTypeAndCapacity: gen1TypeAndCapacityController.text,
          RequestKeys.genHourMeter: gen1HourMeterController.text,
          RequestKeys.genFuelConsumption: gen1FuelConsumptionController.text,
          RequestKeys.internalCapacity: internalFuelCapacity1Controller.text,
          RequestKeys.internalExistingFuel: internalExistingFuel1Controller.text,
          RequestKeys.internalCage: internalFuelTankCage1 ? 1 : 0,
          RequestKeys.externalCapacity: externalFuelCapacity1Controller.text,
          RequestKeys.externalExistingFuel: externalExistingFuel1Controller.text,
          RequestKeys.externalCage: externalFuelTankCage1 ? 1 : 0,
          RequestKeys.fuelSensorExiting: fuelSensor1Existing ? 1 : 0,
          RequestKeys.fuelSensorWorking: fuelSensor1Working ? 1 : 0,
          RequestKeys.fuelSensorType: gen1FuelSensorTypeController.text,
          RequestKeys.ampereToOwner: gen1AmpereToOwnerController.text,
          RequestKeys.circuitBreakersQuantity: gen1CircuitBreakersController.text,
        },
        {
          if (generator2Id != null) RequestKeys.id: generator2Id,
          RequestKeys.genTypeAndCapacity: gen2TypeAndCapacityController.text,
          RequestKeys.genHourMeter: gen2HourMeterController.text,
          RequestKeys.genFuelConsumption: gen2FuelConsumptionController.text,
          RequestKeys.internalCapacity: internalFuelCapacity2Controller.text,
          RequestKeys.internalExistingFuel: internalExistingFuel2Controller.text,
          RequestKeys.internalCage: internalFuelTankCage2 ? 1 : 0,
          RequestKeys.externalCapacity: externalFuelCapacity2Controller.text,
          RequestKeys.externalExistingFuel: externalExistingFuel2Controller.text,
          RequestKeys.externalCage: externalFuelTankCage2 ? 1 : 0,
          RequestKeys.fuelSensorExiting: fuelSensor2Existing ? 1 : 0,
          RequestKeys.fuelSensorWorking: fuelSensor2Working ? 1 : 0,
          RequestKeys.fuelSensorType: gen2FuelSensorTypeController.text,
          RequestKeys.ampereToOwner: gen2AmpereToOwnerController.text,
          RequestKeys.circuitBreakersQuantity: gen2CircuitBreakersController.text,
        },
      ],
      RequestKeys.solarWindInformations: {
        RequestKeys.solarType: solarTypeController.text,
        RequestKeys.solarCapacity: solarCapacityController.text,
        RequestKeys.numberOfPanels: numPanelsController.text,
        RequestKeys.numberOfModules: numModulesController.text,
        RequestKeys.numberOfFaultyModules: numFaultyModulesController.text,
        RequestKeys.numberOfBatteries: solarAndWindBatteriesNumController.text,
        RequestKeys.batteryType: solarAndWindBatteriesbatteriesTypeController.text,
        RequestKeys.batteryStatus: selectedSolarAndWindBatteriesStatus,
        RequestKeys.windRemarks: windRemarksController.text,
        RequestKeys.remarks: solarAndWindRemarksController.text,
      },
      RequestKeys.rectifierInformations: {
        RequestKeys.rectifier1TypeAndVoltage: rectifier1TypeController.text,
        RequestKeys.module1Quantity: rectifier1ModuleQuantityController.text,
        RequestKeys.faultyModule1Quantity: rectifier1FaultyModuleController.text,
        RequestKeys.rectifier2TypeAndVoltage: rectifier2TypeController.text,
        RequestKeys.module2Quantity: rectifier2ModuleQuantityController.text,
        RequestKeys.faultyModule2Quantity: rectifier2FaultyModuleController.text,
        RequestKeys.numberOfBatteries: rectifierBatteriesNumController.text,
        RequestKeys.batteryType: rectifierbatteriesTypeController.text,
        RequestKeys.batteriesCabinetType: batteriesCabinetTypeController.text,
        RequestKeys.remarks: rectifierBatteriesRemarksController.text,
        RequestKeys.cabinetCage: cabinetCage == true ? 1 : 0,
        RequestKeys.batteriesStatus: selectedRectifierBatteriesStatus,
      },
      RequestKeys.environmentInformations: {
        RequestKeys.powerControlSerialNumber: powerControlSerialNumberController.text,
        RequestKeys.ampereConsumption: amperConsumptionController.text,
        RequestKeys.threePhase: phaseOptions['Three Phase'] == true ? 1 : 0,
        RequestKeys.miniPhase: phaseOptions['Mini Phase'] == true ? 1 : 0,
        RequestKeys.fanQuantity: fanQuantityController.text,
        RequestKeys.faultyFanQuantity: faultyFanQuantityController.text,
        RequestKeys.airConditioner1Type: airConditioner1TypeController.text,
        RequestKeys.airConditioner2Type: airConditioner2TypeController.text,
        RequestKeys.powerControlOwnership: powerControlOwnershipController.text,
        RequestKeys.stabilizerQuantity: stabilizerQuantityController.text,
        RequestKeys.stabilizerType: stabilizerTypeController.text,
        RequestKeys.earthingSystem: earthingSystem ? 1 : 0,
        RequestKeys.exiting: fireExiting ? 1 : 0,
        RequestKeys.working: fireWorking ? 1 : 0,
        RequestKeys.remarks: environmentRemarksController.text,
      },
      RequestKeys.lvdpInformations: {
        RequestKeys.exiting: lVDPExiting ? 1 : 0,
        RequestKeys.working: lVDPWorking ? 1 : 0,
        RequestKeys.status: lvdPStatusController.text,
        RequestKeys.remarks: lvdPRemarksController.text,
      },
      RequestKeys.amperesInformations: {
        RequestKeys.capacity: ampereCapacityController.text,
        RequestKeys.time: ampereTimeController.text,
        RequestKeys.cableLength: ampereCableLengthController.text,
        RequestKeys.details: ampereDetailsController.text,
      },
      RequestKeys.tcuInformations: {
        RequestKeys.tcu: (tcuConfigurations['TCU'] ?? 0) == true ? 1 : 0,
        RequestKeys.remarks: tcuRemarksController.text,
      },
      "${RequestKeys.tcuInformations}[${RequestKeys.tcuTypes}][0]": tcuConfigurations['TCU'] == true ? (tcuConfigurations['3G'] == true ? '3G' : null) : null,
      "${RequestKeys.tcuInformations}[${RequestKeys.tcuTypes}][1]": tcuConfigurations['TCU'] == true ? (tcuConfigurations['LTE'] == true ? 'LTE' : null) : null,
      "${RequestKeys.tcuInformations}[${RequestKeys.tcuTypes}][2]": tcuConfigurations['TCU'] == true ? (tcuConfigurations['2G'] == true ? '2G' : null) : null,
      RequestKeys.fiberInformations: {
        RequestKeys.destination: fiberDestinationController.text,
        RequestKeys.remarks: fiberRemarksController.text,
      },
    };
  }

  Future<Map<String, MultipartFile>> uploadImagesToApi(String key, List<XFile>? images) async {
    if (images == null) return {};

    final Map<String, MultipartFile> mappedImages = {};
    for (var i = 0; i < images.length; i++) {
      final image = images[i];
      final multipartFile = await MultipartFile.fromFile(image.path, filename: image.path.split('/').last);
      mappedImages['$key[$i]'] = multipartFile;
    }
    return mappedImages;
  }

  Future<Either<Failure, MessageEntity>> postVisitedSiteTrigger() async {
    final body = await createRequestBody();
    body.addAll(await uploadImagesToApi(RequestKeys.generalSiteImages, generalSitePhotos));
    body.addAll(await uploadImagesToApi(RequestKeys.rectifierImages, rectifierImages));
    body.addAll(await uploadImagesToApi(RequestKeys.additionalImages, additionalPhotos));
    body.addAll(await uploadImagesToApi(RequestKeys.rectifierBatteriesImages, rectifierBatteriesImages));
    body.addAll(await uploadImagesToApi(RequestKeys.rbsImages, rBSImages));
    body.addAll(await uploadImagesToApi(RequestKeys.solarAndWindBatteriesImages, solarAndWindBatteriesImages));
    body.addAll(await uploadImagesToApi(RequestKeys.generatorImages, generatorImages));
    body.addAll(await uploadImagesToApi(RequestKeys.transmissionImages, transmissionPhotos));
    body.addAll(await uploadImagesToApi(RequestKeys.fuelCageImages, fuelCageImages));
    final response = await postVisitedSiteUseCase.call(body: body);
    return response;
  }

  Future<Either<Failure, MessageEntity>> editTrigger({required String siteId, required String? generator1Id, required String? generator2Id}) async {
    final body = await createRequestBody(generator1Id: generator1Id, generator2Id: generator2Id);
    log(body.toString());
    final response = await editVisitedSiteUseCase.call(body: body, id: siteId);
    return response;
  }

  Future<Either<Failure, ShowSiteDetailsEntity>> showDetailsTrigger({required String siteId}) async {
    final response = await showVisitedSiteDetailsUseCase.call(id: siteId);
    return response;
  }

  Future<Either<Failure, GetVisitedSiteImagesEntity>> getGeneralImagesTrigger({required String id, required VisitedSiteAdditionalImagesType type}) async {
    final response = getAdditionalVisitedSiteImagesUseCase.call(id: id, type: type);
    return response;
  }

  Future<Either<Failure, GetVisitedSiteImagesEntity>> getSectionImagesTrigger({required String id, required VisitedSiteSectionImagesType type}) async {
    final response = getSectionVisitedSiteImagesUseCase.call(id: id, type: type);
    return response;
  }

  changeCheckBoxStatus(Map<String, bool> checkboxOptions, String key) {
    checkboxOptions[key] = !checkboxOptions[key]!;

    emit(VisitedSiteDetailsInitial());
  }

  changeSwitchStatus(void Function() onPressed) {
    onPressed();
    emit(VisitedSiteDetailsInitial());
  }

  changeDropDownSelectedType(void Function() onPressed) {
    onPressed();
    emit(VisitedSiteDetailsInitial());
  }

  addRemoveImage(void Function() onPressed) {
    onPressed();
    emit(VisitedSiteDetailsInitial());
  }

  void validateForm(GlobalKey<FormState> formKey, FormType formType) {
    // Get the current form state
    bool isValid = formKey.currentState?.validate() ?? false;

    log(isValid.toString());
    // Update the corresponding validation variable based on form type
    switch (formType) {
      case FormType.generalInfo:
        isGeneralInfoValid = isValid;
        break;
      case FormType.typeAndConfig:
        isTypeAndConfigValid = isValid;
        break;
      case FormType.additionalInfo:
        isAdditionalInfoValid = isValid;
        break;
      case FormType.ampereInfo:
        isAmpereInfoValid = isValid;
        break;
      case FormType.tcuInfo:
        isTcuInfoValid = isValid;
        break;
      case FormType.fiberInfo:
        isFiberInfoValid = isValid;
        break;
      case FormType.gsm900Info:
        isGsm900InfoValid = isValid;
        break;
      case FormType.gsm1800Info:
        isGsm1800InfoValid = isValid;
        break;
      case FormType.threeGInfo:
        is3GInfoValid = isValid;
        break;
      case FormType.lteInfo:
        isLTEInfoValid = isValid;
        break;
      case FormType.rectifierInfo:
        isRectifierInfoValid = isValid;
        break;
      case FormType.environmentInfo:
        isEnvironmentInfoValid = isValid;
        break;
      case FormType.towerMastMonopoleInfo:
        isTowerMastMonopoleInfoValid = isValid;
        break;
      case FormType.solarAndWindSystemInfo:
        isSolarAndWindSystemInfoValid = isValid;
        break;
      case FormType.generatorInfo:
        isGeneratorInfoValid = isValid;
        break;
      case FormType.lvdpInfo:
        isLvdpInfoValid = isValid;
        break;
      case FormType.additionalPhotoInfo:
        isAdditionalPhotoInfoValid = isValid;
        break;
    }
    log(isAdditionalPhotoInfoValid.toString());
    // Emit a new state to reflect the changes
    emit(FormValidationChanged());
  }

  double get formCompletionPercentage {
    int totalForms = 17; // Total number of forms
    int completedForms = 0;

    log(isAdditionalPhotoInfoValid.toString());

    if (isGeneralInfoValid) completedForms++;
    if (isTypeAndConfigValid) completedForms++;
    if (isAdditionalInfoValid) completedForms++;
    if (isAmpereInfoValid) completedForms++;
    if (isTcuInfoValid) completedForms++;
    if (isFiberInfoValid) completedForms++;
    if (isGsm900InfoValid) completedForms++;
    if (isGsm1800InfoValid) completedForms++;
    if (is3GInfoValid) completedForms++;
    if (isLTEInfoValid) completedForms++;
    if (isRectifierInfoValid) completedForms++;
    if (isEnvironmentInfoValid) completedForms++;
    if (isTowerMastMonopoleInfoValid) completedForms++;
    if (isSolarAndWindSystemInfoValid) completedForms++;
    if (isGeneratorInfoValid) completedForms++;
    if (isLvdpInfoValid) completedForms++;
    if (isAdditionalPhotoInfoValid) completedForms++;

    return completedForms / totalForms;
  }

  @override
  void onChange(Change<VisitedSiteDetailsState> change) {
    super.onChange(change);
  }

  @override
  Future<void> close() {
    log("MyCubit is being closed!"); // Debug message
    return super.close();
  }
}
