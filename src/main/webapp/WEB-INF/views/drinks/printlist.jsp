<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<table>
    <thead>
    <th>Name</th>
    <th>Image</th>
    <th>Show</th>
    </thead>
    <tbody>
    <c:forEach items="${cocktails.drinks}" var="cocktail">
        <tr>
            <td>${cocktail.strDrink}</td>
            <td><img src="${cocktail.strDrinkThumb}" width="100" height="100"></td>
            <td><a href="<c:out value="/app/drink/show?drinkid=${cocktail.idDrink}"/> ">Show</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>