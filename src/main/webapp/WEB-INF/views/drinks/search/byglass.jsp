<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table>
    <thead>
    <th>
        Search by category:
        <br/>
    </th>
    </thead>
    <tbody>
    <td>
            <c:forEach items="${glasses}" var="glass">
                <input type="checkbox" name="glass" value="${glass}">${glass}<br/>
            </c:forEach>
    </td>
    </tbody>
</table>