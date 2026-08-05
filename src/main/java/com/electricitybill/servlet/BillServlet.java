package com.electricitybill.servlet;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Receives electricity bill form submissions, calculates the bill, and forwards
 * the result to the JSP view.
 */
@WebServlet("/calculate-bill")
public class BillServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * Reads and validates submitted customer information before showing the
     * calculated bill on result.jsp.
     *
     * @param request incoming form request
     * @param response response sent to the browser
     * @throws ServletException if forwarding to a JSP fails
     * @throws IOException if an input/output error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String customerName = request.getParameter("customerName");
        String unitsText = request.getParameter("unitsConsumed");

        if (customerName == null || customerName.trim().isEmpty()) {
            showFormError(request, response, "Please enter the customer name.");
            return;
        }

        try {
            double unitsConsumed = Double.parseDouble(unitsText);
            if (unitsConsumed < 0) {
                showFormError(request, response, "Units consumed cannot be negative.");
                return;
            }

            BigDecimal totalBill = calculateBill(unitsConsumed);
            request.setAttribute("customerName", customerName.trim());
            request.setAttribute("unitsConsumed", unitsConsumed);
            request.setAttribute("totalBill", totalBill);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/result.jsp");
            dispatcher.forward(request, response);
        } catch (NumberFormatException exception) {
            showFormError(request, response, "Please enter a valid number of units.");
        }
    }

    /**
     * Calculates the bill using slab rates: 50 units at Rs. 3.50, the next 100
     * at Rs. 4.00, the next 100 at Rs. 5.20, and remaining units at Rs. 6.50.
     *
     * @param unitsConsumed total number of units used
     * @return final bill rounded to two decimal places
     */
    private BigDecimal calculateBill(double unitsConsumed) {
        double remainingUnits = unitsConsumed;
        double billAmount = 0;

        double firstSlabUnits = Math.min(remainingUnits, 50);
        billAmount += firstSlabUnits * 3.50;
        remainingUnits -= firstSlabUnits;

        if (remainingUnits > 0) {
            double secondSlabUnits = Math.min(remainingUnits, 100);
            billAmount += secondSlabUnits * 4.00;
            remainingUnits -= secondSlabUnits;
        }

        if (remainingUnits > 0) {
            double thirdSlabUnits = Math.min(remainingUnits, 100);
            billAmount += thirdSlabUnits * 5.20;
            remainingUnits -= thirdSlabUnits;
        }

        if (remainingUnits > 0) {
            billAmount += remainingUnits * 6.50;
        }

        return BigDecimal.valueOf(billAmount).setScale(2, RoundingMode.HALF_UP);
    }

    /**
     * Returns the user to the form while preserving a friendly validation error.
     *
     * @param request incoming form request
     * @param response response sent to the browser
     * @param message validation message to display
     * @throws ServletException if forwarding fails
     * @throws IOException if an input/output error occurs
     */
    private void showFormError(HttpServletRequest request, HttpServletResponse response, String message)
            throws ServletException, IOException {
        request.setAttribute("errorMessage", message);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
