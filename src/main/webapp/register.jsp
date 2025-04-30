<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <title>TopLinker - rejestracja</title>

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
                  <a href="index.jsp">Strona Główna</a>
                  <a href="leadboard.jsp">Ranking</a>

                  <% if(session.getAttribute("user") != null) { %>
                  <a href="my_links.jsp">Moje Linki</a>
                  <a href="add_link.jsp">Dodaj Link</a>
                  <% } else { %>
                  <a href="login.jsp">Logowanie/Rejestracja</a>
                  <% } %>
            </div>
            <div id="right-side-nav">
                <div id="darkModeBtn" >
                    <img src="static/moon.png" alt="Księżyc" class="moon">
                </div>
                    <% if(session.getAttribute("user") != null) { %>
                      <a href="my_profile.jsp"><img src="images/myselficon.png" alt="Mój profil" id="myself"></a>
                      <form action="logout">
                        <input type="submit" value="Wyloguj">
                      </form>
                    <% } %>
            </div>
        </div>
    </nav>

    <main>
        <div id="inner-main">
            <header>Rejestracja do <a id="top-linker" href="index.jsp"><span id="top">Top</span><span id="linker">Linker</span></a> !</header>
            <div id="content">
                <% if(session.getAttribute("user") != null) { %>
                    Jesteś zalogowany
                <% } else { %>
                    <form action="register">
                        <h1>Podaj swoje imie</h1>
                        <input type="text" id="name" name="email"><br>
                         <h1>Podaj swoje nazwisko</h1>
                         <input type="text" id="surname" name="surname"><br>
                         <h1>Podaj swoj email</h1>
                         <input type="email" id="email" name="email"><br>
                         <h1>Podaj login</h1>
                         <input type="text" id="login" name="login"><br>
                         <h1>Podaj hasło</h1>
                         <input type="password" id="password" name="password"><br>
                         <input type="submit" value="Zarejestruj">
                     </form>
                     <% if (request.getAttribute("errorMessage") != null) { %>
                         <div style="color: red; font-weight: bold; margin-top: 15px;">
                             <%= request.getAttribute("errorMessage") %>
                         </div>
                     <% } %>

                     <div id="account">
                        <p id="no-account">Masz już konto?<a id="act" href="login.jsp">Zaloguj się</a></p>
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
            <span id="copyright">Copyright &copy; 2025</span>
        </div>
    </footer>
</div>
<button id="top-btn" >↑</button>
</body>

</html>
