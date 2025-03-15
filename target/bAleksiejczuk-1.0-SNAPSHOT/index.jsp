  <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>
  <style>
    #menu {
      background: red;
      color: white;
      float: left;
      height: 80px;
      width: 100%;
      text-align: center;
      margin: 0;
    }
    #buttons{margin-top: 30px;
    }

    a {
      font-family: "Arial Black";
      font-size: 16px; /* Zwiększ rozmiar czcionki, aby był bardziej widoczny */
      background: white;
      border: 0;
      padding: 10px 20px; /* Dodaj padding, aby link wyglądał jak przycisk */
      transition-duration: 0.4s;
    }

    a:hover {
      background-color: yellow;
      color: black;
    }


  </style>
  <head>
    <title>JSP - Hello World</title>
  </head>
  <body>
  <div>
    <div id="menu">
      <div id="buttons">
        <a href="">O mnie</a>
        <a href="">Dane</a>
        <a href="">Strona główna</a>
      </div>
    </div>
  </div>
  <h1><%= "Cześć Jestem Brunon" %></h1>

  <h1>Zaloguj się:</h1>
  <br/>
  <a href="formularz.jsp">Przejdz do rejestracji</a>
  <% if(session.getAttribute("user") != null) { %>
    <h2>Witaj ${user.name}!!!</h2>

  <% } else { %>
  <h2>Witaj gościu!!!</h2>

  <% } %>

  </body>
  </html>