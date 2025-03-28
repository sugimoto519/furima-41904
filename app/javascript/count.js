const count = () => {
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  itemPrice.addEventListener("input", () => {
    const fee = itemPrice.value / 10
    addTaxPrice.innerText = Math.floor(fee);
    profit.innerText = itemPrice.value - addTaxPrice.innerText;
  });
};


window.addEventListener(`turbo:load`, count);
window.addEventListener(`turbo:render`, count);
