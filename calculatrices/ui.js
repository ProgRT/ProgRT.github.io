export function r(
  value,
  precision = 1,
  label = "",
  unit = null,
  relative = null
) {
  let inspectClass = "observablehq--inspect";
  let numberClass = "observablehq--number";
  let labelText = label ? label + " = " : "";
  let options = {
    maximumFractionDigits: precision
  };
  if (value != null && isNaN(value) == false) {
    var formatedValue = value.toLocaleString(navigator.language, options);
    if (unit) {
      formatedValue += " " + unit;
    }
    if (relative) {
      formatedValue += ` (${Math.round((100 * value) / relative)} %)`;
    }
  } else {
    var formatedValue = "***";
  }

  //var elm = html`<span class="${inspectClass}">${labelText}<span class="${numberClass}">${formatedValue}</span> </span>`;
  var elm = document.createElement('span');
  elm.className = 'observablehq--inspect';
  elm.innerHTML= `${labelText} <span class='observablehq--number'>${formatedValue}</span>`
  elm.value = value;
  return elm;
}
