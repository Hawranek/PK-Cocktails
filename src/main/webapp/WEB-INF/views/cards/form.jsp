<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<a href="/logout">Wyloguj</a>
<table>
    <thead>
    <th>Name</th>

    </thead>
    <tbody>
    <tr>${user}</tr><br/>

    <form:form modelAttribute="card" method="post" action="/app/card/form">
        <tr>${card.user}</tr><br/>
        <form:hidden path="id"/>
        <form:hidden path="user"/>
        <form:hidden path="cocktails"/>
        <tr>
            <td><form:input path="name"/></td>
        </tr>
        <tr><input type="submit"> </tr>
    </form:form>
    </tbody>
</table>
<%--<table>--%>
<%--    <tr><a href="<c:out value="/app/card/add"/>">Dodaj kartę</a></tr>--%>
<%--</table>--%>

</body>
</html>
