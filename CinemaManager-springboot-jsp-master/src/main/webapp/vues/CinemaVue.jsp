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
                        <div class="row">
                        <div class="col-3 mx-auto">
                        <form action="/apiCinema/findByMc" method="get" class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="mc">
                        <button class="btn btn-outline-success" type="submit"  value="find"><i class="fa fa-search"></i></button>
                        </form>
                        </div>
                        </div>
                        <br>
                        <br>
                            <c:if test="${msg!=null }">
                                <div class="alert alert-danger" role="alert">${msg}</div>
                            </c:if>
                            <c:if test="${msg==null }">
                                <table class="table">
                                    <thead class="table-dark">
                                        <tr>
                                            <th>Id</th>
                                            <th>Name</th>
                                            <th>Address</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <c:forEach items="${CinemaList}" var="c">
                                        <tr>
                                            <td>${c.id }</td>
                                            <td>${c.name }</td>
                                            <td>${c.address }</td>
                                            <td><a href="/apiCinema/deleteCinema/${c.id}"
                                                    onclick="return confirm('Delete this cinema!')"
                                                    class="btn btn-outline-danger"><span class="fa fa-trash"></span></a>
                                                <a href="/apiCinema/updateCinema/${c.id}"
                                                    class="btn btn-outline-warning"><span class="fa fa-edit"></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </c:if>
                        </div>
                </body>
                </html>