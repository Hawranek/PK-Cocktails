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
    <title>Cards of user: ${user.email}</title>
</head>
<body>
<%@include file="cardnavigation.jsp"%>
<table>
    <thead>
    <th>Name</th>
    <th>Amount of cocktails</th>
    <th>Action</th>
    </thead>
    <tbody>
    <c:forEach var="card" items="${cards}">
        <tr>
            <td><a href="<c:out value="/app/card/${card.id}/cocktails"/>">${card.name}</a> </td>
            <td>${card.getCocktails().size()}</td>
<%--            <td></td>--%>
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
