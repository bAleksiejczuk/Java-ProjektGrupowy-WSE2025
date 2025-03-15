<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Formularz kontaktowy</title>
</head>
<body>

<div>
    <form action="hello-servlet">
        <h1>Podaj swoje imie</h1>
        <input type="text" id="name" name="email"><br>
        <h1>Podaj swoje nazwisko</h1>
        <input type="text" id="surname" name="surname"><br>
        <h1>Podaj login</h1>
        <input type="text" id="login" name="login"><br>
        <h1>Podaj hasło</h1>
        <input type="password" id="password" name="password"><br>
        <input type="submit" value="Zarejestruj">
    </form>
    <br>
    <a href="index.jsp">Powrót</a>

</div>

</body>
</html>
