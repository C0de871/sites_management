import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../core/utils/constants/constant.dart';

import '../../../../../../core/databases/api/end_points.dart';
import '../../../../../../core/utils/services/service_locator.dart';
import '../../../../domain/entities/add_visited_site_entities/add_visited_site_entity.dart';
import '../../../../domain/use_cases/add_visited_site_use_case.dart';

part 'add_visited_site_state.dart';

class AddVisitedSiteCubit extends Cubit<AddVisitedSiteState> {
  AddVisitedSite postVisitedSiteUseCase;

  AddVisitedSiteCubit()
      : postVisitedSiteUseCase = getIt(),
        super(AddVisitedSiteInitial());

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

  String? selectedSiteType;
  String? selectedSolarAndWindBatteriesStatus;
  String? selectedRectifierBatteriesStatus;

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

  String? selectedCode;
  String? selectedName;

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

  final TextEditingController mastNumberController = TextEditingController();
  final TextEditingController mastStatusController = TextEditingController();
  final TextEditingController towerNumberController = TextEditingController();
  final TextEditingController towerStatusController = TextEditingController();
  final TextEditingController beaconStatusController = TextEditingController();
  final TextEditingController monopoleNumberController =
      TextEditingController();
  final TextEditingController monopoleStatusController =
      TextEditingController();
  final TextEditingController mast1HeightController = TextEditingController();
  final TextEditingController tower1HeightController = TextEditingController();
  final TextEditingController mast2HeightController = TextEditingController();
  final TextEditingController tower2HeightController = TextEditingController();
  final TextEditingController mast3HeightController = TextEditingController();
  final TextEditingController tower3HeightController = TextEditingController();
  final TextEditingController monopoleHeightController =
      TextEditingController();
  final TextEditingController remarksController = TextEditingController();

  final TextEditingController gen1TypeAndCapacityController =
      TextEditingController();
  final TextEditingController gen1HourMeterController = TextEditingController();
  final TextEditingController gen1FuelConsumptionController =
      TextEditingController();
  final TextEditingController gen1FuelSensorTypeController =
      TextEditingController();
  final TextEditingController gen1AmpereToOwnerController =
      TextEditingController();
  final TextEditingController gen1CircuitBreakersController =
      TextEditingController();

  final TextEditingController gen2TypeAndCapacityController =
      TextEditingController();
  final TextEditingController gen2HourMeterController = TextEditingController();
  final TextEditingController gen2FuelConsumptionController =
      TextEditingController();
  final TextEditingController gen2FuelSensorTypeController =
      TextEditingController();
  final TextEditingController gen2AmpereToOwnerController =
      TextEditingController();
  final TextEditingController gen2CircuitBreakersController =
      TextEditingController();

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
  final TextEditingController numFaultyModulesController =
      TextEditingController();
  final TextEditingController solarAndWindBatteriesNumController =
      TextEditingController();
  final TextEditingController solarAndWindBatteriesbatteriesTypeController =
      TextEditingController();
  final TextEditingController windRemarksController = TextEditingController();
  final TextEditingController solarAndWindRemarksController =
      TextEditingController();

  // Ampere Section Controllers
  final TextEditingController ampereCapacityController =
      TextEditingController();
  final TextEditingController ampereTimeController = TextEditingController();
  final TextEditingController ampereCableLengthController =
      TextEditingController();
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

  TextEditingController powerControlSerialNumberController =
      TextEditingController();
  TextEditingController amperConsumptionController = TextEditingController();
  TextEditingController powerControlOwnershipController =
      TextEditingController();
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
  TextEditingController electricityMeterReadingController =
      TextEditingController();
  TextEditingController fuelCapacityController = TextEditingController();
  TextEditingController existingFuelController = TextEditingController();

  TextEditingController generatorRemarksController = TextEditingController();

  TextEditingController internalFuelCapacity1Controller =
      TextEditingController();

  TextEditingController internalExistingFuel1Controller =
      TextEditingController();

  TextEditingController externalFuelCapacity1Controller =
      TextEditingController();

  TextEditingController externalExistingFuel1Controller =
      TextEditingController();

  TextEditingController internalFuelCapacity2Controller =
      TextEditingController();

  TextEditingController internalExistingFuel2Controller =
      TextEditingController();

  TextEditingController externalFuelCapacity2Controller =
      TextEditingController();

  TextEditingController externalExistingFuel2Controller =
      TextEditingController();

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

  Future<Map<String, dynamic>> createRequestBody() async {
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
        RequestKeys.generator:
            (configurations['Generator'] ?? 0) == true ? 1 : 0,
        RequestKeys.solar: (configurations['Solar'] ?? 0) == true ? 1 : 0,
        RequestKeys.wind: (configurations['Wind'] ?? 0) == true ? 1 : 0,
        RequestKeys.grid: (configurations['Grid'] ?? 0) == true ? 1 : 0,
        RequestKeys.fence: (configurations['Fence'] ?? 0) == true ? 1 : 0,
        RequestKeys.cabinetNumber: numberOfCabinetsController.text,
        RequestKeys.electricityMeter: electricityMeterController.text,
        RequestKeys.electricityMeterReading:
            electricityMeterReadingController.text,
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
            RequestKeys.bandType: "gsm 900",
            RequestKeys.rbs1Type:
                gsmControllers[MapKeys.gsm900]?[MapKeys.rbs1Type]?.text,
            RequestKeys.du1Type:
                gsmControllers[MapKeys.gsm900]?[MapKeys.du1Type]?.text,
            RequestKeys.ru1Type:
                gsmControllers[MapKeys.gsm900]?[MapKeys.ru1Type]?.text,
            RequestKeys.rbs2Type:
                gsmControllers[MapKeys.gsm900]?[MapKeys.rbs2Type]?.text,
            RequestKeys.du2Type:
                gsmControllers[MapKeys.gsm900]?[MapKeys.du2Type]?.text,
            RequestKeys.ru2Type:
                gsmControllers[MapKeys.gsm900]?[MapKeys.ru2Type]?.text,
            RequestKeys.remarks:
                gsmControllers[MapKeys.gsm900]?[MapKeys.remarks]?.text,
          },
          {
            RequestKeys.bandType: "gsm 1800",
            RequestKeys.rbs1Type:
                gsmControllers[MapKeys.gsm1800]?[MapKeys.rbs1Type]?.text,
            RequestKeys.du1Type:
                gsmControllers[MapKeys.gsm1800]?[MapKeys.du1Type]?.text,
            RequestKeys.ru1Type:
                gsmControllers[MapKeys.gsm1800]?[MapKeys.ru1Type]?.text,
            RequestKeys.rbs2Type:
                gsmControllers[MapKeys.gsm1800]?[MapKeys.rbs2Type]?.text,
            RequestKeys.du2Type:
                gsmControllers[MapKeys.gsm1800]?[MapKeys.du2Type]?.text,
            RequestKeys.ru2Type:
                gsmControllers[MapKeys.gsm1800]?[MapKeys.ru2Type]?.text,
            RequestKeys.remarks:
                gsmControllers[MapKeys.gsm1800]?[MapKeys.remarks]?.text,
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
          RequestKeys.genTypeAndCapacity: gen1TypeAndCapacityController.text,
          RequestKeys.genHourMeter: gen1HourMeterController.text,
          RequestKeys.genFuelConsumption: gen1FuelConsumptionController.text,
          RequestKeys.internalCapacity: internalFuelCapacity1Controller.text,
          RequestKeys.internalExistingFuel:
              internalExistingFuel1Controller.text,
          RequestKeys.internalCage: internalFuelTankCage1 ? 1 : 0,
          RequestKeys.externalCapacity: externalFuelCapacity1Controller.text,
          RequestKeys.externalExistingFuel:
              externalExistingFuel1Controller.text,
          RequestKeys.externalCage: externalFuelTankCage1 ? 1 : 0,
          RequestKeys.fuelSensorExiting: fuelSensor1Existing ? 1 : 0,
          RequestKeys.fuelSensorWorking: fuelSensor1Working ? 1 : 0,
          RequestKeys.fuelSensorType: gen1FuelSensorTypeController.text,
          RequestKeys.ampereToOwner: gen1AmpereToOwnerController.text,
          RequestKeys.circuitBreakersQuantity:
              gen1CircuitBreakersController.text,
        },
        {
          RequestKeys.genTypeAndCapacity: gen2TypeAndCapacityController.text,
          RequestKeys.genHourMeter: gen2HourMeterController.text,
          RequestKeys.genFuelConsumption: gen2FuelConsumptionController.text,
          RequestKeys.internalCapacity: internalFuelCapacity2Controller.text,
          RequestKeys.internalExistingFuel:
              internalExistingFuel2Controller.text,
          RequestKeys.internalCage: internalFuelTankCage2 ? 1 : 0,
          RequestKeys.externalCapacity: externalFuelCapacity2Controller.text,
          RequestKeys.externalExistingFuel:
              externalExistingFuel2Controller.text,
          RequestKeys.externalCage: externalFuelTankCage2 ? 1 : 0,
          RequestKeys.fuelSensorExiting: fuelSensor2Existing ? 1 : 0,
          RequestKeys.fuelSensorWorking: fuelSensor2Working ? 1 : 0,
          RequestKeys.fuelSensorType: gen2FuelSensorTypeController.text,
          RequestKeys.ampereToOwner: gen2AmpereToOwnerController.text,
          RequestKeys.circuitBreakersQuantity:
              gen2CircuitBreakersController.text,
        },
      ],
      RequestKeys.solarWindInformations: {
        RequestKeys.solarType: solarTypeController.text,
        RequestKeys.solarCapacity: solarCapacityController.text,
        RequestKeys.numberOfPanels: numPanelsController.text,
        RequestKeys.numberOfModules: numModulesController.text,
        RequestKeys.numberOfFaultyModules: numFaultyModulesController.text,
        RequestKeys.numberOfBatteries: solarAndWindBatteriesNumController.text,
        RequestKeys.batteryType:
            solarAndWindBatteriesbatteriesTypeController.text,
        RequestKeys.batteryStatus: selectedSolarAndWindBatteriesStatus,
        RequestKeys.windRemarks: windRemarksController.text,
        RequestKeys.remarks: solarAndWindRemarksController.text,
      },
      RequestKeys.rectifierInformations: {
        RequestKeys.rectifier1TypeAndVoltage: rectifier1TypeController.text,
        RequestKeys.module1Quantity: rectifier1ModuleQuantityController.text,
        RequestKeys.faultyModule1Quantity:
            rectifier1FaultyModuleController.text,
        RequestKeys.rectifier2TypeAndVoltage: rectifier2TypeController.text,
        RequestKeys.module2Quantity: rectifier2ModuleQuantityController.text,
        RequestKeys.faultyModule2Quantity:
            rectifier2FaultyModuleController.text,
        RequestKeys.numberOfBatteries: rectifierBatteriesNumController.text,
        RequestKeys.batteryType: rectifierbatteriesTypeController.text,
        RequestKeys.batteriesCabinetType: batteriesCabinetTypeController.text,
        RequestKeys.remarks: rectifierBatteriesRemarksController.text,
        RequestKeys.cabinetCage: cabinetCage == true ? 1 : 0,
        RequestKeys.batteriesStatus: selectedRectifierBatteriesStatus,
      },
      RequestKeys.environmentInformations: {
        RequestKeys.powerControlSerialNumber:
            powerControlSerialNumberController.text,
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
      "${RequestKeys.tcuInformations}[${RequestKeys.tcuTypes}][0]":
          tcuConfigurations['TCU'] == true
              ? (tcuConfigurations['3G'] == true ? '3G' : null)
              : null,
      "${RequestKeys.tcuInformations}[${RequestKeys.tcuTypes}][1]":
          tcuConfigurations['TCU'] == true
              ? (tcuConfigurations['LTE'] == true ? 'LTE' : null)
              : null,
      "${RequestKeys.tcuInformations}[${RequestKeys.tcuTypes}][2]":
          tcuConfigurations['TCU'] == true
              ? (tcuConfigurations['2G'] == true ? '2G' : null)
              : null,
      RequestKeys.fiberInformations: {
        RequestKeys.destination: fiberDestinationController.text,
        RequestKeys.remarks: fiberRemarksController.text,
      },
    };
  }

  Future<Map<String, MultipartFile>> uploadImagesToApi(
      String key, List<XFile>? images) async {
    if (images == null) return {};

    final Map<String, MultipartFile> mappedImages = {};
    for (var i = 0; i < images.length; i++) {
      final image = images[i];
      final multipartFile = await MultipartFile.fromFile(image.path,
          filename: image.path.split('/').last);
      mappedImages['$key[$i]'] = multipartFile;
    }
    return mappedImages;
  }

  void postVisitedSiteTrigger() async {
    emit(AddVisitedSiteLoading());

    final body = await createRequestBody();
    body.addAll(await uploadImagesToApi(
        RequestKeys.generalSiteImages, generalSitePhotos));
    body.addAll(
        await uploadImagesToApi(RequestKeys.rectifierImages, rectifierImages));
    body.addAll(await uploadImagesToApi(
        RequestKeys.additionalImages, additionalPhotos));
    body.addAll(await uploadImagesToApi(
        RequestKeys.rectifierBatteriesImages, rectifierBatteriesImages));
    body.addAll(await uploadImagesToApi(RequestKeys.rbsImages, rBSImages));
    body.addAll(await uploadImagesToApi(
        RequestKeys.solarAndWindBatteriesImages, solarAndWindBatteriesImages));
    body.addAll(
        await uploadImagesToApi(RequestKeys.generatorImages, generatorImages));
    body.addAll(await uploadImagesToApi(
        RequestKeys.transmissionImages, transmissionPhotos));
    body.addAll(
        await uploadImagesToApi(RequestKeys.fuelCageImages, fuelCageImages));
    final response = await postVisitedSiteUseCase.call(body: body);
    response.fold(
      (failure) => emit(AddVisitedSiteFailed(msg: failure.errMessage)),
      (data) => emit(
        AddVisitedSiteSuccess(data: data),
      ),
    );
  }

  changeCheckBoxStatus(Map<String, bool> checkboxOptions, String key) {
    checkboxOptions[key] = !checkboxOptions[key]!;

    emit(AddVisitedSiteInitial());
  }

  changeSwitchStatus(void Function() onPressed) {
    onPressed();
    emit(AddVisitedSiteInitial());
  }

  changeDropDownSelectedType(void Function() onPressed) {
    onPressed();
    emit(AddVisitedSiteInitial());
  }

  addRemoveImage(void Function() onPressed) {
    onPressed();
    emit(AddVisitedSiteInitial());
  }

  @override
  void onChange(Change<AddVisitedSiteState> change) {
    super.onChange(change);
  }

  @override
  Future<void> close() {
    log("MyCubit is being closed!"); // Debug message
    return super.close();
  }

  // Add this function to your PostVisitedSiteCubit class
  void validateForm(GlobalKey<FormState> formKey, FormType formType) {
    // Get the current form state
    bool isValid = true;

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
}

enum FormType {
  generalInfo,
  typeAndConfig,
  additionalInfo,
  ampereInfo,
  tcuInfo,
  fiberInfo,
  gsm900Info,
  gsm1800Info,
  threeGInfo,
  lteInfo,
  rectifierInfo,
  environmentInfo,
  towerMastMonopoleInfo,
  solarAndWindSystemInfo,
  generatorInfo,
  lvdpInfo,
  additionalPhotoInfo,
}
