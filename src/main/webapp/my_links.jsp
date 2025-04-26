<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pl">

<head>
    <meta charset="UTF-8">
    <title>TopLinker - moje linki</title>

    <meta name="description" content="Link to coś co często klikamy i wszyscy lubimy. To co jest w linkach może być śmieszne, ciekawe, interesujące, przerażające, czy też smutne. Linki są super!">
    <meta name="authors" content="Jakub Hryniewicki, Małgorzata Kulik, Brunon Aleksiejczuk">

    <link rel="stylesheet" href="static/style.css">
    <link rel="icon" type="image/png" href="images/linksIcon.png" sizes="48x48">
    <script src="static/script.js" defer></script>
</head>

<body>
<div id="wrapper">
    <nav id="menu">
        <div id="inner-menu">
            <div id="left-side-nav">
                <a href="index.jsp"><img src="images/linksIcon.png" alt="Logo aplikacji" id="logo" title="TopLinker"></a>
                <h2 id="welcome">Cześć, <a href="my_profile.jsp" id="username"><span id="linkers-name" title="Imię godne prawdziwego linkera!">Imie</span><!--Niech wstawia session name/login--></a><span class="i s12 y"> !</span></h2>
            </div>
            <div id="buttons">
                <a class="btn b" href="index.jsp"><span id="main-btn">Strona Główna</span></a>
                <a class="btn b" href="leadboard.jsp"><span id="rank-btn">Ranking</span></a>
                <a class="btn b" href="my_links.jsp"><span id="my-links-btn">Moje Linki</span></a>
                <a class="btn b" href="add_link.jsp"><span id="add-link-btn">Dodaj Link</span></a>
                <a class="btn b" href="login.jsp"><span id="login-btn">Logowanie</span></a>
            </div>
            <div id="right-side-nav">
                <a href="my_profile.jsp"><img src="images/myselficon.png" alt="Mój profil" id="myself" title="Mój profil"></a>
                <div id="darkModeBtn" >
                    <img src="static/moon.png" alt="Księżyc" class="moon" title="Księżyc">
                </div>
                <form id="logout-form" action="logout"> <!-- Tylko jeśli użytkownik jest zalogowany -->
                    <input class="b" type="submit" value="Wyloguj">
                </form>
            </div>
        </div>
    </nav>

    <main>
        <div id="inner-main">
            <header>Dodane przez Ciebie do <a id="top-linker" href="index.jsp" title="TopLinker czyli aplikacja do topowych linków!"><span id="top">Top</span><span id="linker">Linker</span></a> !</header>
            <div id="desc">Czy wiedziałeś, że ta apka powstała jako prosty projekt na studia?</div>
            <div id="content">
                <div class="search-container">
                    <img src="images/spinner.png" alt="spinner" class="spinner" title="Koło zębate">
                    <input type="text" placeholder="Wyszukaj..." class="search-input" />
                    <img src="images/spinner.png" alt="spinner" class="spinner" title="Koło zębate">
                </div>
                <div id="google-link"><a href="https://www.google.pl/?hl=pl" target="_blank" rel="noopener noreferrer" title="Google :P">https://www.google.pl/</a></div>
            </div>
            <div id="my-link-section">
                <div id="my-links-list">
                    <div class="link-container">
                        <a href="https://www.youtube.com/watch?v=G4prvYCbe8E" class="link1" target="_blank" rel="noopener noreferrer" title="A tu może być opis tego linku">
                            <img src="images/top1.png" alt="Top1" id="medal1" title="Złoto!">
                            <span class="link">
                    <span class="rank">1. </span>
                    https://www.youtube.com/watch?v=G4prvYCbe8E
                  </span>
                            <span class="likes">Polubienia: 
                      <span class="like-count">1</span>
                    </span>
                        </a>
                    </div>
                    <div class="link-container"><a href="https://www.youtube.com/watch?v=G4prvYCbe8E" class="link2" target="_blank" rel="noopener noreferrer" title="A tu może być opis tego linku"><img src="images/top2.png" alt="Top2" id="medal2" title="Srebro!"><span class="link"><span class="rank">2. </span>https://www.youtube.com/watch?v=G4prvYCbe8E1</span><span class="likes">Polubienia: <span class="like-count">1</span></span></a></div>
                    <div class="link-container"><a href="https://www.youtube.com/watch?v=G4prvYCbe8E" class="link3" target="_blank" rel="noopener noreferrer" title="A tu może być opis tego linku"><img src="images/top3.png" alt="Top3" id="medal3" title="Brąz!"><span class="link"><span class="rank">3. </span>https://www.youtube.com/watch?v=G4prvYCbe8E12</span><span class="likes">Polubienia: <span class="like-count">22</span></span></a></div>
                    <div class="link-container"><a href="https://www.youtube.com/watch?v=G4prvYCbe8E" class="link4" target="_blank" rel="noopener noreferrer" title="A tu może być opis tego linku"><span class="link"><span class="rank">4. </span>https://www.youtube.com/watch?v=G4prvYCbe8E123</span><span class="likes">Polubienia: <span class="like-count">2</span></span></a></div>
                    <div class="link-container"><a href="https://www.youtube.com/watch?v=G4prvYCbe8E" class="link5" target="_blank" rel="noopener noreferrer" title="A tu może być opis tego linku"><span class="link"><span class="rank">5. </span>https://www.youtube.com/watch?v=G4prvYCbe8E1234</span><span class="likes">Polubienia: <span class="like-count">2</span></span></a></div>
                    <div class="link-container"><a href="https://www.youtube.com/watch?v=G4prvYCbe8E" class="link6" target="_blank" rel="noopener noreferrer" title="A tu może być opis tego linku"><span class="link"><span class="rank">6. </span>https://www.youtube.com/watch?v=G4prvYCbe8E12345</span><span class="likes">Polubienia: <span class="like-count">2</span></span></a></div>
                    <div class="link-container"><a href="https://www.youtube.com/watch?v=G4prvYCbe8E" class="link7" target="_blank" rel="noopener noreferrer" title="A tu może być opis tego linku"><span class="link"><span class="rank">7. </span>https://www.youtube.com/watch?v=G4prvYCbe8E123456</span><span class="likes">Polubienia: <span class="like-count">2</span></span></a></div>
                    <div class="link-container"><a href="https://www.youtube.com/watch?v=G4prvYCbe8E" class="link1" target="_blank" rel="noopener noreferrer" title="A tu może być opis tego linku"><span class="link"><span class="rank">8. </span>https://www.youtube.com/watch?v=G4prvYCbe8E</span><span class="likes">Polubienia: <span class="like-count">2</span></span></a></div>
                    <div class="link-container"><a href="https://www.youtube.com/watch?v=G4prvYCbe8E" class="link2" target="_blank" rel="noopener noreferrer" title="A tu może być opis tego linku"><span class="link"><span class="rank">9. </span>https://www.youtube.com/watch?v=G4prvYCbe8E1</span><span class="likes">Polubienia: <span class="like-count">2</span></span></a></div>
                    <div class="link-container"><a href="https://www.youtube.com/watch?v=G4prvYCbe8E" class="link3" target="_blank" rel="noopener noreferrer" title="A tu może być opis tego linku"><span class="link"><span class="rank">10. </span>https://www.youtube.com/watch?v=G4prvYCbe8E12</span><span class="likes">Polubienia: <span class="like-count">2</span></span></a></div>
                    <div class="link-container"><a href="https://www.youtube.com/watch?v=G4prvYCbe8E" class="link4" target="_blank" rel="noopener noreferrer" title="A tu może być opis tego linku"><span class="link"><span class="rank">11. </span>https://www.youtube.com/watch?v=G4prvYCbe8E123</span><span class="likes">Polubienia: <span class="like-count">2</span></span></a></div>
                    <div class="link-container"><a href="https://www.youtube.com/watch?v=G4prvYCbe8E" class="link5" target="_blank" rel="noopener noreferrer" title="A tu może być opis tego linku"><span class="link"><span class="rank">12. </span>https://www.youtube.com/watch?v=G4prvYCbe8E1234</span><span class="likes">Polubienia: <span class="like-count">2</span></span></a></div>
                    <div class="link-container"><a href="https://www.youtube.com/watch?v=G4prvYCbe8E" class="link6" target="_blank" rel="noopener noreferrer" title="A tu może być opis tego linku"><span class="link"><span class="rank">13. </span>https://www.youtube.com/watch?v=G4prvYCbe8E12345</span><span class="likes">Polubienia: <span class="like-count">2</span></span></a></div>
                    <div class="link-container"><a href="https://www.youtube.com/watch?v=G4prvYCbe8E" class="link7" target="_blank" rel="noopener noreferrer" title="A tu może być opis tego linku"><span class="link"><span class="rank">14. </span>Tu zamiast linku może być też nazwa linku</span><span class="likes">Polubienia: <span class="like-count">2</span></span></a></div>
                </div>
            </div>
        </div>
    </main>

    <footer>
        <div id="inner-footer">
            <div id="ppl">
                <a class="git-link btn b" href="https://github.com/bAleksiejczuk" title="Twórca backendu!" target="_blank" rel="noopener noreferrer">
                    <span class="name" id="ba">Brunon Aleksiejczuk</span>
                    <span class="gh">Git<span class="hub">Hub</span></span>
                </a>
                <a class="git-link btn b" href="https://github.com/malkul25" title="Tester, grafik i człowiek od zadań specjalnych!" target="_blank" rel="noopener noreferrer">
                    <span class="name" id="mk">Małgorzata Kulik</span>
                    <span class="gh">Git<span class="hub">Hub</span></span>
                </a>
                <a class="git-link btn b" href="https://github.com/Kubbix12" title="Twórca frontendu!" target="_blank" rel="noopener noreferrer">
                    <span class="name" id="jh">Jakub Hryniewicki</span>
                    <span class="gh">Git<span class="hub">Hub</span></span>
                </a>
            </div>
            <div id="java-project">
                <a class="repository" href="https://github.com/bAleksiejczuk/Java-ProjektGrupowyWSE2025" target="_blank" rel="noopener noreferrer"><span title="Kliknij, aby otworzyć repozytorium na GitHubie!">Java-ProjektGrupowyWSE2025</span></a>
            </div>
            <span id="copyright" title="Wszelkie prawa zastrzeżone :)">Copyright &copy; 2025</span>
        </div>
    </footer>
</div>
<button id="top-btn" title="Na szczyt strony!">↑</button>
</body>

</html>
