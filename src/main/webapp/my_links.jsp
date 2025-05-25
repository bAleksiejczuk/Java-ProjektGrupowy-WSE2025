<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, com.example.baleksiejczuk.LinkData" %>

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
    <title>TopLinker - moje linki</title>
    <meta name="description" content="Java-ProjektGrupowyWSE2025">
    <meta name="authors" content="Brunon Aleksiejczuk, Jakub Hryniewicki, Małgorzata Kulik">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                <h2 id="welcome">Cześć, <a href="my_profile.jsp" id="username"><span id="linkers-name">${user.login}</span></a><span class="i s12 y"> !</span></h2>
                <% } %>
            </div>
            <div id="buttons">
                <a class="btn b" href="index.jsp"><span id="main-btn">Strona Główna</span></a>
                <a class="btn b" href="leadboard"><span id="rank-btn">Ranking</span></a>
                <% if(session.getAttribute("user") != null) { %>
                <a class="btn b" href="myLinks"><span id="my-links-btn">Moje Linki</span></a>
                <a class="btn b" href="add_link.jsp"><span id="add-link-btn">Dodaj Link</span></a>
                <% } else { %>
                <a class="btn b" href="login.jsp"><span id="login-btn">Logowanie</span></a>
                <% } %>
            </div>
            <div id="right-side-nav">
                <div id="darkModeBtn">
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
            <% if(session.getAttribute("user") != null) { %>
            <header>Dodane przez Ciebie do <a id="top-linker" href="index.jsp"><span id="top">Top</span><span id="linker">Linker!</span></a></header>
            <div id="content">
                <div id="my-link-section">
                    <div id="my-links-list">
                        <%
                            List<LinkData> links = (List<LinkData>) session.getAttribute("links");
                            if (links != null && !links.isEmpty()) {
                                for (int i = 0; i < links.size(); i++) {
                                    LinkData link = links.get(i);
                        %>
                        <div class="link-container-ml">
                            <a href="<%= link.getUrl() %>" class="link4" target="_blank" rel="noopener noreferrer" >
                                <% if(link.isPrivate()) { %>
                                <img class="lock" src="images/lock.png" alt="Prywatny"  data-private="true">
                                <% } else { %>
                                <img class="lock" src="images/globe.png" alt="Publiczny"  data-private="false">
                                <% } %>

                                <span class="link">
                                <span class="rank"><%= i + 1 %>. </span>
                                <span class="title-link"><%= link.getName() %></span>
                                <span class="added-link"><%= link.getUrl() %></span>
                            </span>

                                <span class="likes">
                                <span class="likes-container">
                                    <span class="like-count"><%= link.getLikes() %></span>
                                    <img class="like" src="images/like.png" alt="Polubień">
                                    <img class="cross" src="images/cross.png" alt="Usuń">
                                </span>
                                <span class="added-time"><%= link.getAddedTime() %></span>
                                <span class="added-time"><%= link.getAddedAt() %></span>
                            </span>
                            </a>
                        </div>
                        <%
                            } // end for
                        } else {
                        %>
                        <p class="no-link">Brak linków do wyświetlenia.</p>
                        <% } %>
                    </div>
                </div>
            </div>
            <% } else { %>
            <div id="main-panel">
                <header><a id="top-linker" href="index.jsp"><span id="top">Top</span><span id="linker">Linker</span></a></header>
                <h1>Zaloguj się do aplikacji by z niej korzystać.</h1>
            </div>
            <% } %>
        </div>
    </main>

    <footer id="footer">
        <div id="inner-footer">
            <div id="ppl">
                <a class="git-link btn b" href="https://github.com/bAleksiejczuk" target="_blank">
                    <img class="github" src="images/github.png" alt="github" width="40" height="40">
                    <span class="name" id="ba">Brunon Aleksiejczuk</span>
                </a>
                <a class="git-link btn b" href="https://github.com/malkul25" target="_blank">
                    <img class="github" src="images/github.png" alt="github" width="40" height="40">
                    <span class="name" id="mk">Małgorzata Kulik</span>
                </a>
                <a class="git-link btn b" href="https://github.com/Kubbix12" target="_blank">
                    <img class="github" src="images/github.png" alt="github" width="40" height="40">
                    <span class="name" id="jh">Jakub Hryniewicki</span>
                </a>
            </div>
            <span id="copyright">
                <a class="repository" href="https://github.com/bAleksiejczuk/Java-ProjektGrupowyWSE2025" target="_blank">
                    <span>Java-ProjektGrupowyWSE2025</span>
                </a>
            </span>
        </div>
    </footer>
</div>
<button id="top-btn">↑</button>
</body>
</html>
