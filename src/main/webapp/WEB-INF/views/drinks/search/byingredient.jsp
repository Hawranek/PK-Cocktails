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
        <select name="ing" id="ing" multiple>
            <option value="">Select Ingredients</option>
            <c:forEach items="${ingredients}" var="ing">
                <option value="${ing}">${ing}</option>
            </c:forEach>
        </select>

    </td>
    </tbody>
</table>