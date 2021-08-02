<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table>
    <thead>
    <th>
        Search by ingredient name:
        <br/>
    </th>
    </thead>
    <tbody>
    <td>
            <c:forEach items="${ingredients}" var="ing">
                <input type="checkbox" name="ing" value="${ing}">${ing}<br/>
            </c:forEach>
    </td>
    </tbody>
</table>