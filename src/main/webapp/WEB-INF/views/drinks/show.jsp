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
    </tr>
    </tbody>
    </c:forEach>
</table>
<%--<h1>${cocktail.drinks.strDrink}</h1>--%>
<%--<h6>Tags: ${cocktail.drinks.strTags}</h6>--%>
<%--<h5>Category: ${cocktail.drinks.strCategory}</h5>--%>

<%--97-122 małe litery--%>
<%--<table>--%>
<%--    <thead>--%>
<%--    <form:form action="app/drink/list" method="get">--%>
<%--        <c:forEach var="i" items="${alphabet}">--%>
<%--            <th>--%>
<%--                <a href="<c:out value="/app/drink/list?search=${i}"/>">${i}</a>--%>
<%--            </th>--%>
<%--        </c:forEach>--%>
<%--    </form:form>--%>
<%--    </thead>--%>
<%--</table>--%>
<%--<table>--%>
<%--    <thead>--%>
<%--    <th>Cocktail name</th>--%>
<%--    <th>Category</th>--%>
<%--    <th>Alcoholic</th>--%>
<%--    <th>Glass type</th>--%>
<%--    <th>Ingredients</th>--%>
<%--    <th>Image</th>--%>
<%--    <th>Show</th>--%>
<%--    </thead>--%>
<%--    <tbody>--%>
<%--    <c:forEach items="${cocktails.drinks}" var="cocktail">--%>
<%--        <tr>--%>
<%--            <td>${cocktail.strDrink}</td>--%>
<%--            <td>${cocktail.strCategory}</td>--%>
<%--            <td>${cocktail.strAlcoholic}</td>--%>
<%--            <td>${cocktail.strGlass}</td>--%>
<%--            <td></td>--%>
<%--            <td><img src="${cocktail.strDrinkThumb}" width="100" height="100"></td>--%>
<%--            <td><a href="<c:out value="/app/drink/show?drinkid=${cocktails.idDrink}"/> ">Show</a> </td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>


<%--    </tbody>--%>

<%--</table>--%>

</body>
</html>
