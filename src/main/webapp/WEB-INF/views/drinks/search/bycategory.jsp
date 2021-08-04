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
        <select name="cat" id="cat" multiple>
            <option value="empty">Select categories</option>
            <c:forEach items="${categories}" var="cat">
                <option value="${cat}">${cat}</option>
            </c:forEach>
        </select>

    </td>
    </tbody>
</table>