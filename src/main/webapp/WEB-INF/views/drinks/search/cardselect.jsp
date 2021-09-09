<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<td>
    <select name="cardid" id="cardid">
        <c:forEach var="card" items="${cards}">
            <option value="${card.id}">${card.name}</option>
        </c:forEach>
    </select>
</td>