/* ===== MENU ===== */
function toggleMenu() {
    document.getElementById('menu').classList.toggle('open');
}

/* ===== BOUTONS PREV / NEXT ===== */
function scroll(btn, direction) {
    // Remonter jusqu'au .carousel-wrapper, puis trouver le .cards
    const wrapper = btn.closest('.carousel-wrapper');
    const cards = wrapper.querySelector('.cards');
    cards.scrollBy({ left: direction * 520, behavior: 'smooth' });
}

/* ===== DRAG TO SCROLL sur tous les carrousels ===== */
document.querySelectorAll('.cards').forEach(slider => {
    let isDown = false;
    let startX, scrollLeft;

    slider.addEventListener('mousedown', e => {
        isDown = true;
        slider.classList.add('grabbing');
        startX = e.pageX - slider.offsetLeft;
        scrollLeft = slider.scrollLeft;
    });

    slider.addEventListener('mouseleave', () => {
        isDown = false;
        slider.classList.remove('grabbing');
    });

    slider.addEventListener('mouseup', () => {
        isDown = false;
        slider.classList.remove('grabbing');
    });

    slider.addEventListener('mousemove', e => {
        if (!isDown) return;
        e.preventDefault();
        const x = e.pageX - slider.offsetLeft;
        const walk = (x - startX) * 1.8;
        slider.scrollLeft = scrollLeft - walk;
    });

    // Support tactile (mobile)
    let touchStartX, touchScrollLeft;
    slider.addEventListener('touchstart', e => {
        touchStartX = e.touches[0].pageX;
        touchScrollLeft = slider.scrollLeft;
    });
    slider.addEventListener('touchmove', e => {
        const x = e.touches[0].pageX;
        slider.scrollLeft = touchScrollLeft - (x - touchStartX);
    });
});
