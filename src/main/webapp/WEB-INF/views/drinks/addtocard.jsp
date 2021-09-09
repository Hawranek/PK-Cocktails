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
    <form:form modelAttribute="cocktail" method="post" action="/app/card/addtocard">
        <form:hidden path="id"/>
        <form:hidden path="name"/>
        <form:hidden path="category"/>
        <form:hidden path="alcoholic"/>
        <form:hidden path="glass"/>
        <form:hidden path="instructions"/>
        <form:hidden path="drinkThumb"/>
        <form:hidden path="imageSource"/>
        <form:hidden path="ingredientList"/>

        <img src="${cocktail.drinkThumb}" width="300" height="300">
        <h1>${cocktail.name}</h1>
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

    </form:form>
</table>

</body>
</html>
