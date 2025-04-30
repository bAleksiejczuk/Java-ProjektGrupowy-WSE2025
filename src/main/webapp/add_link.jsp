<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">

<head>
<script>
    try {
      if (localStorage.getItem('darkMode') === 'enabled') {
        document.documentElement.setAttribute('data-theme', 'dark');
      }
    } catch (e) {}
  </script>
    <meta charset="UTF-8">
    <title>TopLinker - dodaj link</title>

    <meta name="description" content="Java-ProjektGrupowyWSE2025">
    <meta name="authors" content="Brunon Aleksiejczuk, Jakub Hryniewicki, Małgorzata Kulik">

    <link rel="stylesheet" href="static/style.css">
    <link rel="icon" type="image/png" href="images/linksIcon.png" sizes="48x48">
    <script src="static/script.js" defer></script>
</head>

<body>
<div id="wrapper">
    <nav id="menu">
        <div id="inner-menu">
            <div id="left-side-nav">
                <a href="index.jsp"><img src="images/linksIcon.png" alt="Logo aplikacji" id="logo"></a>
                <% if(session.getAttribute("user") != null) { %>
                <h2 id="welcome">Cześć, <a href="my_profile.jsp" id="username"><span id="linkers-name">${user.login}</span><!--Niech wstawia session name/login--></a><span class="i s12 y"> !</span></h2>
                <% } %>
            </div>
            <div id="buttons">
                <a class="btn b" href="index.jsp"><span id="main-btn">Strona Główna</span></a>
                <a class="btn b" href="leadboard.jsp"><span id="rank-btn">Ranking</span></a>

                <% if(session.getAttribute("user") != null) { %>
                <a class="btn b" href="my_links.jsp"><span id="my-links-btn">Moje Linki</span></a>
                <a class="btn b" href="add_link.jsp"><span id="add-link-btn">Dodaj Link</span></a>
                <% } else { %>
                <a class="btn b" href="login.jsp"><span id="login-btn">Logowanie</span></a>
                <% } %>
            </div>
            <div id="right-side-nav">
                <div id="darkModeBtn" >
                    <img src="static/moon.png" alt="Księżyc" class="moon">
                </div>
                <% if(session.getAttribute("user") != null) { %>
                <a href="my_profile.jsp"><img src="images/myselficon.png" alt="Mój profil" id="myself"></a>
                <form id="logout-form" action="logout">
                    <input class="b" type="submit" value="Wyloguj">
                </form>
                <% } %>
            </div>
        </div>
    </nav>

    <main>
        <div id="inner-main">
            <header>Dodaj do <a id="top-linker" href="index.jsp" ><span id="top">Top</span><span id="linker">Linker</span></a> !</header>
            <div id="content">
                <% if(session.getAttribute("user") != null) { %>
                        <div id="main-panel">
                            <form action="add-link" method="POST" id="add-link-form">
                                <label for="url">Wprowadź adres URL:</label>
                                <input autocomplete="off" type="text" id="url" name="url" class="link-input login-input" placeholder="https://www.example.com" required>

                                <label for="link_name">Nazwa linku:</label>
                                <input autocomplete="off" type="text" id="link_name" name="link_name" class="link-input login-input" placeholder="Wprowadź tytuł linku" required>

                                <!-- Checkbox do ustawienia linku jako prywatny -->
                                <label for="private_link">Ustaw link jako prywatny</label>
                                <input type="checkbox" id="private_link" name="private_link"><br>

                                <div id="add-link-btns">
                                    <button class="add-link-btn btn" type="submit">Zapisz</button>
                                </div>
                            </form>
                        </div>
                      <% } else { %>
                       <div id="main-panel">
                        <h1>Zaloguj sie do aplikacji by z niej korzystac.</h1>
                        </div>
                      <% } %>
            </div>

        </div>
    </main>

    <footer id="footer">
        <div id="inner-footer">
            <div id="ppl">
                <a class="git-link btn b" href="https://github.com/bAleksiejczuk" target="_blank" rel="noopener noreferrer">
                    <span class="name" id="ba">Brunon Aleksiejczuk</span>
                    <span class="gh">Git<span class="hub">Hub</span></span>
                </a>
                <a class="git-link btn b" href="https://github.com/malkul25" target="_blank" rel="noopener noreferrer">
                    <span class="name" id="mk">Małgorzata Kulik</span>
                    <span class="gh">Git<span class="hub">Hub</span></span>
                </a>
                <a class="git-link btn b" href="https://github.com/Kubbix12" target="_blank" rel="noopener noreferrer">
                    <span class="name" id="jh">Jakub Hryniewicki</span>
                    <span class="gh">Git<span class="hub">Hub</span></span>
                </a>
            </div>
            <div id="java-project">
                <a class="repository" href="https://github.com/bAleksiejczuk/Java-ProjektGrupowyWSE2025" target="_blank" rel="noopener noreferrer"><span>Java-ProjektGrupowyWSE2025</span></a>
            </div>
            <span id="copyright" >Copyright &copy; 2025</span>
        </div>
    </footer>
</div>
<button id="top-btn">↑</button>
</body>
</html>


