const price = () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = Number(priceInput.value);
    const addTaxDom = document.getElementById("add-tax-price");
    const taxPrice = Math.floor(inputValue / 10);
    addTaxDom.innerHTML = taxPrice.toLocaleString("ja-JP");
    const profit = document.getElementById("profit");
    const profitValue = inputValue - taxPrice;
    profit.innerHTML = profitValue.toLocaleString("ja-JP"); 
  })
 };
 
window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);