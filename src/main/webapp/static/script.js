const scrollToTopBtn = document.getElementById("top-btn");

window.addEventListener("scroll", () => {
    const scrollTrigger = 200;
    const offsetBottom = 70;

    if (scrollToTopBtn) {
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
    }
});

if (scrollToTopBtn) {
    scrollToTopBtn.addEventListener("click", () => {
        window.scrollTo({
            top: 0,
            behavior: "smooth"
        });
    });
}

document.addEventListener("DOMContentLoaded", function () {
    const logo = document.getElementById("logo");

    if (logo) {
        logo.classList.add("rotate-on-load");

        logo.addEventListener("animationend", function () {
            logo.classList.remove("rotate-on-load");
        });
    }

    const container = document.querySelector('.search-container');
    const input = document.querySelector('.search-input');
    const spinners = document.querySelectorAll('.spinner');

    if (input) {
        input.addEventListener('keydown', function (e) {
            if (e.key === 'Enter' && input.value.trim() !== '') {
                spinners.forEach(spinner => {
                    spinner.classList.add('fast-spin');
                    spinner.style.animationPlayState = 'running';
                });

                input.value = '';

                setTimeout(() => {
                    spinners.forEach(spinner => {
                        spinner.classList.remove('fast-spin');
                    });
                }, 1000);
            }
        });
    }

    if (container) {
        container.addEventListener('mouseleave', () => {
            spinners.forEach(spinner => {
                spinner.style.animationPlayState = 'paused';
            });
        });

        container.addEventListener('mouseenter', () => {
            spinners.forEach(spinner => {
                spinner.style.animationPlayState = 'running';
            });
        });
    }

    const wrapper = document.getElementById('wrapper');
    const darkModeBtn = document.getElementById('darkModeBtn');

    if (!wrapper) return;

    function enableDarkMode() {
        wrapper.classList.add('dark-mode');
        if (darkModeBtn) {
            darkModeBtn.innerHTML = '<img src="static/sun.png" alt="Słońce" class="sun" title="Słońce">';
        }
        localStorage.setItem('darkMode', 'enabled');
    }

    function disableDarkMode() {
        wrapper.classList.remove('dark-mode');
        if (darkModeBtn) {
            darkModeBtn.innerHTML = '<img src="static/moon.png" alt="Księżyc" class="moon" title="Księżyc">';
        }
        localStorage.setItem('darkMode', 'disabled');
    }

    if (localStorage.getItem('darkMode') === 'enabled') {
        enableDarkMode();
    } else {
        disableDarkMode();
    }

    if (darkModeBtn) {
        darkModeBtn.addEventListener('click', () => {
            if (wrapper.classList.contains('dark-mode')) {
                disableDarkMode();
            } else {
                enableDarkMode();
            }

            const img = darkModeBtn.querySelector('img');
            if (img) {
                img.classList.add('fast-spin');
                setTimeout(() => {
                    img.classList.remove('fast-spin');
                }, 1000);
            }
        });
    }
});
