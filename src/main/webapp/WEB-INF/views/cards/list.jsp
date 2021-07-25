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
<table>
    <thead>
    <th>Name</th>
    <th>Amount of cocktails</th>
    </thead>
    <tbody>
    <c:forEach var="card" items="${cards}">
        <tr>
            <td>${card.name}</td>
            <td>${card.cocktails.size}</td>
        </tr>

    </c:forEach>
    </tbody>
</table>

</body>
</html>
