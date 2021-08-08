<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>
<%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: damian--%>
<%--  Date: 25.07.2021--%>
<%--  Time: 15:20--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Cocktail List for card: ${card.id}</title>--%>
<%--    <style>--%>
<%--        table, th, td {--%>
<%--            border: 1px solid black;--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--<%@include file="../home/nav.jsp"%>--%>
<%--&lt;%&ndash;97-122 małe litery&ndash;%&gt;--%>
<%--<table >--%>
<%--    Search by First Letter:--%>
<%--    <tbody>--%>
<%--    <tr>--%>
<%--    <form:form action="app/drink/list" method="get">--%>
<%--        <c:forEach var="i" items="${alphabet}">--%>
<%--            <th>--%>
<%--                <a href="<c:out value="/app/drink/list/letter?search=${i}"/>">${i}</a>--%>
<%--            </th>--%>
<%--        </c:forEach>--%>
<%--    </form:form>--%>
<%--    </tr>--%>
<%--    </tbody>--%>
<%--</table>--%>
<%--<table>--%>
<%--    <thead>--%>
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
<%--            <td><a href="<c:out value="/app/drink/show?drinkid=${cocktail.idDrink}"/> ">Show</a></td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>


<%--    </tbody>--%>

<%--</table>--%>

<%--</body>--%>
<%--</html>--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--
  Created by IntelliJ IDEA.
  User: damian
  Date: 25.07.2021
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>Cocktail List for card: ${card.name}</title>
    <style>
        table, th, td {
            border: 1px solid black;
        }
    </style>
</head>
<body>
<%@include file="../home/nav.jsp"%>

<table>
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
    <c:forEach items="${cocktails}" var="drink">
        <tr>
            <td>${drink.name}</td>
            <td><img src="${drink.drinkThumb}" width="100" height="100"></td>
            <td>${drink.category}</td>
            <td>${drink.alcoholic}</td>
            <td>${drink.glass}</td>
            <td>${drink.instructions}</td>
            <td>${drink.ingredientList}</td>

            <td><a href="<c:out value="/app/drink/show?drinkid=${drink.id}"/> ">Delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
