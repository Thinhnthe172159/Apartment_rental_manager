package controller;

import dal.ApartmentDao;
import dal.ApartmentPostDao;
import dal.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Apartment;
import model.Apartment_Post;
import model.Apartment_image;
import model.Payment_method;
import model.User;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

@WebServlet(name = "UpdateApartmentPost", urlPatterns = {"/UpdateApartmentPost"})
public class UpdateApartmentPost extends HttpServlet {

    private static final int STATUS_PUBLISHED = 2;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String apartmentPostId = request.getParameter("post_id");
        int postId = (apartmentPostId == null || apartmentPostId.isEmpty()) ? 0 : Integer.parseInt(apartmentPostId);

        ApartmentPostDao apd = new ApartmentPostDao();
        ApartmentDao ad = new ApartmentDao();
        
        Apartment_Post post = apd.getApartment_Post(postId);
        List<Apartment> apartments_list = ad.getApartmentList(0);
        List<Payment_method> payment_methods_list = ad.getPayment_method_list();

        request.setAttribute("post_start", post.getPost_start());
        request.setAttribute("post", post);
        request.setAttribute("payment_methods_list", payment_methods_list);
        request.setAttribute("apartmentList", apartments_list);

        request.getRequestDispatcher("UpdateApartmentPost.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String apartment_id = request.getParameter("apartment");
        String payment_id = request.getParameter("payment_method");
        String post_id = request.getParameter("post");
        String week_raw = request.getParameter("week");
        String postStart = request.getParameter("Post_start");
        String postEnd = request.getParameter("Post_end");
        String submit = request.getParameter("submit");

        int postId = (post_id == null || post_id.isEmpty()) ? 0 : Integer.parseInt(post_id);
        int apartmentId = (apartment_id == null) ? 0 : Integer.parseInt(apartment_id);
        int paymentMethodId = (payment_id == null) ? 0 : Integer.parseInt(payment_id);
        int week = (week_raw == null || week_raw.isEmpty()) ? 0 : Integer.parseInt(week_raw);

        ApartmentPostDao apartmentPostDao = new ApartmentPostDao();
        ApartmentDao apartmentDao = new ApartmentDao();
        UserDao userDao = new UserDao();

        Apartment_Post ap = apartmentPostDao.getApartment_Post(postId);
        ap.setTitle(title);
        ap.setDescription(description);
        
        Apartment apartment = apartmentDao.getApartment(apartmentId);
        ap.setApartment_id(apartment);
        
        Payment_method paymentMethod = apartmentDao.getPayment_method(paymentMethodId);
        User user = userDao.getUser(apartment.getLandLord_id().getId());
        
        ap.setLandlord_id(user);
        Apartment_image firstImage = apartmentDao.get_First_Apartment_Image(apartmentId);
        if (firstImage != null) {
            ap.setFirst_image(firstImage.getImage());
        }
        
        ap.setCity(apartment.getCity());
        ap.setDistrict(apartment.getDistrict());
        ap.setCommune(apartment.getCommune());
        ap.setArea(apartment.getArea());
        ap.setPrice(apartment.getPrice());
        ap.setNumber_of_bedroom(apartment.getNumber_of_bedroom());
        ap.setApartment_type(apartment.getType_id());
        ap.setApartment_name(apartment.getName());
        
        List<Apartment_image> imageList = apartmentDao.getAllApartmentImageList(apartmentId);
        ap.setTotal_image(imageList.size());

        if (week != 0) {
            processPayment(ap, paymentMethod, week, user, session, request);
        } else {
            session.setAttribute("message", "d");
        }

        if ("Cập Nhật".equals(submit)) {
            ap.setPost_status(ap.getPost_status());
        } else {
            ap.setPost_status(2);
        }

        apartmentPostDao.updateApartmentPost(ap, ap.getId());
        request.getRequestDispatcher("ApartmentPostForLandlord").forward(request, response);
    }

    private void processPayment(Apartment_Post ap, Payment_method paymentMethod, int week, User user, HttpSession session, HttpServletRequest request) {
        UserDao userDao = new UserDao();
        double currentPayment = ap.getPaid_for_post();
        double newPayment = paymentMethod.getPrice() * week;
        double moneyReturn = 0.0;
        double moneyPass = 0.0;
        LocalDate current = LocalDate.now();

        LocalDate postStart = ap.getPost_start().toLocalDate();
        int daysPassed = (int) ChronoUnit.DAYS.between(postStart, current);

        if (postStart.isBefore(current)) {
            moneyReturn = currentPayment - ((paymentMethod.getPrice() / 7) * daysPassed);
            moneyPass = currentPayment - moneyReturn;
        } else {
            moneyReturn = currentPayment;
        }

        if ((user.getMoney() + moneyReturn) < newPayment) {
            session.setAttribute("message", "b");
        } else {
            ap.setPaid_for_post(moneyPass + newPayment);
            user.setMoney((user.getMoney() + moneyReturn) - newPayment);
            userDao.UserMoneyChange(user);

            session.setAttribute("user_Data", user);
            session.setAttribute("message", "a");

            ap.setPost_start(Date.valueOf(request.getParameter("Post_start")));
            ap.setPost_end(Date.valueOf(request.getParameter("Post_end")));
            ap.setWeek(week);
            ap.setPayment_id(paymentMethod);
        }
    }

    @Override
    public String getServletInfo() {
        return "UpdateApartmentPost Servlet";
    }
}
