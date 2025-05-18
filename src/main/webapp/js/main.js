document.addEventListener("DOMContentLoaded", function() {
    document.querySelectorAll('.sub-btn').forEach(function(button) {
        button.addEventListener('click', function() {
            let subMenu = this.nextElementSibling;
            let dropDownIcon = this.querySelector(".dropdown");

            if (subMenu && subMenu.classList.contains('sub-menu')) {
                if (subMenu.style.maxHeight) {
                    subMenu.style.maxHeight = null;
                    dropDownIcon.classList.remove("rotate");
                } else {
                    subMenu.style.maxHeight = subMenu.scrollHeight + "px";
                    dropDownIcon.classList.add("rotate");
                }
            }
        });
    });
});

document.addEventListener('DOMContentLoaded', () => {
    const subBtns = document.querySelectorAll('.sub-btn');

    subBtns.forEach(btn => {
        btn.addEventListener('click', () => {
            const item = btn.closest('.item');
            item.classList.toggle('open');
        });
    });
});
