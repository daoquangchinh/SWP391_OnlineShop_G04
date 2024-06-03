function togglePriceOptions() {
    var priceOptions = document.getElementById('price-options');
    var priceLabel = document.getElementById('price-range-labels');
    priceOptions.classList.toggle('collapsed');
    priceLabel.classList.toggle('collapsed');
}

function toggleSizeOptions() {
    var sizeOptions = document.querySelector('.size-options');
    sizeOptions.classList.toggle('collapsed');
}

function toggleShoeTypeOptions() {
    var shoeTypeOptions = document.querySelector('.shoe-type-options');
    shoeTypeOptions.classList.toggle('collapsed');
}

function toggleShoeColor() {
    var shoeColor = document.querySelector('.shoe-color');
    shoeColor.classList.toggle('collapsed');
}

function toggleShoeSports() {
    var shoeSports = document.querySelector('.shoe-sports');
    shoeSports.classList.toggle('collapsed');
}


