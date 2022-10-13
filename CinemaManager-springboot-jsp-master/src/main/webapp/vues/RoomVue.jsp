<%@page import="com.spring.demo.Model.Movie" %>
<%@page import="com.spring.demo.Model.Room" %>
<%@page import="com.spring.demo.Model.Cinema" %>
    <%@page import="java.util.List" %>
        <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                <!DOCTYPE html>
                <html>
                <head>
                    <meta charset="ISO-8859-1">
                    <title>Cinema Management</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
                        rel="stylesheet"
                        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
                        crossorigin="anonymous">
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
                        crossorigin="anonymous"></script>
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
                </head>
                <body>
                <%@ include file="navbar.html" %>
                        <br>
                        <br>
                        <br>
                        <div class="container">
                            <c:if test="${msg!=null }">
                                <div class="alert alert-danger" role="alert">${msg}</div>
                            </c:if>
                            <c:if test="${msg==null }">

                                <table class="table">
                                    <thead class="table-dark">
                                        <tr>
                                            <th>Id</th>
                                            <th>Cinema name</th>
                                            <th>Room number</th>
                                            <th>Number of places</th>
                                            <th>Movie name</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <c:forEach items="${RoomList}" var="r">
                                        <tr>
                                            <td>${r.id }</td>
                                            <td>${r.cinema.name }</td>
                                            <td>${r.roomNumber }</td>
                                            <td>${r.placesCount }</td>
                                            <td>${r.movie.name }</td>
                                            <td><a href="/apiRoom/deleteRoom/${r.id}"
                                                    onclick="return confirm('Delete this Room!')"
                                                    class="btn btn-outline-danger"><span class="fa fa-trash"></span></a>
                                                <a href="/apiRoom/updateRoom/${r.id}"
                                                    class="btn btn-outline-warning"><span class="fa fa-edit"></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </c:if>
                        </div>
                </body>
                </html>