<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--97-122 małe litery--%>
<table >
    Search by First Letter:
    <tbody>
    <tr>
            <c:forEach var="i" items="${alphabet}">
                <th>
                    <a href="<c:out value="/app/drink/list/search?fl=${i}"/>">${i}</a>
                </th>
            </c:forEach>
    </tr>
    </tbody>
</table>