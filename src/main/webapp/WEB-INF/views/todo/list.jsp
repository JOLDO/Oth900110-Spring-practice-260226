<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>임시리스트</title>
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
                        검색창 화면
                    </div>
                    <div class="card-body">
                        <form action="/todo/list" method="get">
                            <input type="hidden" name="size" value="${pageRequestDTO.size}">
                            <div class="mb-3">
                                <input type="checkbox" name="finished"
                                ${pageRequestDTO.finished ? "checked" : ""}
                                > 완료여부
                            </div>
                            <div class="mb-3">
                                <input type="checkbox" name="types" value="t"
                                    ${pageRequestDTO.checkType("t") ? "checked" : ""}
                                > 제목
                                <input type="checkbox" name="types" value="w"
                                    ${pageRequestDTO.checkType("w") ? "checked" : ""}
                                > 작성자
                                <input type="text" name="keyword" class="form-control"
                                    value='<c:out value="${pageRequestDTO.keyword}"/>'
                                >
                            </div>
                            <div class="mb-3 input-group dueDateDiv">
                                <input type="date" name="from" class="form-control"
                                    value="${pageRequestDTO.from}"
                                >
                                <input type="date" name="to" class="form-control"
                                    value="${pageRequestDTO.to}"
                                >
                            </div>
                            <div class="mb-3 input-group">
                                <div class="float-end">
                                    <button type="submit" class="btn btn-primary">검색하기</button>
                                    <button type="reset" class="btn btn-info clearBtn">초기화하기</button>
                                </div>
                            </div>
                            <script>
                                document.querySelector(".clearBtn").addEventListener("click", function (e) {
                                    e.preventDefault();
                                    e.stopPropagation();
                                    self.location = "/todo/list"
                                })
                            </script>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="row content">
            <div class="col">
                <div class="card">
                    <div class="card-header">
                        전체목록
                    </div>
                    <div class="card-body">
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">Tno</th>
                                <th scope="col">Title</th>
                                <th scope="col">Writer</th>
                                <th scope="col">DueDate</th>
                                <th scope="col">Finished</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${responseDTO.dtoList}" var="dto">
                                <tr>
                                    <th><c:out value="${dto.tno}"/></th>
                                    <td>
                                        <a href="/todo/read?tno=${dto.tno}&${pageRequestDTO.link}" class="text-decoration-none">
                                            <c:out value="${dto.title}"/>
                                        </a>
                                    </td>
                                    <td><c:out value="${dto.writer}"/></td>
                                    <td><c:out value="${dto.dueDate}"/></td>
                                    <td><c:out value="${dto.finished}"/></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center">
                            <ul class="pagination flex-wrap">
                                <c:if test="${responseDTO.prev}">
                                    <li class="page-item">
                                        <a class="page-link" data-num="${responseDTO.start - 1}">Previous</a>
                                    </li>
                                </c:if>

                                <c:forEach begin="${responseDTO.start}" end="${responseDTO.end}" var="num">
                                    <li class="page-item ${responseDTO.page == num ? "active" : ""}">
                                        <a class="page-link" data-num="${num}">${num}</a>
                                    </li>
                                </c:forEach>
                                <c:if test="${responseDTO.next}">
                                    <li class="page-item">
                                        <a class="page-link" data-num="${responseDTO.end + 1}">Next</a>
                                    </li>
                                </c:if>
                            </ul>
                        </div>
                        <script>
                            document.querySelector(".pagination").addEventListener("click", function(e) {
                                e.preventDefault();
                                e.stopPropagation();
                                const target = e.target;
                                if(target.tagName !== 'A') {
                                    return;
                                }
                                const num = target.getAttribute("data-num");

                                console.log(`페이지\${num}`);
                                const formObj = document.querySelector("form")
                                formObj.innerHTML += `<input type='hidden' name='page' value='\${num}'>`;
                                formObj.submit();
                            }, false);
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
