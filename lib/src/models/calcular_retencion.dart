double calculoRetencionMensual(double sueldo, double subsidio) {
  double excedenteLimiteInferior;
  double isrMarginal;
  double cuotaFija;
  double impuestoPrevio;
  if (sueldo >= 0.01 && sueldo <= 746.04) {
    excedenteLimiteInferior = sueldo - 0.01;
    isrMarginal = excedenteLimiteInferior * 0.0192;
    cuotaFija = 0.00;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else if (sueldo >= 746.05 && sueldo <= 6332.05) {
    excedenteLimiteInferior = sueldo - 746.05;
    isrMarginal = excedenteLimiteInferior * 0.064;
    cuotaFija = 14.32;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else if (sueldo >= 6332.06 && sueldo <= 11128.01) {
    excedenteLimiteInferior = sueldo - 6332.06;
    isrMarginal = excedenteLimiteInferior * 0.1088;
    cuotaFija = 371.83;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else if (sueldo >= 11128.02 && sueldo <= 12935.82) {
    excedenteLimiteInferior = sueldo - 11128.02;
    isrMarginal = excedenteLimiteInferior * 0.16;
    cuotaFija = 893.63;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else if (sueldo >= 12935.83 && sueldo <= 15487.71) {
    excedenteLimiteInferior = sueldo - 12935.83;
    isrMarginal = excedenteLimiteInferior * 0.1792;
    cuotaFija = 1182.88;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else if (sueldo >= 15487.72 && sueldo <= 31236.49) {
    excedenteLimiteInferior = sueldo - 15487.72;
    isrMarginal = excedenteLimiteInferior * 0.2136;
    cuotaFija = 1640.18;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else if (sueldo >= 31236.50 && sueldo <= 49233.00) {
    excedenteLimiteInferior = sueldo - 31236.50;
    isrMarginal = excedenteLimiteInferior * 0.2352;
    cuotaFija = 5004.12;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else if (sueldo >= 49233.01 && sueldo <= 93993.90) {
    excedenteLimiteInferior = sueldo - 49233.01;
    isrMarginal = excedenteLimiteInferior * .3;
    cuotaFija = 9236.89;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else if (sueldo >= 93993.91 && sueldo <= 125325.20) {
    excedenteLimiteInferior = sueldo - 93993.91;
    isrMarginal = excedenteLimiteInferior * 0.32;
    cuotaFija = 22665.17;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else if (sueldo >= 125325.21 && sueldo <= 375975.61) {
    excedenteLimiteInferior = sueldo - 125325.21;
    isrMarginal = excedenteLimiteInferior * 0.34;
    cuotaFija = 32691.18;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else {
    excedenteLimiteInferior = sueldo - 375975.62;
    isrMarginal = excedenteLimiteInferior * 0.35;
    cuotaFija = 117912.32;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  }
}

double calculoRetencionQuincenal(double sueldo, double subsidio) {
  double excedenteLimiteInferior;
  double isrMarginal;
  double cuotaFija;
  double impuestoPrevio;
  if (sueldo >= 0.01 && sueldo <= 368.10) {
    excedenteLimiteInferior = sueldo - 0.01;
    isrMarginal = excedenteLimiteInferior * 0.0192;
    cuotaFija = 0.00;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else if (sueldo >= 368.11 && sueldo <= 3124.35) {
    excedenteLimiteInferior = sueldo - 368.11;
    isrMarginal = excedenteLimiteInferior * 0.064;
    cuotaFija = 7.05;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else if (sueldo >= 3124.36 && sueldo <= 5490.75) {
    excedenteLimiteInferior = sueldo - 3124.36;
    isrMarginal = excedenteLimiteInferior * 0.1088;
    cuotaFija = 183.45;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else if (sueldo >= 5490.76 && sueldo <= 6382.80) {
    excedenteLimiteInferior = sueldo - 5490.76;
    isrMarginal = excedenteLimiteInferior * 0.16;
    cuotaFija = 441.00;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else if (sueldo >= 6382.81 && sueldo <= 7641.90) {
    excedenteLimiteInferior = sueldo - 6382.81;
    isrMarginal = excedenteLimiteInferior * 0.1792;
    cuotaFija = 583.65;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else if (sueldo >= 7641.91 && sueldo <= 15412.80) {
    excedenteLimiteInferior = sueldo - 7641.91;
    isrMarginal = excedenteLimiteInferior * 0.2136;
    cuotaFija = 809.25;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else if (sueldo >= 15412.80 && sueldo <= 24292.65) {
    excedenteLimiteInferior = sueldo - 15412.80;
    isrMarginal = excedenteLimiteInferior * 0.2352;
    cuotaFija = 2469.15;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else if (sueldo >= 24292.66 && sueldo <= 46378.50) {
    excedenteLimiteInferior = sueldo - 24292.66;
    isrMarginal = excedenteLimiteInferior * .3;
    cuotaFija = 4557.75;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else if (sueldo >= 46378.51 && sueldo <= 61838.10) {
    excedenteLimiteInferior = sueldo - 46378.51;
    isrMarginal = excedenteLimiteInferior * 0.32;
    cuotaFija = 11183.40;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else if (sueldo >= 61838.11 && sueldo <= 185514.30) {
    excedenteLimiteInferior = sueldo - 61838.11;
    isrMarginal = excedenteLimiteInferior * 0.34;
    cuotaFija = 16130.55;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else {
    excedenteLimiteInferior = sueldo - 185514.31;
    isrMarginal = excedenteLimiteInferior * 0.35;
    cuotaFija = 58180.35;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  }
}

double calculoRetencionDiario(double sueldo, double subsidio) {
  double excedenteLimiteInferior;
  double isrMarginal;
  double cuotaFija;
  double impuestoPrevio;
  if (sueldo >= 0.01 && sueldo <= 24.54) {
    excedenteLimiteInferior = sueldo - 0.01;
    isrMarginal = excedenteLimiteInferior * 0.0192;
    cuotaFija = 0.00;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else if (sueldo >= 24.54 && sueldo <= 208.29) {
    excedenteLimiteInferior = sueldo - 24.54;
    isrMarginal = excedenteLimiteInferior * 0.064;
    cuotaFija = 0.47;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else if (sueldo >= 208.30 && sueldo <= 366.05) {
    excedenteLimiteInferior = sueldo - 208.30;
    isrMarginal = excedenteLimiteInferior * 0.1088;
    cuotaFija = 12.23;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else if (sueldo >= 366.06 && sueldo <= 425.52) {
    excedenteLimiteInferior = sueldo - 366.06;
    isrMarginal = excedenteLimiteInferior * 0.16;
    cuotaFija = 29.40;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else if (sueldo >= 425.53 && sueldo <= 509.46) {
    excedenteLimiteInferior = sueldo - 425.53;
    isrMarginal = excedenteLimiteInferior * 0.1792;
    cuotaFija = 38.91;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else if (sueldo >= 509.47 && sueldo <= 1027.52) {
    excedenteLimiteInferior = sueldo - 509.47;
    isrMarginal = excedenteLimiteInferior * 0.2136;
    cuotaFija = 53.95;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else if (sueldo >= 1027.53 && sueldo <= 1619.51) {
    excedenteLimiteInferior = sueldo - 1027.53;
    isrMarginal = excedenteLimiteInferior * 0.2352;
    cuotaFija = 164.61;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else if (sueldo >= 1619.52 && sueldo <= 3091.90) {
    excedenteLimiteInferior = sueldo - 1619.52;
    isrMarginal = excedenteLimiteInferior * .3;
    cuotaFija = 303.85;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else if (sueldo >= 3091.91 && sueldo <= 4122.54) {
    excedenteLimiteInferior = sueldo - 3091.91;
    isrMarginal = excedenteLimiteInferior * 0.32;
    cuotaFija = 745.56;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else if (sueldo >= 4122.55 && sueldo <= 12367.62) {
    excedenteLimiteInferior = sueldo - 4122.55;
    isrMarginal = excedenteLimiteInferior * 0.34;
    cuotaFija = 1075.37;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else {
    excedenteLimiteInferior = sueldo - 12367.63;
    isrMarginal = excedenteLimiteInferior * 0.35;
    cuotaFija = 3878.69;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  }
}
