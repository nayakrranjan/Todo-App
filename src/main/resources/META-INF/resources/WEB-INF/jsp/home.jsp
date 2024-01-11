<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><html>
    <head>
        <title>Home</title>
        <link href="webjars/bootstrap/5.1.3/css/bootstrap.css"
              rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
    <%@include file="common/navbar.jsp"%>
        <div>
            <div class="container">
                <div class="d-inline">
                    <h4 class="d-inline">My Todos: </h4>
                    <a href="add-todo" class="btn btn-success float-end border" style="margin-right: 50px">
                        <i style="font-size:24px" class="fa">&#xf067;</i>
                    </a>
                </div>
                <table class="table mt-3">
                    <thead>
                    <tr>
                        <th></th>
                        <th>Task</th>
                        <th>Target Date</th>
                        <th>Status</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${todos}" var="todo">
                        <tr>
                            <td></td>
                            <td>${todo.task}</td>
                            <td>${todo.targetDate}</td>
                            <td>
                                <label>
                                    <input type="checkbox" ${todo.done ? "checked='checked'" : ""} disabled/>
                                </label>
                            </td>
                            <%--<td>${todo.done}</td>--%>
                            <td><a href="update-todo?id=${todo.id}" class="btn btn-success"><i class="material-icons">&#xe3c9;</i></a> </td>
                            <td><a href="delete-todo?id=${todo.id}" class="btn btn-danger"><i class="material-icons">delete</i></a> </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <script href="\META-INF\resources\webjars\bootstrap\5.1.3\js\bootstrap.min.js"></script>
        <script href="META-INF\resources\webjars\jquery\3.7.1\jquery.min.js"></script>
    </body>
</html>
