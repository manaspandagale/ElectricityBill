<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Electricity Bill Calculator</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body class="bg-light">
    <main class="container py-5">
        <div class="row justify-content-center">
            <div class="col-12 col-md-8 col-lg-6">
                <div class="card shadow-sm border-0">
                    <div class="card-body p-4 p-md-5">
                        <h1 class="h3 text-center mb-2">Electricity Bill Calculator</h1>
                        <p class="text-muted text-center mb-4">Enter the consumption details to calculate the bill.</p>

                        <% if (request.getAttribute("errorMessage") != null) { %>
                            <div class="alert alert-danger" role="alert">
                                <%= request.getAttribute("errorMessage") %>
                            </div>
                        <% } %>

                        <form action="${pageContext.request.contextPath}/calculate-bill" method="post">
                            <div class="mb-3">
                                <label for="customerName" class="form-label">Customer Name</label>
                                <input type="text" class="form-control" id="customerName" name="customerName"
                                       placeholder="Enter customer name" required>
                            </div>
                            <div class="mb-4">
                                <label for="unitsConsumed" class="form-label">Units Consumed</label>
                                <input type="number" class="form-control" id="unitsConsumed" name="unitsConsumed"
                                       placeholder="Enter units consumed" min="0" step="0.01" required>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Calculate Bill</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>
