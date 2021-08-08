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
    <title>Cocktail List for card: ${card.id}</title>
    <style>
        table, th, td {
            border: 1px solid black;
        }
    </style>
</head>
<body>
<%@include file="../cards/cardnavigation.jsp"%>
<table>
    <form method="post" action="/app/card/addtocard">
        <img src="${cocktail.drinkThumb}" width="300" height="300">
        <h1>${cocktail.name}</h1>
        <input type="hidden" name="drinkid" value="${cocktail.id}">
        <thead>
        <th>Card name</th>
        </thead>
        <tbody>
        <td><select name="cardid" id="cardid">
            <c:forEach items="${cards}" var="card">
                <option value="${card.id}">${card.name}</option>
            </c:forEach>
        </select></td>
        <input type="submit"/>
        </tbody>

    </form>
</table>

</body>
</html>
