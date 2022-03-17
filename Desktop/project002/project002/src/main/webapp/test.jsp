<%@taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tag" tagdir= "/WEB-INF/tags" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    </head>
    <body>

        <button type="button" onclick="myFunction()" class="btn btn-secondary" data-dismiss="modal">Close</button>

        <button type="button" onclick="submitForm()" class="btn btn-secondary" data-dismiss="modal">Submit test</button>

        <script>

            function myFunction() {
                const url = new URL(window.location.href);
                url.searchParams.set('param1', 'val1');
                url.searchParams.delete('param2');
                window.history.replaceState(null, null, url); // or pushState;
            }

            function submitForm() {
                var data = new FormData(document.getElementById("my-form"));
                fetch("hello", {method: "post", body: data});
                alert(1);
            }
        </script>


        <script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
        <form action="./cc" id="my-form">
            <input name="lol" type="text"/>
            <input  onclick="submitForm()" type="submit"/>
        </form>

    </body>






</html>