<%@ page import="java.util.Map" %>
<%@ page import="entities.Phone" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: shink
  Date: 6/14/2019
  Time: 10:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Map<String, String> errors = (Map<String, String>) request.getAttribute("errors");
    if (errors == null) {
        errors = new HashMap<>();
    }
    Phone old = (Phone) request.getAttribute("old");
    if (old == null) {
        old = new Phone();
    }
%>
<html>
<head>
    <title>Thêm phone</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>

<div class="ebanking">
    <h2 class="box-title text-center"><span>Add phone</span></h2>
    <div class="form-group col-xs-12">
        <div style="padding: 15px;margin-left: 10px;">

            <form method="post">
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" name="name" value="<%= old.getName() != null ? old.getName() : ""%>" id="name">
                    <% if (errors.get("name") != null) {%>
                        <%= errors.get("name")%>
                    <%}%>
                </div>
                <div class="form-group">
                    <label for="brand">Brand</label>
                    <select id="brand" name="brand" class="form-control">
                        <option value="Apple" selected>Apple</option>
                        <option value="Samsung">Samsung</option>
                        <option value="Nokia">Nokia</option>
                        <option value="Other"></option>
                    </select>
                    <% if (errors.get("brand") != null) {%>
                    <%= errors.get("brand")%>
                    <%}%>
                </div>

                <div class="form-group">
                    <label for="price">Price</label>
                    <input type="number" name="price" value="<%= old.getPrice() != 0 ? old.getPrice() : ""%>" class="form-control" id="price">
                    <% if (errors.get("price") != null) {%>
                    <%= errors.get("price")%>
                    <%}%>
                </div>

                <div class="form-group">
                    <label for="description">Description</label>
                    <input type="text" name="description" value="<%= old.getDescription() != null ? old.getDescription() : ""%>" class="form-control" id="description">
                    <% if (errors.get("description") != null) {%>
                    <%= errors.get("description")%>
                    <%}%>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
                <button type="reset" class="btn btn-default">Reset</button>
            </form>

        </div>
    </div>
</div>
</body>
</html>

