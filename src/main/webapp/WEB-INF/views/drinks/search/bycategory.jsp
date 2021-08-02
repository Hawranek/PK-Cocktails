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
            <c:forEach items="${categories}" var="cat">
                <input type="checkbox" name="cat" value="${cat}">${cat}<br/>
            </c:forEach>
    </td>
    </tbody>
</table>