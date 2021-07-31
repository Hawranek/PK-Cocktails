<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: damian
  Date: 25.07.2021
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Adding Card for user: ${user.email}</title>
</head>
<body>
<a href="/logout">Wyloguj</a>
<table>
    <thead>
    <th>Name</th>
    <th>Amount of cocktails</th>
    <th>Action</th>
    </thead>
    <tbody>
    ${user}
    <c:forEach var="card" items="${cards}">
        <tr>
            <td>${card.name}</td>
<%--            <td>${card.cocktails.size}</td>--%>
            <td>
                <a href="<c:out value="/app/card/form/${card.id}"/>">Edytuj</a>
                <a href="<c:out value="/app/card/del/${card.id}"/>">Usuń</a>
            </td>
        </tr>

    </c:forEach>

    </tbody>
</table>
<table>
    <tr><a href="<c:out value="/app/card/form"/>">Dodaj kartę</a> </tr>
</table>

</body>
</html>
