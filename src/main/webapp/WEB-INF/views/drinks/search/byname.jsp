<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table>
<thead>
<th>
    Search by Cocktail name:
    <br/>
</th>
</thead>
<tbody>
<td>
    <form action="/app/drink/list/search" method="get">
        Type name: <input name="name" type="text"><br/>
        <input type="submit">
    </form>
</td>
</tbody>
</table>