<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.ArrayList" %>

<%
ArrayList<String> fruits = new ArrayList<String>();
fruits.add("Orange");
fruits.add("Apple");
pageContext.setAttribute("fruits", fruits);
%> 
<c:forEach var="fruit" items="${fruits}">
<c:out value="${fruit}" />
</c:forEach> 