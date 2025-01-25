import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
    'Mast': false, // Replace with your state variable
    'Tower': false, // Replace with your state variable
    'Monopole': false, // Replace with your state variable
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



  changeCheckBoxStatus(Map<String, bool> checkboxOptions, String key) {
    checkboxOptions[key] = !checkboxOptions[key]!;
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

  addImage(void Function() onPressed){
    onPressed();
    emit(VisitFormInitial());
  }
}
