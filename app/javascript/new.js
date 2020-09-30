function SalesCommission(){

  const price = document.getElementById('item-price')
  // console.log(price)
    price.addEventListener("keyup",() => {
    // console.log(price.value);
    const sale = (price.value)*0.1;
    const fee = document.getElementById('add-tax-price');
    fee.innerHTML = `${sale}`;
    const profit = (price.value)*0.9;
    const prf = document.getElementById('profit');
    prf.innerHTML = `${profit}`;
  });
}

window.addEventListener('load',SalesCommission)