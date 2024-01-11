<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>My Todo - Add Todo</title>
    <link href="webjars/bootstrap/5.1.3/css/bootstrap.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            margin-top: 50px;
        }

        .card {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
<%@include file="common/navbar.jsp"%>
<div class="container">
    <div class="card p-4">
        <form:form method="post" modelAttribute="todo">
            <div class="mb-3">
                <form:label path="task" class="form-label">Task</form:label>
                <form:input type="text" path="task" class="form-control" required="required"/>
                <form:errors path="task" cssClass="text-warning"/>
            </div>
            <div class="mb-3">
                <form:label path="targetDate" class="form-label">Target Date</form:label>
                <form:input type="date" value="${todo.targetDate}" path="targetDate" class="form-control"/>
                <form:errors path="targetDate" cssClass="text-warning"/>
            </div>
            <div class="mb-3 form-check">
                <form:checkbox path="done" class="form-check-input"/>
                <form:label path="done" class="form-check-label">Done</form:label>
            </div>
            <form:input type="hidden" path="id" />
            <button type="submit" class="btn btn-success">Add Todo</button>
        </form:form>
    </div>
</div>

<script src="\META-INF\resources\webjars\jquery\3.7.1\jquery.min.js"></script>
<script src="\META-INF\resources\webjars\bootstrap\5.1.3\js\bootstrap.bundle.min.js"></script>
</body>
</html>
