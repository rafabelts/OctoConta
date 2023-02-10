double calculoIsr(double conversionSueldo, double subsidio) {
  double excedenteLimiteInferior;
  double isrMarginal;
  double cuotaFija;
  double impuestoPrevio;
  if (conversionSueldo >= 0.01 && conversionSueldo <= 24.54) {
    excedenteLimiteInferior = conversionSueldo - 0.01;
    isrMarginal = excedenteLimiteInferior * 0.0192;
    cuotaFija = 0.00;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else if (conversionSueldo >= 24.54 && conversionSueldo <= 208.29) {
    excedenteLimiteInferior = conversionSueldo - 24.54;
    isrMarginal = excedenteLimiteInferior * 0.064;
    cuotaFija = 0.47;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else if (conversionSueldo >= 208.30 && conversionSueldo <= 366.05) {
    excedenteLimiteInferior = conversionSueldo - 208.30;
    isrMarginal = excedenteLimiteInferior * 0.1088;
    cuotaFija = 12.23;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else if (conversionSueldo >= 366.06 && conversionSueldo <= 425.52) {
    excedenteLimiteInferior = conversionSueldo - 366.06;
    isrMarginal = excedenteLimiteInferior * 0.16;
    cuotaFija = 29.40;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else if (conversionSueldo >= 425.53 && conversionSueldo <= 509.46) {
    excedenteLimiteInferior = conversionSueldo - 425.53;
    isrMarginal = excedenteLimiteInferior * 0.1792;
    cuotaFija = 38.91;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else if (conversionSueldo >= 509.47 && conversionSueldo <= 1027.52) {
    excedenteLimiteInferior = conversionSueldo - 509.47;
    isrMarginal = excedenteLimiteInferior * 0.2136;
    cuotaFija = 53.95;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else if (conversionSueldo >= 1027.53 && conversionSueldo <= 1619.51) {
    excedenteLimiteInferior = conversionSueldo - 1027.53;
    isrMarginal = excedenteLimiteInferior * 0.2352;
    cuotaFija = 164.61;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else if (conversionSueldo >= 1619.52 && conversionSueldo <= 3091.90) {
    excedenteLimiteInferior = conversionSueldo - 1619.52;
    isrMarginal = excedenteLimiteInferior * .3;
    cuotaFija = 303.85;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else if (conversionSueldo >= 3091.91 && conversionSueldo <= 4122.54) {
    excedenteLimiteInferior = conversionSueldo - 3091.91;
    isrMarginal = excedenteLimiteInferior * 0.32;
    cuotaFija = 745.56;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else if (conversionSueldo >= 4122.55 && conversionSueldo <= 12367.62) {
    excedenteLimiteInferior = conversionSueldo - 4122.55;
    isrMarginal = excedenteLimiteInferior * 0.34;
    cuotaFija = 1075.37;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else if (conversionSueldo >= 12367.63) {
    excedenteLimiteInferior = conversionSueldo - 12367.63;
    isrMarginal = excedenteLimiteInferior * 0.35;
    cuotaFija = 3878.69;
    impuestoPrevio = isrMarginal + cuotaFija;
    return impuestoPrevio - subsidio;
    //
  } else {
    return 0;
  }
}
