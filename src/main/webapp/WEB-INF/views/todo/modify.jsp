<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>임시 수정폼</title>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand" href="/todo/list">Navbar</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="/todo/register">글쓰기</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Features</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Pricing</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
        <div class="row content">
            <div class="col">
                <div class="card">
                    <div class="card-header">
                        수정 화면
                    </div>
                    <div class="card-body">
                        <form action="_7_260226/todo/modify" method="post" >
                            <input type="hidden" name="page" value="${pageRequestDTO.page}">
                            <input type="hidden" name="size" value="${pageRequestDTO.size}">
                            <div class="input-group mb-3">
                                <span class="input-group-text">Tno:</span>
                                <input class="form-control" type="text" name="tno"
                                       value='<c:out value="${dto.tno}"></c:out>' readonly>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text">Title:</span>
                                <input class="form-control" type="text" name="title"
                                       value='<c:out value="${dto.title}"></c:out>'>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text">DueDate: </span>
                                <input class="form-control" type="date" name="dueDate"
                                       value='<c:out value="${dto.dueDate}"></c:out>'>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text"> Writer:  </span>
                                <input class="form-control" type="text" name="writer"
                                       value='<c:out value="${dto.writer}"></c:out>' readonly>
                            </div>
                            <div class="form-check mb-3">
                                <span class="form-check-label">  Finished:  </span>
                                <input class="form-check-input" type="checkbox" name="finished"
                                ${dto.finished? "checked" :""}>
                            </div>
                            <div>
                                <button class="btn btn-danger" type="button">삭제하기</button>
                                <button class="btn btn-primary" type="button">수정하기</button>
                                <button class="btn btn-secondary" type="button">목록가기</button>
                            </div>
                        </form>
                        <script>
                            const serverValidResult = {}
                            let errorString = ""

                            <c:if test="${not empty errors}">
                                <c:forEach items="${errors}" var="error">
                                    <c:set var="field" value="${error.field}"/>
                                    <c:set var="message" value="${error.defaultMessage}"/>
                                    serverValidResult['${field}'] = '${message}'
                                    errorString += '${field} = ${message}\n'
                                </c:forEach>
                                errorString += "값 제대로 적어라"
                                console.log("유효성 오류가 난 부분들 : ", serverValidResult)
                                alert(errorString)
                            </c:if>

                            document.querySelector(".btn-secondary").addEventListener("click", function (e) {
                                    self.location = "/todo/list?${pageRequestDTO.link}"
                                },false
                            )

                            document.querySelector(".btn-primary").addEventListener("click", function (e) {
                                const formModi = document.querySelector("form");
                                e.preventDefault();
                                e.stopPropagation();

                                formModi.action = "/todo/modify";
                                formModi.method = "post";
                                formModi.submit();
                                }, false
                            )
                            document.querySelector(".btn-danger").addEventListener("click", function (e) {
                                const formObj = document.querySelector("form");

                                e.preventDefault();
                                e.stopPropagation();

                                formObj.action = `/todo/delete?${pageRequestDTO.link}`;
                                formObj.method = "post";
                                formObj.submit();
                                },false
                            )
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row content">
    </div>
    <div class="row footer">
        <footer class="py-3 mt-auto">
            <p class="text-center text-muted mb-0">
                Footer
            </p>
        </footer>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

</body>
</html>
