<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<tr>${user}</tr><br/>
<tr><a href="/logout">Wyloguj</a></tr><br/>
<tr><a href="/form/${user.id}">Edytuj swoje dane</a></tr><br/>
<%@include file="../home/nav.jsp"%>
<a href="/app/drink/form">Add new cocktail</a>
<a href="<c:out value="/app/drink/incard/searching"/> ">Search in card</a>
