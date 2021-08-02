<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table>
    <thead>
    <th>
        Search by alcohol content:
        <br/>
    </th>
    </thead>
    <tbody>
    <td>
            <input name="alc" type="checkbox" value="alcoholic" checked>Alcoholic<br/>
            <input name="alc" type="checkbox" value="non_alcoholic">Non Alcoholic<br/>
    </td>
    </tbody>
</table>