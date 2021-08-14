<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: damian
  Date: 25.07.2021
  Time: 16:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>

    <style>
        .error {
            color: red;
        }
    </style>
</head>
<body>
<form:form modelAttribute="user" method="post" action="/form">
    <form:hidden path="id"/>
    <tr>
        Username:
        <form:input path="username"/>
        <form:errors path="username" cssClass="error"/>
        <br/>
    </tr>
    <tr>
        Email:
        <form:input path="email"/>
        <form:errors path="email" cssClass="error"/>
        <br/>
    </tr>
    <tr>
        Password:
        <form:password path="password"/>
        <form:errors path="password" cssClass="error"/>
        <br/>
    </tr>
    <input type="submit">
</form:form>

</body>
</html>
