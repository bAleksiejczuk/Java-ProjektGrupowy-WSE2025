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

  const container = document.querySelector('.search-container');
  const input = document.querySelector('.search-input');
  const spinners = document.querySelectorAll('.spinner');
  const form = document.querySelector('.search-container');

  if (input && form) {
    // Obsługa Enter w polu wyszukiwania
    input.addEventListener('keydown', function (e) {
      if (e.key === 'Enter' && input.value.trim() !== '') {
        e.preventDefault(); // Zapobiega domyślnemu zachowaniu

        // Uruchom animację spinnera
        spinners.forEach(spinner => {
          spinner.classList.add('fast-pulse');
          spinner.style.animationPlayState = 'running';
        });

        // Prześlij formularz
        setTimeout(() => {
          form.submit();
        }, 100); // Małe opóźnienie dla animacji

        // Zatrzymaj animację po czasie
        setTimeout(() => {
          spinners.forEach(spinner => {
            spinner.classList.remove('fast-pulse');
          });
        }, 1000);
      }
    });

    // Obsługa przycisku "Szukaj"
    const submitBtn = form.querySelector('button[type="submit"]');
    if (submitBtn) {
      submitBtn.addEventListener('click', function(e) {
        if (input.value.trim() !== '') {
          // Uruchom animację spinnera
          spinners.forEach(spinner => {
            spinner.classList.add('fast-pulse');
            spinner.style.animationPlayState = 'running';
          });

          // Zatrzymaj animację po czasie
          setTimeout(() => {
            spinners.forEach(spinner => {
              spinner.classList.remove('fast-pulse');
            });
          }, 1000);
        }
      });
    }
  }

  // Obsługa hover na kontenerze wyszukiwania
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

  // Dark Mode functionality
  const wrapper = document.getElementById('wrapper');
  const darkModeBtn = document.getElementById('darkModeBtn');

  if (!wrapper) return;

  function enableDarkMode() {
    document.documentElement.setAttribute('data-theme', 'dark');
    wrapper.classList.add('dark-mode');
    localStorage.setItem('darkMode', 'enabled');

    if (darkModeBtn) {
      darkModeBtn.innerHTML = '<img src="images/sun.png" alt="Słońce" class="sun" title="Słońce">';
    }
  }

  function disableDarkMode() {
    document.documentElement.setAttribute('data-theme', 'light');
    wrapper.classList.remove('dark-mode');
    localStorage.setItem('darkMode', 'disabled');

    if (darkModeBtn) {
      darkModeBtn.innerHTML = '<img src="images/moon.png" alt="Księżyc" class="moon" title="Księżyc">';
    }
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

// Obsługa usuwania linków
document.querySelectorAll('.cross').forEach(el => {
  el.addEventListener('click', function () {
    const id = this.dataset.id; // np. ID obiektu do usunięcia

    if (confirm("Czy na pewno chcesz usunąć ten link?")) {
      // Możesz tu wysłać zapytanie do backendu
      // przykład: przekierowanie (GET):
      // window.location.href = `/usun?id=${id}`;

      // przykład: fetch (POST):
      fetch('/usun', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ id: id })
      })
      .then(response => {
        if (response.ok) {
          alert("Usunięto!");
          // np. usuń element z DOM:
          this.closest('.element').remove();
        } else {
          alert("Błąd podczas usuwania.");
        }
      })
      .catch(error => {
        console.error('Błąd:', error);
        alert("Błąd podczas usuwania.");
      });
    }
  });
});
