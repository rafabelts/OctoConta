double calculoSubsidioMensual(double sueldo) {
  if (sueldo >= 0.01 && sueldo <= 1768.96) {
    return 407.02;
  } else if (sueldo >= 1768.97 && sueldo <= 2653.38) {
    return 406.83;
  } else if (sueldo >= 2653.39 && sueldo <= 3472.84) {
    return 406.62;
  } else if (sueldo >= 3472.85 && sueldo <= 3537.87) {
    return 392.77;
  } else if (sueldo >= 3537.88 && sueldo <= 4446.15) {
    return 382.46;
  } else if (sueldo >= 4446.16 && sueldo <= 4717.18) {
    return 354.23;
  } else if (sueldo >= 4717.19 && sueldo <= 5335.42) {
    return 324.87;
  } else if (sueldo >= 5335.43 && sueldo <= 6224.67) {
    return 294.63;
  } else if (sueldo >= 6224.68 && sueldo <= 7113.90) {
    return 253.54;
  } else if (sueldo >= 7113.91 && sueldo <= 7382.33) {
    return 217.61;
  } else {
    return 0;
  }
}

double calculoSubsidioQuincenal(double sueldo) {
  if (sueldo >= 0.01 && sueldo <= 872.85) {
    return 200.85;
  } else if (sueldo >= 872.86 && sueldo <= 1309.20) {
    return 200.70;
  } else if (sueldo >= 1309.21 && sueldo <= 1713.60) {
    return 200.70;
  } else if (sueldo >= 1713.61 && sueldo <= 1745.70) {
    return 193.80;
  } else if (sueldo >= 1745.71 && sueldo <= 2193.75) {
    return 188.70;
  } else if (sueldo >= 2193.76 && sueldo <= 2327.55) {
    return 174.75;
  } else if (sueldo >= 2327.56 && sueldo <= 2632.65) {
    return 160.35;
  } else if (sueldo >= 2632.66 && sueldo <= 3071.40) {
    return 145.35;
  } else if (sueldo >= 3071.41 && sueldo <= 3510.15) {
    return 125.10;
  } else if (sueldo >= 3510.16 && sueldo <= 3642.60) {
    return 107.40;
  } else {
    return 0;
  }
}

double calculoSubsidioDiario(double sueldo) {
  if (sueldo >= 0.01 && sueldo <= 58.19) {
    return 13.39;
  } else if (sueldo >= 58.20 && sueldo <= 87.28) {
    return 13.38;
  } else if (sueldo >= 87.29 && sueldo <= 114.24) {
    return 13.38;
  } else if (sueldo >= 114.25 && sueldo <= 116.38) {
    return 12.92;
  } else if (sueldo >= 116.39 && sueldo <= 146.25) {
    return 12.58;
  } else if (sueldo >= 146.26 && sueldo <= 155.17) {
    return 11.65;
  } else if (sueldo >= 155.18 && sueldo <= 175.51) {
    return 10.69;
  } else if (sueldo >= 175.52 && sueldo <= 204.76) {
    return 9.69;
  } else if (sueldo >= 204.77 && sueldo <= 234.01) {
    return 8.34;
  } else if (sueldo >= 234.02 && sueldo <= 242.84) {
    return 7.16;
  } else {
    return 0;
  }
}
