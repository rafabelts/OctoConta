double calculoSubsidio(double conversionSueldo) {
  if (conversionSueldo >= 0.01 && conversionSueldo <= 58.19) {
    return 13.39;
  } else if (conversionSueldo >= 58.20 && conversionSueldo <= 87.28) {
    return 13.38;
  } else if (conversionSueldo >= 87.29 && conversionSueldo <= 114.24) {
    return 13.38;
  } else if (conversionSueldo >= 114.25 && conversionSueldo <= 116.38) {
    return 12.92;
  } else if (conversionSueldo >= 116.39 && conversionSueldo <= 146.25) {
    return 12.58;
  } else if (conversionSueldo >= 146.26 && conversionSueldo <= 155.17) {
    return 11.65;
  } else if (conversionSueldo >= 155.18 && conversionSueldo <= 175.51) {
    return 10.69;
  } else if (conversionSueldo >= 175.52 && conversionSueldo <= 204.76) {
    return 9.69;
  } else if (conversionSueldo >= 204.77 && conversionSueldo <= 234.01) {
    return 8.34;
  } else if (conversionSueldo >= 234.02 && conversionSueldo <= 242.84) {
    return 7.16;
  } else if (conversionSueldo >= 242.85) {
    return 0;
  } else {
    return 0;
  }
}
