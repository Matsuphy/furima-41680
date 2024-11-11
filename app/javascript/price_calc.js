const price = () => {
  const priceInput = document.getElementById("item-price")
  const addTaxDom = document.getElementById("add-tax-price")
  const addProfitDom = document.getElementById("profit")

  const calculate = () => {
    const inputValue = priceInput.value
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
    addProfitDom.innerHTML = Math.floor(inputValue * 0.9)
  }

  calculate();

  priceInput.addEventListener("input",calculate)
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);