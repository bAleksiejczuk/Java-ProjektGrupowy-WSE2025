<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="org.json.JSONObject" %>
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
  <title>TopLinker - strona główna</title>

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
      <header>Witaj w <a id="top-linker" href="index.jsp"><span id="top">Top</span><span id="linker">Linker!</span></a></header>
      <div id="content">
        <form action="search" method="get" class="search-container">
          <img src="images/spinner.png" alt="spinner" class="spinner">

          <input type="text" name="query" placeholder="Wyszukaj..." class="search-input"
                 value="<%= request.getAttribute("searchQuery") != null ? request.getAttribute("searchQuery") : "" %>" />

          <select id="category-main" name="category" class="search-input">
            <option value="" <%= request.getAttribute("searchCategory") == null || request.getAttribute("searchCategory").equals("") ? "selected" : "" %>>Wszystkie</option>
            <option value="Edukacja" <%= "Edukacja".equals(request.getAttribute("searchCategory")) ? "selected" : "" %>>Edukacja</option>
            <option value="Rozrywka" <%= "Rozrywka".equals(request.getAttribute("searchCategory")) ? "selected" : "" %>>Rozrywka</option>
            <option value="Hobby" <%= "Hobby".equals(request.getAttribute("searchCategory")) ? "selected" : "" %>>Hobby</option>
            <option value="Zakupy" <%= "Zakupy".equals(request.getAttribute("searchCategory")) ? "selected" : "" %>>Zakupy</option>
            <option value="Zdrowie" <%= "Zdrowie".equals(request.getAttribute("searchCategory")) ? "selected" : "" %>>Zdrowie</option>
            <option value="Kulinarny" <%= "Kulinarny".equals(request.getAttribute("searchCategory")) ? "selected" : "" %>>Kulinarny</option>
            <option value="Technologia" <%= "Technologia".equals(request.getAttribute("searchCategory")) ? "selected" : "" %>>Technologia</option>
            <option value="Podróże" <%= "Podróże".equals(request.getAttribute("searchCategory")) ? "selected" : "" %>>Podróże</option>
            <option value="Social Media" <%= "Social Media".equals(request.getAttribute("searchCategory")) ? "selected" : "" %>>Social Media</option>
            <option value="Do przeczytania później" <%= "Do przeczytania później".equals(request.getAttribute("searchCategory")) ? "selected" : "" %>>Do przeczytania później</option>
            <option value="Muzyka" <%= "Muzyka".equals(request.getAttribute("searchCategory")) ? "selected" : "" %>>Muzyka</option>
            <option value="Sztuka i kultura" <%= "Sztuka i kultura".equals(request.getAttribute("searchCategory")) ? "selected" : "" %>>Sztuka i kultura</option>
            <option value="Motoryzacja" <%= "Motoryzacja".equals(request.getAttribute("searchCategory")) ? "selected" : "" %>>Motoryzacja</option>
            <option value="Inne" <%= "Inne".equals(request.getAttribute("searchCategory")) ? "selected" : "" %>>Inne</option>
          </select>

          <button type="submit" class="btn-3">Szukaj</button>
        </form>

        <!-- Wyświetlanie wyników wyszukiwania -->
        <%
        String errorMessage = (String) request.getAttribute("errorMessage");
        List<JSONObject> foundLinks = (List<JSONObject>) request.getAttribute("foundLinks");

        if (errorMessage != null) { %>
            <div id="search-error">
                <p style="color: red;"><%= errorMessage %></p>
            </div>
        <% } else if (foundLinks != null) { %>
            <div id="search-results">
                <h3>Wyniki wyszukiwania (<%= foundLinks.size() %> znaleziono)</h3>
                <% if (foundLinks.isEmpty()) { %>
                    <p>Nie znaleziono żadnych wyników.</p>
                <% } else { %>
                    <div id="results-container">
                        <% for (JSONObject link : foundLinks) { %>
                            <div class="link-item">
                                <p><strong>Nazwa:</strong> <%= link.optString("name", "Brak") %></p>
                                <h4>URL:<a href="<%= link.optString("url", "#") %>" target="_blank" rel="noopener noreferrer">
                                    <%= link.optString("url", "Brak Url") %>
                                </a></h4>
                                <p><strong>Kategoria:</strong> <%= link.optString("category", "Brak") %></p>
                                <p><strong>Dodane Przez:</strong> <%= link.optString("user", "Brak") %></p>
                                <p><strong>Czas:</strong> <%= link.optString("addedTime", "Brak") %><%= link.optString("addedAt", "Brak") %></p>
                                <p><strong>Polubienia:</strong> <%= link.optString("likes", "0") %></p>
                            </div>
                        <% } %>
                    </div>
                <% } %>
            </div>
        <% } %>

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
