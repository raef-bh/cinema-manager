<%@page import="com.spring.demo.Model.Movie" %>
    <%@page import="java.util.List" %>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                <!DOCTYPE html>
                <html>
                <head>
                    <meta charset="UTF-8">
                    <title>Movie</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
                        rel="stylesheet"
                        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
                        crossorigin="anonymous">
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
                        crossorigin="anonymous"></script>
                </head>
                <body>
                    <%@ include file="navbar.html" %>
                        <br>
                        <div class=container>
                            <div class="card m-5 p-2">
                                <div class="card-header">
                                    <h2>Movie</h2>
                                    <c:if test="${message!=null}">
                                    <div class="alert alert-success" role="alert">
                                    <c:out value="${message}"></c:out>
                                    ${movie=null}
                                    </div>
                                    </c:if>
                                </div>
                                <div class="card-body">
                                    <form action="/apiMovie/addMovie" method=post enctype="multipart/form-data">
                                        <div class="mb-3 mt-3">
                                            <label for="name" class="form-label">Name:</label>
                                            <input type=text class="form-control" id="name" name="name"
                                                value="${movie.name }">
                                        </div>
                                        <input type="hidden" name="id" value="${movie.id}">
                                        <div class="mb-3 mt-3">
                                            <label for="image" class="form-label">Photos:</label>
                                             <input type=hidden name=image value="${movie.image}">
                                            <input type="file" class="form-control" id="file"  name="file"  accept="image/png,image/jpg">
                                          </div>
                                        <button type="submit" class="btn btn-primary" name=action
                                            value="add">Save</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>