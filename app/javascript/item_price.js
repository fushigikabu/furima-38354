window.addEventListener('load',() =>{
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    taxPrice = inputValue * 0.1
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(taxPrice)
    const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = inputValue - Math.floor(taxPrice)
  })
})