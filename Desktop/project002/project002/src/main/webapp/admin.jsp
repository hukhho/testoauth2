<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Admin - ${tittle}</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">


        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/form.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>


    </head>
    <body>
        <div>
            <div class="header-blue">
                <nav class="navbar navbar-dark navbar-expand-md navigation-clean-search">
                    <div class="container"><a class="navbar-brand" href="#">Boots Man</a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
                        <div class="collapse navbar-collapse"
                             id="navcol-1">
                            <ul class="nav navbar-nav">
                                <li class="nav-item" role="presentation"><a class="nav-link active" href="#">Management</a></li>
                                <li class="dropdown"><a class="dropdown-toggle nav-link dropdown-toggle" data-toggle="dropdown" aria-expanded="false" href="#">Menu </a>

                                    <div class="dropdown-menu" role="menu">
                                        <a class="dropdown-item" role="presentation" href="${pageContext.request.contextPath}/admin/order">Order </a>
                                        <a class="dropdown-item" role="presentation" href="${pageContext.request.contextPath}/admin/user">User</a>
                                        <a class="dropdown-item" role="presentation" href="${pageContext.request.contextPath}/admin/product">Product</a>
                                        <a class="dropdown-item" role="presentation" href="${pageContext.request.contextPath}/admin/inventory">Product Inventory</a>
                                        <a class="dropdown-item" role="presentation" href="${pageContext.request.contextPath}/admin/brand">Brand</a>
                                        <a class="dropdown-item" role="presentation" href="${pageContext.request.contextPath}/admin/color">Color</a>
                                    </div>
                                </li>
                            </ul>
                            <form class="form-inline mr-auto" target="_self">
                                <div class="form-group"><label for="search-field"><i class="fa fa-search"></i></label><input class="form-control search-field" type="search" name="search" id="search-field"></div>
                            </form><span class="navbar-text"> <a href="${pageContext.request.contextPath}/adminlogin?logout=true" class="login">Logout</a></span>
                        </div>
                </nav>

                <div class="container hero">
                    <div class="row">
                        <div class="col-12 col-lg-6 col-xl-5 offset-xl-1">
                            <h1>Admin Management System  </h1>                        

                        </div>
                    </div>
                </div>

            </div>


            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
            <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>



            <div class="container mt-5 px-2">
                <div class="mb-2 d-flex justify-content-between align-items-center">
                    <div class="position-relative"> <span class="position-absolute search"><i class="fa fa-search"></i></span> <input class="form-control w-100" placeholder="Search by order#, name..."> </div>
                    <div class="px-2"> <span> <i class="fa fa-angle-down"></i></span> <i class="fa fa-ellipsis-h ms-3"></i> </div>
                </div>


                <c:if test = "${errorMess != 'null'}">
                    <div class="alert alert-danger" role="alert">
                        ${errorMess}
                    </div>
                </c:if>
                <c:choose>
                    <c:when test = "${statusColor == 'green'}">
                        <div class="alert alert-success d-flex align-items-center" role="alert">
                            <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
                            <div>
                                ${status}
                            </div>
                        </div>
                    </c:when>


                    <c:when test = "${statusColor == 'red'}">
                        <div class="alert alert-danger d-flex align-items-center" role="alert">
                            <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
                            <div>
                                ${status}
                            </div>
                        </div>
                    </c:when>

                    <c:otherwise>
                    </c:otherwise>
                </c:choose>




                <c:choose>
                    <c:when test = "${tittle == 'order'}">
                        <table class="table table-responsive table-borderless">
                            <thead>
                            <caption>Order List</caption>
                            <tr class="bg-light">                                  
                                <th scope="col" width="5%">#ORDERID</th>
                                <th scope="col" >Date</th>
                                <th scope="col" >Payment Status</th>
                                <th scope="col" width="5%">UserID</th>
                                <th scope="col" >UserName</th>
                                <th scope="col" >Name Customer</th>
                                <th scope="col" >Delivery Start</th>
                                <th scope="col" >Ship Status</th>
                                <th scope="col" >Ship To Customer</th>
                                <th scope="col" >Done Ship</th>
                                <th scope="col" >Total payment</th> 
                            </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listO}" var="order">
                                    <tr>                                                     
                                        <td>${order.orderid}</td>
                                        <td>${order.orderdate}</td>
                                        <c:choose>
                                            <c:when test = "${order.paymentstatus == 'SUCCESS'}">
                                                <td><i class="fa fa-check-circle-o green"></i><span class="ms-1">${order.paymentstatus}</span></td>
                                                    </c:when>
                                                    <c:when test = "${order.paymentstatus == 'FAIL'}">
                                                <td><i class="fa fa-dot-circle-o text-danger"></i><span class="ms-1">${order.paymentstatus}</span></td>
                                                    </c:when>
                                                    <c:otherwise>
                                                    </c:otherwise>
                                                </c:choose>                                               
                                        <td>${order.userid}</td>
                                        <td>${order.username}</td>
                                        <td><img src="https://i.imgur.com/VKOeFyS.png" width="25"> ${order.name}</td>
                                        <td>${order.deliverystartdate}</td>
                                        <td>${order.shipstatus}</td>
                                        <td><button class="btn btn-primary" onclick="window.location.href = '${pageContext.request.contextPath}/admin/order/shiptocustomer?orderid=${order.orderid}'">Ship Now</button></td>
                                        <td><button class="btn btn-primary" onclick="window.location.href = '${pageContext.request.contextPath}/admin/order/doneship?orderid=${order.orderid}'">Done Ship</button></td>
                                        <td> ${order.totalamount}</td>                                          
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>



                    </c:when>             
                    <c:when test = "${tittle == 'user'}">                       
                        <table class="table table-responsive table-borderless">
                            <thead>
                                <tr class="bg-light">      
                                    <th scope="col" >#ID</th>
                                    <th scope="col" >Username</th>
                                    <th scope="col" >Password</th>
                                    <th scope="col" >Name</th>                               
                                    <th scope="col" >Sex</th>
                                    <th scope="col" >Email</th>
                                    <th scope="col" >Phone</th>
                                    <th scope="col" >Cash</th>
                                    <th scope="col" >Regtime</th>
                                    <th scope="col" class="text-end"><span>Edit</span></th>
                                </tr>
                            </thead>
                            <tbody>
                            <caption>Management ${tittle}</caption>

                            <c:forEach items="${listuser}" var="user">
                                <tr>
                                    <td>${user.id}</td>
                                    <td>${user.username}</td>
                                    <td>${user.password}</td>
                                    <td>${user.name}</td>
                                    <td>${user.sex}</td>
                                    <td>${user.email}</td>
                                    <td>${user.phone}</td>                                       
                                    <td>${user.cash}</td>
                                    <td>${user.regtime}</td>                                    
                                    <td><button class="btn btn-primary" onclick="window.location.href = '${pageContext.request.contextPath}/admin/user/edituser?userid=${user.id}'">Edit</button></td>                                    
                                </tr>           
                            </c:forEach>   
                            </tbody>
                        </table>



                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Edit User</button>

                        <div class="modal fade" id="exampleModal" tabindex="0" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">

                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Edit User Info</h5>
                                        <button type="button" onclick="myFunction()" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="form-edit-user" action="${pageContext.request.contextPath}/admin/user/edituser" method="post">
                                            <div class="form-group">
                                                <label for="userid" class="col-form-label">User ID: </label>
                                                <input name="userid" readonly class="form-control" id="userid" value="${userid}">
                                            </div>
                                            <div class="form-group">
                                                <label for="name" class="col-form-label">Name: </label>
                                                <input name="name" type="text" class="form-control" id="name" value="${name}">
                                            </div>
                                            <div class="form-group">
                                                <label for="pass" class="col-form-label">Pass: </label>
                                                <input name="pass" type="text" class="form-control" id="pass" value="${pass}">
                                            </div>
                                            <div class="form-check">
                                                <input name="sex" type="radio" class="form-check-input" id="radio1" name="optradio" value="Male" checked>Male
                                                <label class="form-check-label" for="radio1"></label>
                                            </div>
                                            <div class="form-check">
                                                <input name="sex" type="radio" class="form-check-input" id="radio2" name="optradio" value="Fermale">Fermale
                                                <label class="form-check-label" for="radio2"></label>
                                            </div>
                                            <div class="form-group">
                                                <label for="email" class="col-form-label">Email : </label>
                                                <input name="email" type="text" class="form-control" id="userid" value="${email}">
                                            </div>
                                            <div class="form-group">
                                                <label for="phone" class="col-form-label">Phone : </label>
                                                <input name="phone" type="text" class="form-control" id="phone" value="${phone}">
                                            </div>
                                            <div class="form-group">
                                                <label for="address" class="col-form-label">Address: </label>
                                                <input name="address" type="text" class="form-control" id="userid" value="${address}">
                                            </div>
                                            <div class="form-group">
                                                <label for="cash" class="col-form-label">Cash : </label>
                                                <input name="cash" type="text" class="form-control" id="cash" value="${cash}">
                                            </div>

                                            <input name="submit" type="hidden" class="form-control" value="true">
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" onclick="myFunction()" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                                            Edit
                                        </button>
                                    </div>  

                                    <script>
                                        function myFunction() {
                                            $('#exampleModal').modal('hide');
                                        }
                                    </script>

                                    <c:if test = "${open == 'true'}">
                                        <script type="text/javascript">
                                            $(window).on('load', function () {
                                                $('#exampleModal').modal('show');
                                            });
                                        </script>
                                    </c:if>

                                </div>
                            </div>
                        </div>


                        <!-- Button trigger modal -->
                        <!-- Modal -->
                        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">Edit confirm</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        Are you sure?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >Close</button>                                            
                                        <button class="btn btn-primary" type="submit" form="form-edit-user" value="Submit">Submit</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </c:when>


                    <c:when test = "${tittle == 'product'}">
                        <table class="table table-responsive table-borderless">
                            <thead>
                                <tr class="bg-light">
                                    <th scope="col" >#PID</th>
                                    <th scope="col" >Product Name</th>
                                    <th scope="col" >Brand ID</th> 
                                    <th scope="col" >Brand Name</th>
                                    <th scope="col" >Price</th>                                        
                                    <th scope="col" >Review</th>
                                    <th scope="col" >Image_Link</th>
                                    <th scope="col" >Total Amount</th>
                                    <th scope="col" >Delete</th>                            
                                    <th scope="col" class="text-end"><span>Edit</span></th>

                                </tr>
                            </thead>

                            <tbody>
                            <caption>Management ${tittle}</caption>
                            <c:forEach items="${totalAmountProductMap}" var="product">
                                <tr>
                                    <td>${product.key.pid}</td>
                                    <td>${product.key.name}</td>
                                    <td>${product.key.brandid}</td>
                                    <td>${product.key.brandname}</td>
                                    <td>${product.key.price}</td>
                                    <td>${product.key.review}</td>
                                    <td><img src="${product.key.image_link}"  width="100" height="100"></td>
                                    <td>${product.value}</td>
                                    <td><button class="btn btn-primary" onclick="window.location.href = '${pageContext.request.contextPath}/admin/product/delete?pid=${product.key.pid}&openDelete=true'">Delete</button></td>                                    
                                    <td><button class="btn btn-primary" onclick="window.location.href = '${pageContext.request.contextPath}/admin/product/editproduct?pid=${product.key.pid}'">Edit</button></td>                                    
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>    

                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Add product</button>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalEdit" data-whatever="@mdo">Edit product</button>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalDelete" data-whatever="@mdo">Delete product</button>

                        <div class="modal fade" id="exampleModal" tabindex="0" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Add Product</h5>
                                        <button type="button" onclick="closeAdd()" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="form-add-product" action="${pageContext.request.contextPath}/admin/product/addproduct" method="post">
                                            <div class="form-group">
                                                <label for="pid" class="col-form-label">PID: </label>
                                                <input name="pid" type="text" class="form-control" id="pid" value="">
                                            </div>
                                            <div class="form-group">
                                                <label for="name" class="col-form-label">Name: </label>
                                                <input name="name" type="text" class="form-control" id="pid" value="">                                           
                                            </div>
                                            <select name="brandid" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">

                                                <option selected>Open this select menu</option>
                                                <c:forEach items="${listbr}" var="br">
                                                    <option value="${br.brandid}">${br.brandname}</option>
                                                </c:forEach>
                                            </select>
                                            <div class="form-group">
                                                <label for="price" class="col-form-label">Price: </label>
                                                <input name="price" type="text" class="form-control" id="price" value="">                                           
                                            </div>
                                            <div class="form-group">
                                                <label for="review" class="col-form-label">Review: </label>
                                                <input name="review" type="text" class="form-control" id="review" value="">                                           
                                            </div>
                                            <div class="form-group">
                                                <label for="image_link" class="col-form-label">Image_link </label>
                                                <input name="image_link" type="text" class="form-control" id="image_link" value="">                                           
                                            </div>

                                            <input name="submit" type="hidden" class="form-control" value="true">

                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" onclick="closeAdd()" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdropAdd">
                                            Add
                                        </button>
                                    </div>  

                                    <script>
                                        function closeAdd() {
                                            $('#exampleModal').modal('hide');
                                        }
                                    </script>


                                </div>
                            </div>
                        </div>



                        <div class="modal fade" id="exampleModalEdit" tabindex="0" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Edit Product</h5>
                                        <button type="button" onclick="closeAdd()" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="form-edit-product" action="${pageContext.request.contextPath}/admin/product/editproduct" method="post">
                                            <div class="form-group">
                                                <label for="pid" class="col-form-label">PID: </label>
                                                <input name="pid" readonly class="form-control" id="pid" value="${pid}">
                                            </div>
                                            <div class="form-group">
                                                <label for="name" class="col-form-label">Name: </label>
                                                <input name="name" type="text" class="form-control" id="pid" value="${name}">                                           
                                            </div>
                                            <select name="brandid" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                                                <option selected value="${brandid}">${br.brandname}</option>
                                                <c:forEach items="${listbr}" var="br">                                                  
                                                    <c:choose>
                                                        <c:when test = "${brandid == br.brandid}">
                                                            <option value="${br.brandid}" selected>${br.brandname}</option>  
                                                        </c:when>

                                                        <c:when test = "${brandid != br.brandid}">
                                                            <option value="${br.brandid}">${br.brandname}</option> 
                                                        </c:when>
                                                        <c:otherwise>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                            <div class="form-group">
                                                <label for="price" class="col-form-label">Price: </label>
                                                <input name="price" type="text" class="form-control" id="price" value="${price}">                                           
                                            </div>
                                            <div class="form-group">
                                                <label for="review" class="col-form-label">Review: </label>
                                                <input name="review" type="text" class="form-control" id="review" value="${review}">                                           
                                            </div>
                                            <div class="form-group">
                                                <label for="image_link" class="col-form-label">Image_link </label>
                                                <input name="image_link" type="text" class="form-control" id="image_link" value="${image_link}">                                           
                                            </div>
                                            <input name="submit" type="hidden" class="form-control" value="true">
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" onclick="closeEdit()" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdropEdit">
                                            Edit
                                        </button>
                                    </div>  

                                    <script>
                                        function closeEdit() {
                                            $('#exampleModalEdit').modal('hide');
                                        }
                                    </script>
                                    <c:if test = "${openEdit == 'true'}">
                                        <script type="text/javascript">
                                            $(window).on('load', function () {
                                                $('#exampleModalEdit').modal('show');
                                            });
                                        </script>
                                    </c:if> 

                                </div>
                            </div>
                        </div>

                        <div class="modal fade" id="exampleModalDelete" tabindex="0" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Delete Product</h5>
                                        <button type="button" onclick="closeDelete()()" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="form-delete-product" action="${pageContext.request.contextPath}/admin/product/delete" method="post">
                                            <div class="form-group">
                                                <label for="pid" class="col-form-label">PID: </label>
                                                <input name="pid" readonly class="form-control" id="pid" value="${param.pid}">
                                            </div>

                                            <input name="submit" type="hidden" class="form-control" value="true">
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" onclick="closeDelete()" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdropDelete">
                                            Delete                                        </button>
                                    </div>  
                                    <script>
                                        function closeDelete() {
                                            $('#exampleModalDelete').modal('hide');
                                        }
                                    </script>
                                    <c:if test = "${param.openDelete == 'true'}">
                                        <script type="text/javascript">
                                            $(window).on('load', function () {
                                                $('#exampleModalDelete').modal('show');
                                            });
                                        </script>
                                    </c:if> 
                                </div>
                            </div>
                        </div>                                      



                        <!-- Button trigger modal -->
                        <!-- Modal -->
                        <div class="modal fade" id="staticBackdropAdd" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content add">
                                    <div class="modal-header add">
                                        <h5 class="modal-title add" id="staticBackdropLabel">Confirm</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        Add to product. Are you sure?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >Close</button>                                            
                                        <button class="btn btn-primary" type="submit" form="form-add-product" value="Submit">Submit</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal fade" id="staticBackdropEdit" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="0" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">Confirm</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        Edit. Are you sure?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >Close</button>                                            
                                        <button class="btn btn-primary" type="submit" form="form-edit-product" value="Submit">Submit</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal fade" id="staticBackdropDelete" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="0" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">Confirm</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        Delete. Are you sure?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >Close</button>                                            
                                        <button class="btn btn-primary" type="submit" form="form-delete-product" value="Submit">Submit</button>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </c:when>

                    <c:when test = "${tittle == 'inventory'}"> 
                        <table class="table table-responsive table-borderless">
                            <thead>
                                <tr class="bg-light">
                                    <th scope="col" ><input class="form-check-input" type="checkbox"></th>
                                    <th scope="col" >#PIID</th>
                                    <th scope="col" >Product ID</th>
                                    <th scope="col" >Product Name</th>
                                    <th scope="col" >Brand Name</th>
                                    <th scope="col" >Price</th>
                                    <th scope="col" >Review</th>
                                    <th scope="col" >Image_Link</th>
                                    <th scope="col" >Color</th>
                                    <th scope="col" >Size</th>
                                    <th scope="col" >Amount</th>
                                    <th scope="col" ></th>                            
                                    <th scope="col" class="text-end"><span>Edit</span></th>
                                </tr>
                            </thead>    
                            <tbody>
                            <caption>Management ${tittle}</caption>
                            <c:forEach items="${listfull}" var="product">
                                <tr>
                                    <th scope="row"><input class="form-check-input" type="checkbox"></th>
                                    <td>${product.piid}</td>
                                    <td>${product.pid}</td>
                                    <td>${product.name}</td>
                                    <td>${product.brandname}</td>
                                    <td>${product.price}</td>
                                    <td>${product.review}</td>
                                    <td><img src="${product.image_link}" alt="Girl in a jacket" width="100" height="100"></td>
                                    <td>${product.colorname}</td>
                                    <td>${product.size}</td>
                                    <td>${product.amount}</td>
                                    <td><button class="btn btn-primary" onclick="window.location.href = '${pageContext.request.contextPath}/admin/inventory/edit?piid=${product.piid}&amount=${product.amount}&openEdit=true'">Edit</button></td>                                    

                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>    


                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Add New</button>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalEdit" data-whatever="@mdo">Edit Quantity</button>

                        <div class="modal fade" id="exampleModal" tabindex="0" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Add Inventory</h5>
                                        <button type="button" onclick="closeAdd()" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="form-add-inventory" action="${pageContext.request.contextPath}/admin/inventory/add" method="post">
                                            <div class="form-group">
                                                <label for="pid" class="col-form-label">PID: </label>
                                                <input name="pid" type="text" class="form-control" id="pid" value="">
                                            </div>
                                            <div class="form-group">
                                                <label for="size" class="col-form-label">Size: </label>
                                                <input name="size" type="text" class="form-control" id="size" value="">                                           
                                            </div>
                                            <select name="colorid" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                                                <option selected>Choose Color</option>
                                                <c:forEach items="${listcl}" var="cl">
                                                    <option value="${cl.colorid}">${cl.colorname}</option>
                                                </c:forEach>
                                            </select>
                                            <div class="form-group">
                                                <label for="amount" class="col-form-label">Quantity: </label>
                                                <input name="amount" type="text" class="form-control" id="amount" value="">                                           
                                            </div>


                                            <input name="submit" type="hidden" class="form-control" value="true">

                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" onclick="closeAdd()" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdropAdd">
                                            Add
                                        </button>
                                    </div>  

                                    <script>
                                        function closeAdd() {
                                            $('#exampleModal').modal('hide');
                                        }
                                    </script>
                                </div>
                            </div>
                        </div>


                        <div class="modal fade" id="exampleModalEdit" tabindex="0" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Edit Inventory</h5>
                                        <button type="button" onclick="closeAdd()" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="form-edit-inventory" action="${pageContext.request.contextPath}/admin/inventory/edit" method="post">
                                            <div class="form-group">
                                                <label for="piid" class="col-form-label">PIID: </label>
                                                <input name="piid" readonly class="form-control" id="piid" value="${param.piid}">
                                            </div>

                                            <div class="form-group">
                                                <label for="amount" class="col-form-label">Quantity: </label>
                                                <input name="amount" type="text" class="form-control" id="amount" value="${param.amount}">                                           
                                            </div>

                                            <input name="submit" type="hidden" class="form-control" value="true">
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" onclick="closeEdit()" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdropEdit">
                                            Edit
                                        </button>
                                    </div>  
                                    <script>
                                        function closeEdit() {
                                            $('#exampleModalEdit').modal('hide');
                                        }
                                    </script>
                                    <c:if test = "${param.openEdit == 'true'}">
                                        <script type="text/javascript">
                                            $(window).on('load', function () {
                                                $('#exampleModalEdit').modal('show');
                                            });
                                        </script>
                                    </c:if> 
                                </div>
                            </div>
                        </div>                   





                        <!-- Button trigger modal -->
                        <!-- Modal -->
                        <div class="modal fade" id="staticBackdropAdd" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">Add confirm</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        Are you sure?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >Close</button>                                            
                                        <button class="btn btn-primary" type="submit" form="form-add-inventory" value="Submit">Submit</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal fade" id="staticBackdropEdit" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">Edit confirm</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        Are you sure?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >Close</button>                                            
                                        <button class="btn btn-primary" type="submit" form="form-edit-inventory" value="Submit">Submit</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </c:when>
                    <c:when test = "${tittle == 'brand'}"> 
                        <table class="table table-responsive table-borderless">
                            <thead>
                                <tr class="bg-light">
                                    <th scope="col" >#BrandID</th>
                                    <th scope="col" >Brand Name</th>
                                    <th scope="col" ></th>                            
                                    <th scope="col" class="text-end"><span>Edit</span></th>
                                </tr>
                            </thead>    
                            <tbody>
                            <caption>Management ${tittle}</caption>
                            <c:forEach items="${brand}" var="brand">
                                <tr>
                                    <td>${brand.brandid}</td>
                                    <td>${brand.brandname}</td>
                                    <td><a href="${pageContext.request.contextPath}/admin/brand?delete=true&brandid=${brand.brandid}">Delete</a></td>
                                    <td class="text-end"><span class="fw-bolder" ><a href="${pageContext.request.contextPath}/admin/brand?edit=true&brandid=${brand.brandid}&brandname=${brand.brandname}">Edit</a> </span> <i class="fa fa-ellipsis-h ms-2"></i></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>    
                        <c:choose>
                            <c:when test = "${edit == 'true'}">
                                <div class="input-group flex-nowrap">
                                    <form class="submit-edit" autocomplete="off" method="post">
                                        <div id="focus"></div>
                                        <h1>Edit</h1>
                                        <label for="brandid">Brand ID:</label><br><input id="brandname" readonly class="form-control" aria-label="Username" aria-describedby="addon-wrapping" name="editbrandid" type="text" value="${param.brandid}" autocomplete="off">
                                        <br><br>
                                        <label for="brandname">Brand Name:</label><br><input id="brandname" class="form-control" aria-label="Username" aria-describedby="addon-wrapping" name="editbrandname" type="text" value="${param.brandname}" autocomplete="off">                              
                                        <br><br>
                                        <input name="submit" type="hidden" value="true" autocomplete="off">
                                        <div class="input-group mb-3">
                                            <button class="btn btn-outline-secondary" type="submit" form="submit-edit" id="button-addon2">Submit</button>
                                        </div>

                                </div> 
                                </form> 
                                <br>
                            </div>


                            <form id="exit-edit" autocomplete="off">
                                <input id="edit" name="edit" type="hidden" value="false" autocomplete="off">                                  
                            </form> 

                            <div class="input-group mb-3">
                                <input id="edit" name="edit" type="hidden" value="true" autocomplete="off">                                
                                <button class="btn btn-outline-secondary" type="submit" form="exit-edit" id="button-addon2">Exit edit</button>
                            </div>



                        </c:when>
                        <c:when test = "${edit == 'false'}">
                            <p>${errorEditBrand}</p>
                        </form> 
                        <form id="edit" autocomplete="off">
                            <input id="edit" name="edit" type="hidden" value="true" autocomplete="off">
                            <br><br>            
                        </form> 

                        <div class="input-group mb-3">
                            <input id="edit" name="edit" type="hidden" value="true" autocomplete="off">                                
                            <button class="btn btn-outline-secondary" type="submit" form="edit" id="button-addon2">Edit</button>
                        </div>
                        <link rel="stylesheet" href="${pageContext.request.contextPath}/js/form.js">
                    </c:when>
                    <c:otherwise>

                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test = "${add == 'true'}">
                        <form class="add" autocomplete="off" method="post">
                            <div id="focus"></div>
                            <h1>Add</h1>
                            <br><br>
                            <label for="addbrandname">Brand Name:</label><br><input id="brandname" name="addbrandname" type="text" placeholder="Brand" autocomplete="off">                              
                            <br><br>
                            <input name="submitadd" type="hidden" value="true" autocomplete="off">
                            <input type="submit" value="Send it">       
                        </form> 
                        <br>
                        <form class="exit" autocomplete="off">
                            <input id="add" name="add" type="hidden" value="false" autocomplete="off">
                            <input type="submit" value="Exit add"> 
                        </form> 
                    </c:when>

                    <c:when test = "${add == 'false'}">
                        <p>${errorEditBrand}</p>

                        <form class="exit" autocomplete="off">
                            <input id="add" name="add" type="hidden" value="true" autocomplete="off">
                            <br><br>
                            <input type="submit" value="Add"> 
                        </form> 
                        <link rel="stylesheet" href="${pageContext.request.contextPath}/js/form.js">
                    </c:when>   
                    <c:otherwise>

                    </c:otherwise>
                </c:choose>

                <c:choose>
                    <c:when test = "${delete == 'true'}">
                        <form class="add" autocomplete="off" method="post">
                            <div id="focus"></div>
                            <h1>Delete Brand Not Used With 0 Product - 0 Order - 0 Cart</h1>
                            <p style:color="red";>${errorDeleteBrand}</p>
                            <br><br>
                            <label for="deletebrandid">Brand ID:</label><br><input id="brandname" name="deletebrandid" type="text" value="${param.brandid}" autocomplete="off">                              
                            <br><br>
                            <input name="submitdelete" type="hidden" value="true" autocomplete="off">
                            <input type="submit" value="Send it">       
                        </form> 
                        <br>
                        <form class="exit" autocomplete="off">
                            <input id="delete" name="delete" type="hidden" value="false" autocomplete="off">
                            <input type="submit" value="Exit Delete"> 
                        </form> 
                    </c:when>

                    <c:when test = "${delete == 'false'}">
                        <p>${errorEditBrand}</p>
                    </form> 
                    <form class="exit" autocomplete="off">
                        <input id="delete" name="delete" type="hidden" value="true" autocomplete="off">
                        <br><br>
                        <input type="submit" value="Delete"> 
                    </form> 
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/form.js">
                </c:when>   

                <c:otherwise>

                </c:otherwise>
            </c:choose>



        </c:when>



        <c:when test = "${tittle == 'color'}"> 
            <table class="table table-responsive table-borderless">
                <thead>
                    <tr class="bg-light">
                        <th scope="col" ><input class="form-check-input" type="checkbox"></th>
                        <th scope="col" >#ColorID</th>
                        <th scope="col" >Color Name</th>

                        <th scope="col" ></th>                            
                        <th scope="col" class="text-end"><span>Edit</span></th>
                    </tr>
                </thead>    
                <tbody>
                <caption>Management ${tittle}</caption>
                <c:forEach items="${color}" var="color">
                    <tr>
                        <th scope="row"><input class="form-check-input" type="checkbox"></th>   
                        <td>${color.colorid}</td>
                        <td>${color.colorname}</td>
                        <td class="text-end"><span class="fw-bolder"> </span> <i class="fa fa-ellipsis-h ms-2"></i></td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>    

            <c:choose>
                <c:when test = "${edit == 'true'}">
                    <form class="edit" autocomplete="off" method="post">
                        <div id="focus"></div>
                        <h1>Edit</h1>

                        <label for="colorid">Color ID:</label><br><input id="colorid" name="editcolorid" type="text" value="${param.colorid}" autocomplete="off">
                        <br><br>
                        <label for="colorname">Color Name:</label><br><input id="colorname" name="editcolorname" type="text" value="${param.colorname}" autocomplete="off">                              
                        <br><br>
                        <input name="submit" type="hidden" value="true" autocomplete="off">
                        <input type="submit" value="Send it">       
                    </form> 
                    <br>
                    <form class="exit" autocomplete="off">
                        <input id="edit" name="edit" type="hidden" value="false" autocomplete="off">
                        <input type="submit" value="Exit edit"> 
                    </form> 
                </c:when>

                <c:when test = "${edit == 'false'}">
                    <p style="color:red;">${errorEditColor}</p>
                </form> 
                <form class="exit" autocomplete="off">
                    <input id="edit" name="edit" type="hidden" value="true" autocomplete="off">
                    <br><br>
                    <input type="submit" value="Edit"> 
                </form> 

                <link rel="stylesheet" href="${pageContext.request.contextPath}/js/form.js">
            </c:when>

            <c:otherwise>
                Edit
            </c:otherwise>
        </c:choose>

        <c:choose>
            <c:when test = "${add == 'true'}">
                <form class="add" autocomplete="off" method="post">
                    <div id="focus"></div>
                    <h1>Add</h1>

                    <br><br>
                    <label for="addcolorname">Color Name:</label><br><input id="addcolorname" name="addcolorname" type="text" placeholder="Color" autocomplete="off">                              
                    <br><br>
                    <input name="submitadd" type="hidden" value="true" autocomplete="off">
                    <input type="submit" value="Send it">       
                </form> 
                <br>
                <form class="exit" autocomplete="off">
                    <input id="add" name="add" type="hidden" value="false" autocomplete="off">
                    <input type="submit" value="Exit add"> 
                </form> 
            </c:when>

            <c:when test = "${add == 'false'}">
                <p style="color:red;">${errorAddColor}</p>
            </form> 
            <form class="exit" autocomplete="off">
                <input id="add" name="add" type="hidden" value="true" autocomplete="off">
                <br><br>
                <input type="submit" value="Add"> 
            </form> 
            <link rel="stylesheet" href="${pageContext.request.contextPath}/js/form.js">
        </c:when>   
        <c:otherwise>

        </c:otherwise>
    </c:choose>

    <c:choose>
        <c:when test = "${delete == 'true'}">
            <form class="add" autocomplete="off" method="post">
                <div id="focus"></div>
                <h1>Delete</h1>
                <p>Delete Color Not Used With 0 Product - 0 Order - 0 Cart</p>
                <p style="color:red;";>${errorDeleteColor}</p>
                <br><br>
                <label for="deletecolorid">COLOR ID:</label><br><input id="colorid" name="deletecolorid" type="text" value="${param.colorid}" autocomplete="off">                              
                <br><br>
                <input name="submitdelete" type="hidden" value="true" autocomplete="off">
                <input type="submit" value="Send it">       
            </form> 
            <br>
            <form class="exit" autocomplete="off">
                <input id="delete" name="delete" type="hidden" value="false" autocomplete="off">
                <input type="submit" value="Exit Delete"> 
            </form> 
        </c:when>

        <c:when test = "${delete == 'false'}">
            <p>${errorEditColor}</p>
        </form> 
        <form class="exit" autocomplete="off">
            <input id="delete" name="delete" type="hidden" value="true" autocomplete="off">
            <br><br>
            <input type="submit" value="Delete"> 
        </form> 
        <link rel="stylesheet" href="${pageContext.request.contextPath}/js/form.js">
    </c:when>   

    <c:otherwise>

    </c:otherwise>
</c:choose>     

</c:when>

<c:otherwise>
</c:otherwise>


</c:choose>



















</div>
</div>

</body>
</html>
