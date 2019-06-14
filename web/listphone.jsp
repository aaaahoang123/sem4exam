<%@ page import="java.util.List" %>
<%@ page import="entities.Phone" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: shink
  Date: 6/14/2019
  Time: 10:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Phone> datas = (List<Phone>) request.getAttribute("data");
    if (datas == null) {
        datas = new ArrayList<>();
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

            <table class="table">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Name</th>
                    <th scope="col">Brand</th>
                    <th scope="col">Price</th>
                    <th scope="col">Desc</th>
                </tr>
                </thead>
                <tbody>
                <%
                    for (Phone phone: datas) { %>
                        <tr>
                            <th scope="row"><%= phone.getId()%></th>
                            <td><%= phone.getName()%></td>
                            <td><%= phone.getBrand()%></td>
                            <td><%= phone.getPrice()%></td>
                            <td><%= phone.getDescription()%></td>
                        </tr>
                    <%}
                %>
                </tbody>
            </table>

        </div>
    </div>
</div>
</body>
</html>
