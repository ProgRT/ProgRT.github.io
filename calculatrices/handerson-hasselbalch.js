export function pH(PCO2, HCO3=24, pKa=6.1, alpha=0.03){
  let pH = pKa + Math.log10(HCO3/(alpha * PCO2))
  return pH
}

export function PCO2(pH, HCO3, pKa=6.1, alpha=0.03){
  let pCO2 = HCO3 / (10**(pH-pKa) * alpha)
  return pCO2
}

export function HCO3(pH, PCO2, pKa=6.1, alpha=0.03){
  let HCO3 = PCO2 * 10**(pH-pKa) * alpha
  return HCO3
}
