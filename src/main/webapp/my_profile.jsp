<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">

<head>
    <meta charset="UTF-8">
    <title>TopLinker - mój profil</title>

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
            <header>Twój profil w <a id="top-linker" href="index.jsp" title="TopLinker czyli aplikacja do topowych linków!"><span id="top">Top</span><span id="linker">Linker</span></a> !</header>
            <div id="desc">Czy wiedziałeś, że możesz dodawać nieskończenie wiele linków?</div>
            <div id="content">
                <form id="edit-form">
                    <h2>Edytuj dane logowania</h2>

                    <div class="form-group">
                        <input autocomplete="off" class="login-input" type="text" id="login" name="login" placeholder="Wprowadź nowy login" required>
                    </div>

                    <div class="form-group">
                        <input class="login-input" type="password" id="password" name="password" placeholder="Wprowadź stare hasło" required>
                    </div>

                    <div class="form-group">
                        <input class="login-input" type="password" id="password" name="new-password" placeholder="Wprowadź nowe hasło" required>
                    </div>

                    <button class="btn-2" type="submit">Zapisz zmiany</button>
                </form>
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
