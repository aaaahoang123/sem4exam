package controllers;

import entities.Phone;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/addphone")
public class AddPhoneController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/addphone.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String, String> errors = new HashMap<>();
        Phone phone = new Phone();
        String name = req.getParameter("name");
        String brand = req.getParameter("brand");
        String description = req.getParameter("description");
        String priceStr = req.getParameter("price");
        if (name == null)
            errors.put("name", "Name can not be blank");
        phone.setName(req.getParameter("name"));

        if (brand == null)
            errors.put("brand", "Please select a brand");
        phone.setBrand(brand);

        if (description == null)
            errors.put("description", "Please enter some description");
        phone.setDescription(description);

        try {
            phone.setPrice(Integer.parseInt(priceStr));
        } catch (Exception e) {
            errors.put("price", "Invalid price");
            phone.setPrice(0);
        }


        if (errors.isEmpty()) {
            try {
                phone.save();
                resp.sendRedirect("/listphone");
                return;
            } catch (ClassNotFoundException | SQLException | InstantiationException | IllegalAccessException e) {
                e.printStackTrace();
            }
        }

        req.setAttribute("errors", errors);
        req.setAttribute("old", phone);
        doGet(req, resp);
    }
}
