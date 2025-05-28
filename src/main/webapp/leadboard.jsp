<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>TopLinker - ranking</title>

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
                <a class="btn b" href="my_links.jsp"><span id="my-links-btn">Moje Linki</span></a>
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
            <header>Ranking <a id="top-linker" href="index.jsp"><span id="top">Top</span><span id="linker">Linker!</span></a></header>
            <div id="desc">Poniżej ranking wszystkich linków zamieszczonych w aplikacji!</div>

            <div id="links-container">
                <c:choose>
                    <c:when test="${not empty links}">
                        <c:forEach var="link" items="${links}" varStatus="status">
                              <div class="link-container">
                                <a href="${link.url}" class="link${status.index + 1 > 4 ? 4 : status.index + 1}" target="_blank" rel="noopener noreferrer" title="${link.description}">
                                <c:choose>
                                        <c:when test="${status.index == 0}">
                                          <img src="images/top1.png" alt="Top1" id="medal1" title="Złoto!" />
                                        </c:when>
                                        <c:when test="${status.index == 1}">
                                          <img src="images/top2.png" alt="Top2" id="medal1" title="Srebro!" />
                                        </c:when>
                                        <c:when test="${status.index == 2}">
                                          <img src="images/top3.png" alt="Top3" id="medal1" title="Brąz!" />
                                        </c:when>
                                      </c:choose>
                                  <span class="link">
                                    <span class="rank">${status.index + 1}. </span>
                                    <span class="title-link">${link.name}</span>
                                    <span class="added-link">${link.url}</span>
                                  </span>

                                  <span class="likes">
                                    <span class="likes-container">
                                      <span class="like-count">${link.likes}</span>
                                      <img class="like" src="images/like.png" alt="Polubień">

                                    </span>

                                    <span class="added-time">${link.addedTime}</span><%--Godzina--%>
                                    <span class="added-time">${link.addedAt}</span><%--Niech pobierze datę--%>
                                  </span>
                                </a>
                              </div>
                            </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="no-links">Brak dostępnych linków do wyświetlenia.</div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </main>

      <footer id="footer">
    <div id="inner-footer">
      <div id="ppl">

        <a class="git-link btn b" href="https://github.com/bAleksiejczuk" target="_blank" rel="noopener noreferrer">
        <img class="github" src="images/github.png" alt="github"
             width="40" height="40">
          <span class="name" id="ba">Brunon Aleksiejczuk</span>
        </a>

        <a class="git-link btn b" href="https://github.com/malkul25" target="_blank" rel="noopener noreferrer">
                <img class="github" src="images/github.png" alt="github"
                     width="40" height="40">
          <span class="name" id="mk">Małgorzata Kulik</span>
        </a>

        <a class="git-link btn b" href="https://github.com/Kubbix12" target="_blank" rel="noopener noreferrer">
                <img class="github" src="images/github.png" alt="github"
                     width="40" height="40">
          <span class="name" id="jh">Jakub Hryniewicki</span>
        </a>
      </div>
      <span id="copyright"><a class="repository" href="https://github.com/bAleksiejczuk/Java-ProjektGrupowyWSE2025" target="_blank" rel="noopener noreferrer"><span>Java-ProjektGrupowyWSE2025</span></a></span>
    </div>
  </footer>
</div>
<button id="top-btn">↑</button>
</body>
</html>
