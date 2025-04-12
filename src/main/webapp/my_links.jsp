<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<style>

    #menu {
        background: dodgerblue;
        color: white;
        height: 80px;
        width: 100%;
        text-align: center;
        margin: 0;
        position: fixed;
        top: 0;
        left: 0;
    }

    #buttons {
        margin-top: 20px;
    }

    a {
        font-family: "Arial Black";
        font-size: 16px;
        background: white;
        border: 0;
        padding: 10px 20px;
        transition-duration: 0.4s;
        margin: 5px;
    }

    a:hover {
        background-color: yellow;
        color: black;
    }


    #main-panel {
        width: 80%;
        margin: 120px auto 40px;
        padding: 20px;
        background-color: lightblue;
        border-radius: 8px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        min-height: 400px;
    }


    #footer {
        display: flex;
        justify-content: space-between;
        align-items: center;
        text-align: left;
        background-color: dodgerblue;
        color: white;
        padding: 10px;
        position: fixed;
        width: 100%;
        bottom: 0;
        font-size: 14px;
        margin: 0;
    }


    #footer p {
        margin: 0;
    }


    #footer a {
        font-size: 14px;
        color: white;
        text-decoration: none;
        margin-left: 10px;
        padding: 2px 6px;
        background-color: #555;
        border-radius: 5px;
        transition: background-color 0.3s;
    }

    #footer a:hover {
        background-color: #777;
    }


    #footer .java-project {
        text-align: right;
        font-weight: bold;
        flex-grow: 1;
    }

</style>

<head>
    <title>Moje Linki</title>
</head>

<body>
<div>
    <div id="menu">
        <div id="buttons">
            <% if(session.getAttribute("user") != null) { %>
            <h2>Witaj ${user.name}!!!</h2>
            <% } %>

            <a href="index.jsp">Strona Główna</a>
            <a href="leadboard.jsp">Ranking</a>

            <% if(session.getAttribute("user") != null) { %>
            <a href="my_links.jsp">Moje Linki</a>
            <a href="add_link.jsp">Dodaj Link</a>

            <form action="logout">
                <input type="submit" value="Wyloguj">
            </form>
            <% } else { %>
            <a href="login.jsp">Logowanie</a>
            <% } %>
        </div>
    </div>
</div>

<div id="main-panel">
    <h1>Witaj w naszej aplikacji!</h1>
    <p>W tym miejscu będą wyświetlane najważniejsze informacje i aktualności.</p>
</div>

<div id="footer">

    <div>
        <p>Brunon Aleksiejczuk - <a href="https://github.com/bAleksiejczuk">GitHub</a></p>
        <p>Małgorzata Kulik - <a href="https://github.com/malkul25">GitHub</a></p>
        <p>Jakub Hryniewicki - <a href="https://github.com/Kubbix12">GitHub</a></p>
    </div>


    <div class="java-project">
        <p>Java-ProjektGrupowyWSE2025</p>
    </div>
</div>
</body>
</html>
