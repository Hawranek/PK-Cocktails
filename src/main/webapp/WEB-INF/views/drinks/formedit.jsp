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
    <title>Add New Cocktail to card: ${card.name}</title>
    <style>
        table, th, td {
            border: 1px solid black;
        }
    </style>
</head>
<body>
<%@include file="../cards/cardnavigation.jsp"%>

<table>

    <form:form modelAttribute="cocktail" method="post" action="/app/drink/edit">
        <%--        <input type="hidden" name="cardid" id="cardid" value="${card.id}">--%>
        <form:hidden path="id"/>
        <input type="hidden" name="cardid" id="cardid" value="${card.id}"/>
        <thead>
        <th>Name</th>
        <th>Image</th>
        <th>Category</th>
        <th>Alcoholic</th>
        <th>Glass type</th>
        <th>Instructions</th>
        <th>Ingredients</th>
        <th>Action</th>
        </thead>
        <tbody>
        <tr>
            <td><form:input path="name"/></td>
            <td><form:input path="drinkThumb"/></td>
            <td><form:input path="category"/></td>
            <td><form:checkbox path="alcoholic"/></td>
            <td><form:input path="glass"/></td>
            <td><form:input path="instructions"/></td>
            <td><form:input path="ingredientList"/></td>


            <td><input type="submit"></td>
        </tr>
        </tbody>
    </form:form>

</table>
</body>
</html>
