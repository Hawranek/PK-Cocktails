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
    <title>Cocktail List for card: ${card.id}</title>
    <style>
        table, th, td {
            border: 1px solid black;
        }
    </style>
</head>
<body>
<%@include file="search/byfirstletter.jsp" %>
<table>
    <td>
        <%@include file="search/byname.jsp" %>
    </td>

    <td>
        <%@include file="search/byingredient.jsp" %>
    </td>
    <td>
        <%@include file="search/byalcoholic.jsp" %>
    </td>
    <td>
        <%@include file="search/bycategory.jsp" %>
    </td>
    <td>
        <%@include file="search/byglass.jsp" %>
    </td>

</table>
<%@include file="printlist.jsp" %>

</body>
</html>
