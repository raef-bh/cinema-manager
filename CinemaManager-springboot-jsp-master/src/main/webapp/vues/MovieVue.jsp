<%@page import="com.spring.demo.Model.Movie" %>

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
                        <style>@import "https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css";
                               @import "https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css";

                                   .single_advisor_profile {
                                       position: relative;
                                       margin-bottom: 50px;
                                       -webkit-transition-duration: 500ms;
                                       transition-duration: 500ms;
                                       z-index: 1;
                                       border-radius: 15px;
                                       -webkit-box-shadow: 0 0.25rem 1rem 0 rgba(47, 91, 234, 0.125);
                                       box-shadow: 0 0.25rem 1rem 0 rgba(47, 91, 234, 0.125);
                                   }
                                   .single_advisor_profile .advisor_thumb {
                                       position: relative;
                                       z-index: 1;
                                       border-radius: 15px 15px 0 0;
                                       margin: 0 auto;
                                       padding: 30px 30px 0 30px;

                                       overflow: hidden;
                                   }
                                   .single_advisor_profile .advisor_thumb::after {
                                       -webkit-transition-duration: 500ms;
                                       transition-duration: 500ms;
                                       position: absolute;
                                       width: 150%;
                                       height: 80px;
                                       bottom: -45px;
                                       left: -25%;
                                       content: "";
                                       background-color: #ffffff;
                                       -webkit-transform: rotate(-15deg);
                                       transform: rotate(-15deg);
                                   }
                                   @media only screen and (max-width: 575px) {
                                       .single_advisor_profile .advisor_thumb::after {
                                           height: 160px;
                                           bottom: -90px;
                                       }
                                   }
                                   .single_advisor_profile .advisor_thumb .social-info {
                                       position: absolute;
                                       z-index: 1;
                                       width: 100%;
                                       bottom: 0;
                                       right: 30px;
                                       text-align: right;
                                   }
                                   .single_advisor_profile .advisor_thumb .social-info a {
                                       font-size: 14px;
                                       color: #020710;
                                       padding: 0 5px;
                                   }
                                   .single_advisor_profile .advisor_thumb .social-info a:hover,
                                   .single_advisor_profile .advisor_thumb .social-info a:focus {
                                       color: #3f43fd;
                                   }
                                   .single_advisor_profile .advisor_thumb .social-info a:last-child {
                                       padding-right: 0;
                                   }
                                   .single_advisor_profile .single_advisor_details_info {
                                       position: relative;
                                       z-index: 1;
                                       padding: 30px;
                                       text-align: right;
                                       -webkit-transition-duration: 500ms;
                                       transition-duration: 500ms;
                                       border-radius: 0 0 15px 15px;
                                       background-color: #ffffff;
                                   }
                                   </style>
                </head>
                <body>
                <%@ include file="navbar.html" %>
                        <br>
                        <br>
                        <br>
                        <div class="container" id="main-container">
                           <div class="row justify-content-center">
                              <div class="col-12 col-sm-8 col-lg-6">
                                 <!-- Section Heading-->
                                 <div class="section_heading text-center wow fadeInUp" data-wow-delay="0.2s"
                                    style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">
                                    <h3>Movie</h3>
                                    <div class="line"></div>
                                 </div>
                              </div>
                           </div>
                           <div class="d-flex justify-content-start mt-5">
                              <!-- Single Advisor-->
                              <c:forEach items="${MovieList}" var="m">
                                 <div class="single_advisor_profile wow fadeInUp mx-1 bg-light" data-wow-delay="0.2s"
                                    style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">
                                    <!-- Team Thumb-->
                                    <div class="advisor_thumb">
                                    <c:choose>
                                    <c:when test="${m.image =='' || m.image == null}">
                                    <img src="/imagesData/inconnu.jpg" width="50" height="50">
                                    </c:when>
                                    <c:when test="${m.image!=''}">
                                    <img src="/imagesData/${m.image}" width="250" height="350">
                                    </c:when>
                                    </c:choose>
                                    <!-- Team Details-->
                                    <div class="single_advisor_details_info">
                                       <h6>${m.name}</h6>
                                       <div class="float-right btn-group btn-group-sm">
                                         <a href="/apiMovie/updateMovie/${m.id}"
                                         class="btn btn-outline-warning"><span class="fa fa-edit"></a>
                                          <a href="/apiMovie/deleteMovie/${m.id}"
                                         onclick="return confirm('Delete this movie!')"
                                         class="btn btn-outline-danger"><span class="fa fa-trash"></span></a>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              </c:forEach>
                </body>
                </html>