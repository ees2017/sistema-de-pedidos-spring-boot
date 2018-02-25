<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@tag description="Página Generica" pageEncoding="utf-8" %>

<%--Assets--%>
<%@attribute name="cssLinks" fragment="true" %>
<%@attribute name="jsFooter" fragment="true" %>

<%--Contents--%>
<%@attribute name="title" fragment="true" %>
<%@attribute name="subtitle" fragment="true" %>
<%@attribute name="navbar" fragment="true" %>
<%@attribute name="header" fragment="true" %>
<%@attribute name="body" fragment="true" %>
<%@attribute name="footer" fragment="true" %>
<%@attribute name="btnToolbar" fragment="true" %>

<html>
<head lang="en">

    <title>
        <jsp:invoke fragment="title"/>
    </title>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

    <link href="<c:url value="/webjars/bootstrap/4.0.0/css/bootstrap.min.css"/>" rel="stylesheet" media="screen"/>
    <link href="<c:url value="/static/css/dashboard.css"/>" rel="stylesheet" media="screen">

    <jsp:invoke fragment="cssLinks"/>

</head>


<body>
<nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 navbar-top">
    <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="/"><jsp:invoke fragment="title"/></a>
    <div class="col-md-10 navbar-top__title">
        <h1 class="h2"><jsp:invoke fragment="subtitle"/></h1>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
            <div class="sidebar-sticky">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="/clientes"><span data-feather="users"></span>Clientes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/produtos"><span data-feather="shopping-bag"></span>Produtos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/pedidos"><span data-feather="list"></span>Pedidos</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>

    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
            <div class="btn-toolbar mb-2 mb-md-0">
                <jsp:invoke fragment="btnToolbar"/>
            </div>
        </div>

        <div class="row">
            <div class="col">
                <jsp:invoke fragment="body"/>
            </div>
        </div>

        <div class="row">
            <jsp:invoke fragment="footer"/>
        </div>
    </main>
</div>





<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<script src="<c:url value="/static/js/feather-icons/dist/feather.min.js"/>"></script>
<script src="<c:url value="/static/js/base.js"/>"></script>

<jsp:invoke fragment="jsFooter"/>
</body>
</html>