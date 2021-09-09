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
    <c:forEach items="${cocktail.drinks}" var="drink">
    <img src="${drink.strDrinkThumb}" width="300" height="300">
    <h1>${drink.strDrink}</h1>

    <thead>
    <th>Category</th>
    <th>Alcoholic</th>
    <th>Glass type</th>
    <th>Instructions</th>
    <th>Ingredients</th>
    <th>Action</th>
    </thead>
    <tbody>
    <tr>
        <td>${drink.strCategory}</td>
        <td>${drink.strAlcoholic}</td>
        <td>${drink.strGlass}</td>
        <td>${drink.strInstructions}</td>
        <td>
<%--            ${drink.getIngredientList()}--%>
            <c:forEach var="ing" items="${drink.getIngredientList()}">
                ${ing}<br/>
            </c:forEach>
        </td>
        <td><a href="/app/card/addtocard/${drink.idDrink}">Dodaj do karty</a> </td>
    </tr>
    </tbody>
    </c:forEach>
</table>
</body>
</html>
