window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = parseFloat(priceInput.value);
    console.log(inputValue);

    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    if (!isNaN(inputValue)) {
      const commissionRate = 0.1;
      const commission = Math.floor(inputValue * commissionRate);
      const profit = Math.floor(inputValue - commission);

      addTaxDom.innerHTML = `${commission}`;
      profitDom.innerHTML = `${profit}`;
    } else {
      addTaxDom.innerHTML = "無効な入力";
      profitDom.innerHTML = "無効な入力";
    }
  });
});




