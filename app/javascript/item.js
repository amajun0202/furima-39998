function post() {
  // 価格の入力フィールドを取得
  const priceInput = document.getElementById("item-price");
  const cost = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  function updateDisplay() {
   
    const price = parseFloat(priceInput.value) || 0;
    const tax = Math.floor(price * 0.1);
    const profitValue = Math.floor(price - tax);

   
    cost.innerText = tax;
    profit.innerText = profitValue;
  }

 
  priceInput.addEventListener("input", updateDisplay);

 
  updateDisplay();
}


window.addEventListener("turbo:load", post);