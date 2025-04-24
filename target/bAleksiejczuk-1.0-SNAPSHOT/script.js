const scrollToTopBtn = document.getElementById("top-btn");

window.addEventListener("scroll", () => {
    const scrollTrigger = 200;
    const offsetBottom = 60;

    if (window.scrollY > scrollTrigger) {
        scrollToTopBtn.classList.add("show");
    } else {
        scrollToTopBtn.classList.remove("show");
    }

    const scrollPosition = window.scrollY + window.innerHeight;
    const pageHeight = document.documentElement.scrollHeight;
    const distanceToBottom = pageHeight - scrollPosition;

    if (distanceToBottom < offsetBottom) {
        scrollToTopBtn.style.bottom = `${offsetBottom + (100 - distanceToBottom)}px`;
    } else {
        scrollToTopBtn.style.bottom = `${offsetBottom}px`;
    }
});

scrollToTopBtn.addEventListener("click", () => {
    window.scrollTo({
        top: 0,
        behavior: "smooth"
    });
});

document.addEventListener("DOMContentLoaded", function () {
    const logo = document.getElementById("logo");

    logo.classList.add("rotate-on-load");

    logo.addEventListener("animationend", function () {
        logo.classList.remove("rotate-on-load");
    });
});

