<%@page import="com.spring.demo.Model.Movie" %>
<%@page import="com.spring.demo.Model.Room" %>
<%@page import="com.spring.demo.Model.Cinema" %>
    <%@page import="java.util.List" %>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

                <!DOCTYPE html>
                <html>
                <head>
                    <meta charset="UTF-8">
                    <title>Room</title>
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
                                    <h2>Room</h2>
                                    <c:if test="${message!=null}">
                                    <div class="alert alert-success" role="alert">
                                    <c:out value="${message}"></c:out>
                                    ${movie=null}
                                    </div>
                                    </c:if>
                                </div>
                                <div class="card-body">
                                    <form action="/apiRoom/addRoom" method=post>

                                        <div class="mb-3 mt-3">
                                            <label for="roomNumber" class="form-label">Room Number:</label>
                                            <input type="number" class="form-control" id="roomNumber" name="roomNumber"
                                                value="${room.roomNumber }">
                                        </div>
                                        <div class="mb-3">
                                            <label for="placesCount" class="form-label">Number of places:</label>
                                            <input type="number" class="form-control" id="placesCount" name="placesCount"
                                                value="${room.placesCount }">
                                        </div>
                                        <div>
                                            <label for="cinema" class="form-label  mb-3">Cinema:</label>
                                            <select name="cinema">
                                                <option selected hidden>Choose here</option>
                                                <c:forEach items="${cinema}" var="cin">
                                                    <option value="${cin.id }" <c:if
                                                        test="${room.cinema.id == cin.id }">selected="true"</c:if>
                                                        >${cin.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div>
                                            <label for="movie" class="form-label  mb-3">Movie:</label>
                                            <select name="movie">
                                                <option selected hidden>Choose here</option>
                                                <c:forEach items="${movie}" var="mov">
                                                    <option value="${mov.id }" <c:if
                                                        test="${room.movie.id == mov.id }">selected="true"</c:if>
                                                        >${mov.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <input type="hidden" class="form-control" id="id" name="id"
                                            value="${room.id}">
                                        <button type="submit" class="btn btn-primary" name=action value="add">Save</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                </body>
         </html>