<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Electricity Bill Result</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body class="bg-light">
    <main class="container py-5">
        <div class="row justify-content-center">
            <div class="col-12 col-md-8 col-lg-6">
                <div class="card shadow-sm border-0">
                    <div class="card-body p-4 p-md-5">
                        <h1 class="h3 text-center mb-4">Electricity Bill Summary</h1>
                        <div class="table-responsive">
                            <table class="table table-bordered align-middle mb-4">
                                <tbody>
                                    <tr>
                                        <th scope="row" class="w-50">Customer Name</th>
                                        <td>${customerName}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Units Consumed</th>
                                        <td><fmt:formatNumber value="${unitsConsumed}" maxFractionDigits="2" /> units</td>
                                    </tr>
                                    <tr class="table-success">
                                        <th scope="row">Total Electricity Bill</th>
                                        <td><strong>Rs. <fmt:formatNumber value="${totalBill}" minFractionDigits="2" maxFractionDigits="2" /></strong></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-outline-primary w-100">Calculate Another Bill</a>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>
