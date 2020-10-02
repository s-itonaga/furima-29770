function SalesCommission(){

  const price = document.getElementById('item-price')
    price.addEventListener("input",() => {
    const sale = ((price.value)*0.1);
    const fee = document.getElementById('add-tax-price');
    fee.innerHTML = `${(sale.toFixed())}`;
    const profit = (price.value)*0.9;
    const prf = document.getElementById('profit');
    prf.innerHTML = `${(profit.toFixed())}`;
  });
}

window.addEventListener('load',SalesCommission)