const price = () => {
  const priceInput = document.getElementById("item-price")
  const addTaxDom = document.getElementById("add-tax-price")
  const addProfitDom = document.getElementById("profit")


  const calculate = () => {
    const inputValue = priceInput.value
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
    addProfitDom.innerHTML = inputValue - Math.floor(inputValue * 0.1)
  }

  calculate();

  priceInput.addEventListener("input", () => {
    priceInput.value = priceInput.value.replace(/[^0-9]/g, "");
  });
  priceInput.addEventListener("input",calculate)


};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);