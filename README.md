# TopLinker
Aplikacja webowa do udostępniania, wyszukiwania i porządkowania linków.

Projekt umożliwia użytkownikom tworzenie kont, logowanie, dodawanie linków (publicznych/prywatnych), wyszukiwanie linków publicznych oraz przeglądanie rankingu najpopularniejszych linków na podstawie liczby polubień.

---

## Funkcje
- Rejestracja i logowanie (sesja HTTP)
- Dodawanie linków przez zalogowanego użytkownika
- „Moje linki” (publiczne i prywatne)
- Wyszukiwanie publicznych linków (fraza + opcjonalnie kategoria)
- Ranking (leadboard) najpopularniejszych linków (polubienia)
- Profil użytkownika (zmiana hasła)
- Wylogowanie

---

## Technologie
- Java (Servlety)
- JSP
- HTML / CSS
- Dane przechowywane w plikach JSON

---

## Widoki (JSP)
- index.jsp – strona główna + wyszukiwarka, interfejs zależny od sesji, tryb ciemny
- login.jsp – logowanie
- register.jsp – rejestracja
- add_link.jsp – dodawanie linku (tylko dla zalogowanych)
- my_links.jsp – lista linków zalogowanego użytkownika
- leadboard.jsp – ranking linków
- my_profile.jsp – zmiana hasła

---

## Dane (JSON)
- Użytkownicy i linki zapisywane są w plikach JSON.
- Ranking budowany jest na podstawie liczby polubień linków.

Uwaga: jeśli pliki JSON są przechowywane w konkretnym folderze (np. `data/`), warto go nie usuwać,
bo aplikacja może nie mieć danych do odczytu.


---

# Uruchomienie w IntelliJ IDEA (ważne)
Aby odpalić aplikację w IntelliJ, wykonaj poniższe kroki:

## 1) Zmień nazwy folderów (konieczne)
Zmień nazwy folderów w projekcie:

- idea → .idea
- mvn → .mvn
- smarttomcat → .smarttomcat

## 2) Zainstaluj plugin SmartTomcat (konieczne)
Do uruchomienia projektu musisz korzystać z pluginu *SmartTomcat*:
https://plugins.jetbrains.com/plugin/9492-smart-tomcat

## 3) Skonfiguruj Tomcat w IntelliJ (SmartTomcat)
1. Zainstaluj/posiadaj lokalnie Apache Tomcat (np. Tomcat 9/10).
2. W IntelliJ: Run -> Edit Configurations...
3. Dodaj konfigurację: *SmartTomcat*
4. Ustaw:
   - *Tomcat Server*: ścieżka do folderu Tomcata
   - *Deployment directory / Context path*: według ustawień projektu
   - *War / WebApp*: wybierz artefakt aplikacji
5. Uruchom konfigurację (Run).

Jeżeli po uruchomieniu nie widzisz strony, sprawdź port (np. 8080) i logi w konsoli IntelliJ.


---

## Autorzy
- Brunon Aleksiejczuk
- Jakub Hryniewicki
- Małgorzata Kulik

---

## Status
Projekt edukacyjny.
