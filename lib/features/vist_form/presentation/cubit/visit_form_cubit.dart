import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'visit_form_state.dart';

class VisitFormCubit extends Cubit<VisitFormState> {
  VisitFormCubit() : super(VisitFormInitial());

  final formKey = GlobalKey<FormState>();
  String? selectedSiteType;

  List<XFile> generalSitePhotos = [];
  List<XFile> generatorImages = [];
  List<XFile> rectifierBatteriesImages = [];
  List<XFile> solarAndWindBatteriesImages = [];
  List<XFile> rectifierImages = [];
  List<XFile> rBSImages = [];
  List<XFile> itionalPhotos = [];
  List<XFile> transmissionPhotos = [];
  List<XFile> additionalPhotos = [];

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

  Map<String, bool> batteriesStatus = {
    'Bad': false,
    'Good': false,
    'Very Good': false,
  };

  final Map<String, bool> phaseOptions = {
    'Mini Phase': false,
    'Three Phase': false,
  };

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
  final TextEditingController monopoleNumberController = TextEditingController();
  final TextEditingController monopoleStatusController = TextEditingController();
  final TextEditingController mastHeightController = TextEditingController();
  final TextEditingController towerHeightController = TextEditingController();
  final TextEditingController mast2HeightController = TextEditingController();
  final TextEditingController tower2HeightController = TextEditingController();
  final TextEditingController mast3HeightController = TextEditingController();
  final TextEditingController tower3HeightController = TextEditingController();
  final TextEditingController monopoleHeightController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();

  final TextEditingController gen1TypeController = TextEditingController();
  final TextEditingController gen1HourMeterController = TextEditingController();
  final TextEditingController gen1FuelConsumptionController = TextEditingController();
  final TextEditingController gen1FuelSensorTypeController = TextEditingController();
  final TextEditingController gen1AmpereToOwnerController = TextEditingController();
  final TextEditingController gen1CircuitBreakersController = TextEditingController();

  final TextEditingController gen2TypeController = TextEditingController();
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
  final ruType3GController = TextEditingController();
  final remarks3GController = TextEditingController();

  // LTE Section
  final rbs1TypeLTEController = TextEditingController();
  final du1TypeLTEController = TextEditingController();
  final ruTypeLTEController = TextEditingController();
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

  changeCheckBoxStatus(Map<String, bool> checkboxOptions, String key) {
    checkboxOptions[key] = !checkboxOptions[key]!;

    log("checkbox option: ${checkboxOptions[key].toString()}");
    log("configuration: ${configurations[key].toString()}");

    emit(VisitFormInitial());
  }

  changeSwitchStatus(void Function() onPressed) {
    onPressed();
    emit(VisitFormInitial());
  }

  changeDropDownSelectedType(void Function() onPressed) {
    onPressed();
    emit(VisitFormInitial());
  }

  addImage(void Function() onPressed) {
    onPressed();
    emit(VisitFormInitial());
  }

  @override
  void onChange(Change<VisitFormState> change) {
    // TODO: implement onChange
    super.onChange(change);
    log(change.currentState.toString());
    log(change.nextState.toString());
    log((change.currentState == change.nextState).toString());
  }
}
