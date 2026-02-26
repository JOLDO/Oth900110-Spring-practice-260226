<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <title>Todo 등록</title>
    <style>
        body {
            background-color: #1a001a;
        }

        .navbar {
            background-color: #ff007f !important;
            border-bottom: 4px solid #ff00ff;
        }

        .navbar-brand, .nav-link {
            color: white !important;
            font-weight: 900;
            font-size: 1.1rem;
            text-shadow: 0 0 8px #ff00ff;
        }

        .nav-link:hover {
            color: #ff00ff !important;
        }

        .card {
            border: 4px solid #ff007f;
            border-radius: 20px;
            box-shadow: 0 0 30px #ff007f, 0 0 60px #ff00ff;
        }

        .card-header {
            background: linear-gradient(135deg, #ff007f, #ff00ff);
            color: white;
            font-size: 1.6rem;
            font-weight: 900;
            border-radius: 15px 15px 0 0 !important;
            text-align: center;
            letter-spacing: 4px;
            text-shadow: 0 0 10px white;
        }

        .card-body {
            background-color: #2d0020;
            border-radius: 0 0 15px 15px;
        }

        .form-label {
            color: #ff007f;
            font-weight: 900;
            font-size: 1.05rem;
            text-shadow: 0 0 6px #ff007f;
        }

        .form-control {
            background-color: #1a001a;
            border: 2px solid #ff007f;
            color: #ff99cc;
        }

        .form-control::placeholder {
            color: #aa4466;
        }

        .form-control:focus {
            background-color: #1a001a;
            border-color: #ff00ff;
            color: #ff99cc;
            box-shadow: 0 0 0 0.25rem rgba(255, 0, 255, 0.4);
        }

        .btn-pink {
            background: linear-gradient(135deg, #ff007f, #ff00ff);
            color: white;
            border: none;
            font-weight: 900;
            font-size: 1.1rem;
            box-shadow: 0 0 15px #ff007f;
            letter-spacing: 2px;
        }

        .btn-pink:hover {
            background: linear-gradient(135deg, #ff00ff, #ff007f);
            color: white;
            box-shadow: 0 0 25px #ff00ff;
            transform: scale(1.05);
        }

        .btn-outline-pink {
            border: 2px solid #ff007f;
            color: #ff007f;
            font-weight: 900;
            text-shadow: 0 0 6px #ff007f;
        }

        .btn-outline-pink:hover {
            background-color: #ff007f;
            color: white;
            box-shadow: 0 0 15px #ff007f;
        }

        footer {
            color: #ff007f;
            font-weight: bold;
            text-shadow: 0 0 8px #ff00ff;
        }

        h1.title {
            color: #ff007f;
            font-weight: 900;
            font-size: 2.5rem;
            text-shadow: 0 0 10px #ff007f, 0 0 30px #ff00ff;
            text-align: center;
            margin: 30px 0;
            letter-spacing: 4px;
        }

        .form-check-input:checked {
            background-color: #ff00ff;
        }

        input[type="date"]::-webkit-calendar-picker-indicator {
            filter: invert(1);
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col">
                <nav class="navbar navbar-expand-lg navbar-dark">
                    <div class="container-fluid">
                            <a class="navbar-brand" href="/todo/list">Navbar</a>
                            <img src="/resources/bug.jpg"
                                 alt="호빵맨"
                                 width="50"
                                 height="50">
                            Todo
                        </a>
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
                                    <a class="nav-link" href="#">Todo 목록</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">등록</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <h1 class="title">상남자의 Todo 등록</h1>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        Todo 등록하기
                    </div>
                    <div class="card-body p-4">
                        <form action="/todo/register" method="post">
                            <div class="mb-3">
                                <label class="form-label">Title</label>
                                <input type="text" class="form-control" name="title" placeholder="할 일을 입력해주세요.">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">DueDate</label>
                                <input type="date" class="form-control" name="dueDate">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Writer</label>
                                <input type="text" class="form-control" name="writer" placeholder="작성자 이름">
                            </div>
                            <div class="mb-3 form-check form-switch">
                                <input type="checkbox" class="form-check-input" name="finished" id="finished"
                                       style="border-color: #ff69b4;">
                                <label class="form-check-label" id="finishedLabel" for="finished" style="color: #c2185b; font-weight: bold;">
                                    Finished : Off
                                </label>
                            </div>
                            <div class="d-flex gap-2 justify-content-end">
                                <button type="reset" class="btn btn-outline-pink">초기화</button>
                                <button type="submit" class="btn btn-pink">등록하기</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="row fixed-bottom" style="z-index: -100">
            <footer class="py-2 my-2">
                <p class="text-center">핑크핑크 Todo App</p>
            </footer>
        </div>

    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

    <script>
        const serverValidResult = {}
        let errorString = ""
        document.getElementById('finished')
            .addEventListener('change', function() {
                document.getElementById('finishedLabel').innerText
                    = this.checked ? 'Finished : On' : 'Finished : Off';
            });

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
    </script>

</body>
</html>