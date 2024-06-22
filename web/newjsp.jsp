<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Color and Size Selector</title>
</head>
<body>

<button class="color-option" data-color-id="1">Red</button>
<button class="color-option" data-color-id="2">Blue</button>

<button class="size-option" data-group-color="1" style="display: none;">Size 8</button>
<button class="size-option" data-group-color="1" style="display: none;">Size 9</button>
<button class="size-option" data-group-color="2" style="display: none;">Size 10</button>
<button class="size-option" data-group-color="2" style="display: none;">Size 11</button>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const colorButtons = document.querySelectorAll('.color-option');
        const sizeButtons = document.querySelectorAll('.size-option');

        colorButtons.forEach(button => {
            button.addEventListener('click', function () {
                const colorId = this.getAttribute('data-color-id');

                // Hide all size buttons
                sizeButtons.forEach(sizeButton => {
                    sizeButton.style.display = 'none';
                });

                // Show size buttons that match the selected color
                sizeButtons.forEach(sizeButton => {
                    if (sizeButton.getAttribute('data-group-color') === colorId) {
                        sizeButton.style.display = 'inline-block';
                    }
                });
            });
        });
    });
</script>

</body>
</html>
