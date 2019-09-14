<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Home</title>
</head>
<body>
    <h1>Hello world!</h1>
 
    <table>
       
        <tbody>
            <c:forEach items="${memberList}" var="member">
                <tr>
                    <td>${member.email}</td>
                    <td>${member.passwd}</td>
                    <td>${member.name}</td>
                    <td>${member.phone}</td>
                    <td>${member.address}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
 
 
</body>
</html>


