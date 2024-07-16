package controller;

import dal.CommunityPostDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import model.CommentPost;
import model.CommunityPost;
import model.LikePost;
import model.Post_image;
import model.User;

@WebServlet(name = "DetailCommnityPost", urlPatterns = {"/DetailCommnityPost"})
public class DetailCommnityPost extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DetailCommnityPost</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DetailCommnityPost at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user_Data");
        CommunityPostDao cpd = new CommunityPostDao();
        List<LikePost> likePosts = new ArrayList<>();
        String postIdRaw = request.getParameter("post_id");
        String view = request.getParameter("view");
        String commentId = request.getParameter("comment_id");
        String comment_id_update = request.getParameter("commentUpdatedId");
        String addComment = request.getParameter("addCommment");

        int commentUpDate = (comment_id_update == null || comment_id_update.isEmpty()) ? 0 : Integer.parseInt(comment_id_update);

        int postId = (postIdRaw == null || postIdRaw.isEmpty()) ? 0 : Integer.parseInt(postIdRaw);
        CommunityPost cPost = cpd.getCommunityPost(postId);

        int comment_id = (commentId == null || commentId.isEmpty()) ? 0 : Integer.parseInt(commentId);

        if (view != null) {
            cPost.setNum_of_view(cPost.getNum_of_view() + 1);
            cpd.updatePost2(cPost);
        }

        List<Post_image> post_images = cpd.getPostImageByPostId(postId);
        List<CommentPost> commentList = cpd.getListCommentOfPost(postId);
        likePosts = cpd.getListLIkedPost((user == null) ? 0 : user.getId());
        List<Integer> listPostIdLiked = new ArrayList<>();
        for (LikePost index : likePosts) {
            listPostIdLiked.add(index.getPost_id().getId());
        }

        request.setAttribute("comment_id", comment_id);
        if (comment_id_update != null) {
            request.setAttribute("scrollToComment", commentUpDate);
        } else {
            request.setAttribute("scrollToComment", comment_id);
        }
        
        if(addComment!=null){
             request.setAttribute("scrollToComment", "new");
        }

        request.setAttribute("commentList", commentList);
        request.setAttribute("page", 3);
        request.setAttribute("likePost", listPostIdLiked);
        request.setAttribute("Cpost", cPost);
        request.setAttribute("listImage", post_images);
        request.getRequestDispatcher("DetailCommunityPost.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CommunityPostDao cpd = new CommunityPostDao();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user_Data");

        String post_id = request.getParameter("post_id");
        String comment = request.getParameter("comment");

        int postId = (post_id == null || post_id.isEmpty()) ? 0 : Integer.parseInt(post_id);
        LocalDateTime now = LocalDateTime.now();
        CommunityPost communityPost = cpd.getCommunityPost(postId);
        String attribute = processAddComment(comment, user, communityPost, now, cpd, postId);
        response.sendRedirect("DetailCommnityPost?post_id=" + postId + attribute);
    }

    private String processAddComment(String comment, User user, CommunityPost communityPost, LocalDateTime now, CommunityPostDao cpd, int postId) {
        CommentPost commentPost = new CommentPost(0, comment, user, communityPost, now, 1);
        cpd.addComment(commentPost);
        communityPost.setNum_of_comment(cpd.countCommentEachPost(postId));
        cpd.updatePost2(communityPost);
        return "&addCommment=1";
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
