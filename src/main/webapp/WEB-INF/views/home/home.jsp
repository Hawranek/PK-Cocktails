<%--
  Created by IntelliJ IDEA.
  User: damian
  Date: 25.07.2021
  Time: 13:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>HomePage</title>
</head>
<body>

<p>User name: ${user.email}</p>
<p>Cocktail name: ${cocktail.name}</p>
<p>Ingredient name: ${ingredient.name}</p>
<p>Card name: ${card.name}</p>
<a href="/login">Zaloguj się</a>
<a href="/form">Zarejestruj się</a>
</body>
</html>
