import 'package:flutter_dotenv/flutter_dotenv.dart';

class EndPoints {
  static String baserUrl = dotenv.env['BASEURL']!;
  static String postVisitedSite = dotenv.env["ADDVISITEDSITE"]!;
  static String getVisitedSites = dotenv.env["GETALLVISITEDSITES"]!;
  static String loginUser = dotenv.env["LOGINUSER"]!;
}

class ApiKey {
  static const String message = "message";
  static const String capacity = 'capacity';
  static const String time = 'time';
  static const String cableLength = 'cable_length';
  static const String details = 'details';
  static const String bandType = 'band_type';
  static const String rbs1Type = 'rbs_1_type';
  static const String rbs2Type = 'rbs_2_type';
  static const String du1Type = 'du_1_type';
  static const String du2Type = 'du_2_type';
  static const String ru1Type = 'ru_1_type';
  static const String ru2Type = 'ru_2_type';
  static const String remarks = 'remarks';
  static const String remark = 'remark';
  static const String powerControlSerialNumber = 'power_control_serial_number';
  static const String ampereConsumption = 'ampere_consumption';
  static const String miniPhase = 'mini_phase';
  static const String threePhase = 'three_phase';
  static const String powerControlOwnership = 'power_control_ownership';
  static const String fanQuantity = 'fan_quantity';
  static const String faultyFanQuantity = 'faulty_fan_quantity';
  static const String earthingSystem = 'earthing_system';
  static const String airConditioner1Type = 'air_conditioner_1_type';
  static const String airConditioner2Type = 'air_conditioner_2_type';
  static const String stabilizerQuantity = 'stabilizer_quantity';
  static const String stabilizerType = 'stabilizer_type';
  static const String fireSystem = 'fire_system';
  static const String exiting = 'exiting';
  static const String working = 'working';
  static const String destination = 'destination';
  static const String genTypeAndCapacity = 'gen_type_and_capacity';
  static const String genHourMeter = 'gen_hour_meter';
  static const String genFuelConsumption = 'gen_fuel_consumption';
  static const String internalCapacity = 'internal_capacity';
  static const String internalExistingFuel = 'internal_existing_fuel';
  static const String internalCage = 'internal_cage';
  static const String externalCapacity = 'external_capacity';
  static const String externalExistingFuel = 'external_existing_fuel';
  static const String externalCage = 'external_cage';
  static const String fuelSensorExiting = 'fuel_sensor_exiting';
  static const String fuelSensorWorking = 'fuel_sensor_working';
  static const String fuelSensorType = 'fuel_sensor_type';
  static const String ampereToOwner = 'ampere_to_owner';
  static const String circuitBreakersQuantity = 'circuit_breakers_quantity';
  static const String status = 'status';
  static const String rectifier1TypeAndVoltage = 'rectifier_1_type_and_voltage';
  static const String rectifier2TypeAndVoltage = 'rectifier_2_type_and_voltage';
  static const String module1Quantity = 'module_1_quantity';
  static const String module2Quantity = 'module_2_quantity';
  static const String faultyModule1Quantity = 'faulty_module_1_quantity';
  static const String faultyModule2Quantity = 'faulty_module_2_quantity';
  static const String numberOfBatteries = 'number_of_batteries';
  static const String batteryType = 'battery_type';
  static const String batteriesCabinetType = 'batteries_cabinet_type';
  static const String cabinetCage = 'cabinet_cage';
  static const String batteriesStatus = 'batteries_status';
  static const String name = 'name';
  static const String code = 'code';
  static const String governorate = 'governorate';
  static const String street = 'street';
  static const String area = 'area';
  static const String city = 'city';
  static const String type = 'type';
  static const String gsm1900 = 'gsm1900';
  static const String gsm1800 = 'gsm1800';
  static const String threeg = '3g';
  static const String lte = 'lte';
  static const String generator = 'generator';
  static const String solar = 'solar';
  static const String wind = 'wind';
  static const String grid = 'grid';
  static const String fence = 'fence';
  static const String cabinetNumber = 'cabinet_number';
  static const String electricityMeter = 'electricity_meter';
  static const String electricityMeterReading = 'electricity_meter_reading';
  static const String generatorRemark = 'generator_remark';
  static const String solarType = 'solar_type';
  static const String solarCapacity = 'solar_capacity';
  static const String numberOfPanels = 'number_of_panels';
  static const String numberOfModules = 'number_of_modules';
  static const String numberOfFaultyModules = 'number_of_faulty_modules';

  static const String batteryStatus = 'battery_status';
  static const String windRemarks = 'wind_remarks';
  static const String tcu = 'tcu';
  static const String tcuTypes = 'tcu_types';
  static const String mast = 'mast';
  static const String tower = 'tower';
  static const String monopole = 'monopole';
  static const String mastNumber = 'mast_number';
  static const String mastStatus = 'mast_status';
  static const String towerNumber = 'tower_number';
  static const String towerStatus = 'tower_status';
  static const String beaconStatus = 'beacon_status';
  static const String monopoleNumber = 'monopole_number';
  static const String monopoleStatus = 'monopole_status';
  static const String mast1Height = 'mast_1_height';
  static const String mast2Height = 'mast_2_height';
  static const String mast3Height = 'mast_3_height';
  static const String tower1Height = 'tower_1_height';
  static const String tower2Height = 'tower_2_height';
  static const String monopoleHeight = 'monopole_height';

  static const String sites = 'sites';
  static const String towerInformations = 'tower_informations';
  static const String bandInformations = 'band_informations';
  static const String generatorInformations = 'generator_informations';
  static const String solarWindInformations = 'solar_wind_informations';
  static const String rectifierInformations = 'rectifier_informations';
  static const String environmentInformations = 'environment_informations';
  static const String lvdpInformations = 'lvdp_informations';
  static const String amperesInformations = 'amperes_informations';
  static const String tcuInformations = 'tcu_informations';
  static const String fiberInformations = 'fiber_informations';
  static const String siteImages = 'site_images';
  static const String siteAdditionalImages = 'site_additional_images';
  static const String towerImages = 'towerImages';
  static const String bandImages = 'bandImages';
  static const String solarImages = 'solarImages';
  static const String rectifierImages = 'rectifierImages';
  static const String batteryImages = 'batteryImages';
}

class CacheKey {
  static const String accessToken = "accessToken";
  static const String user = "user";
}

class RequestKeys {
  static const String sites = "sites";
  static const String name = "name";
  static const String code = "code";
  static const String governorate = "governorate";
  static const String street = "street";
  static const String area = "area";
  static const String city = "city";
  static const String type = "type";
  static const String gsm1900 = "gsm1900";
  static const String gsm1800 = "gsm1800";
  static const String threeG = "3g";
  static const String lte = "lte";
  static const String generator = "generator";
  static const String powerControlOwnership = 'power_control_ownership';
  static const String solar = "solar";
  static const String wind = "wind";
  static const String grid = "grid";
  static const String fence = "fence";
  static const String cabinetNumber = "cabinet_number";
  static const String cabinetCage = "cabinet_cage";
  static const String electricityMeter = "electricity_meter";
  static const String electricityMeterReading = "electricity_meter_reading";
  static const String generatorRemark = "generator_remark";
  static const String towerInformations = "tower_informations";
  static const String batteriesCabinetType = 'batteries_cabinet_type';
  static const String mast = "mast";
  static const String tower = "tower";
  static const String monopole = "monopole";
  static const String mastNumber = "mast_number";
  static const String mastStatus = "mast_status";
  static const String monopoleNumber = "monopole_number";
  static const String monopoleStatus = "monopole_status";
  static const String towerNumber = "tower_number";
  static const String towerStatus = "tower_status";
  static const String beaconStatus = "beacon_status";
  static const String mast1Height = "mast_1_height";
  static const String mast2Height = "mast_2_height";
  static const String mast3Height = "mast_3_height";
  static const String monopoleHeight = "monopole_height";
  static const String tower1Height = "tower_1_height";
  static const String tower2Height = "tower_2_height";
  static const String remarks = "remarks";
  static const String bandInformations = "band_informations";
  static const String bandType = "band_type";
  static const String rbs1Type = "rbs_1_type";
  static const String du1Type = "du_1_type";
  static const String ru1Type = "ru_1_type";
  static const String rbs2Type = "rbs_2_type";
  static const String du2Type = "du_2_type";
  static const String ru2Type = "ru_2_type";
  static const String generatorInformations = "generator_informations";
  static const String genTypeAndCapacity = "gen_type_and_capacity";
  static const String genHourMeter = "gen_hour_meter";
  static const String genFuelConsumption = "gen_fuel_consumption";
  static const String internalCage = 'internal_cage';
  static const String externalCage = 'external_cage';
  static const String externalCapacity = 'external_capacity';
  static const String externalExistingFuel = 'external_existing_fuel';
  static const String internalCapacity = "internal_capacity";
  static const String internalExistingFuel = "internal_existing_fuel";
  static const String fuelSensorExiting = "fuel_sensor_exiting";
  static const String fuelSensorWorking = "fuel_sensor_working";
  static const String fuelSensorType = "fuel_sensor_type";
  static const String ampereToOwner = "ampere_to_owner";
  static const String circuitBreakersQuantity = "circuit_breakers_quantity";
  static const String solarWindInformations = "solar_wind_informations";
  static const String solarType = "solar_type";
  static const String solarCapacity = "solar_capacity";
  static const String numberOfPanels = "number_of_panels";
  static const String numberOfModules = "number_of_modules";
  static const String numberOfFaultyModules = "number_of_faulty_modules";
  static const String numberOfBatteries = "number_of_batteries";
  static const String batteryType = "battery_type";
  static const String batteryStatus = "battery_status";
  static const String windRemarks = "wind_remarks";
  static const String rectifierInformations = "rectifier_informations";
  static const String rectifier1TypeAndVoltage = "rectifier_1_type_and_voltage";
  static const String earthingSystem = "earthing_system";
  // static const String numberOfBatteries = "number_of_batteries";

  static const String module1Quantity = "module_1_quantity";
  static const String faultyModule1Quantity = "faulty_module_1_quantity";
  static const String rectifier2TypeAndVoltage = "rectifier_2_type_and_voltage";
  static const String module2Quantity = "module_2_quantity";
  static const String faultyModule2Quantity = "faulty_module_2_quantity";
  static const String environmentInformations = "environment_informations";
  static const String batteriesStatus = "batteries_status";
  static const String powerControlSerialNumber = "power_control_serial_number";
  static const String ampereConsumption = "ampere_consumption";
  static const String threePhase = "three_phase";
  static const String miniPhase = "mini_phase";
  static const String fanQuantity = "fan_quantity";
  static const String faultyFanQuantity = "faulty_fan_quantity";
  static const String stabilizerQuantity = 'stabilizer_quantity';
  static const String stabilizerType = 'stabilizer_type';
  static const String airConditioner1Type = "air_conditioner_1_type";
  static const String airConditioner2Type = "air_conditioner_2_type";
  static const String fireSystem = "fire_system";
  static const String lvdpInformations = "lvdp_informations";
  static const String exiting = "exiting";
  static const String working = "working";
  static const String status = "status";
  static const String amperesInformations = "amperes_informations";
  static const String capacity = "capacity";
  static const String time = "time";
  static const String cableLength = "cable_length";
  static const String details = "details";
  static const String tcuInformations = "tcu_informations";
  static const String tcu = "tcu";
  static const String tcuTypes = "tcu_types";
  static const String fiberInformations = "fiber_informations";
  static const String destination = "destination";
  static const String remark = "remark";
  static const generalSiteImages = "general_site_images";
  static const rectifierImages = "rectifier_images";
  static const additionalImages = "additional_images";
  static const rectifierBatteriesImages = "rectifier_batteries_images";
  static const rbsImages = "rbs_images";
  static const solarAndWindBatteriesImages = "solar_and_wind_batteries_images";
  static const generatorImages = "generator_images";
  static const transmissionImages = "transmission_images";
  static const fuelCageImages = "fuel_cage_images";
}
