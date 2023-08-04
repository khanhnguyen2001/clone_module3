package controller;

import model.Role;
import model.User;
import service.service.RoleService;
import service.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserController", value = "/user")
public class UserController extends HttpServlet {
    private UserService userService = new UserService();
    private RoleService roleService = new RoleService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "getAll":
                showFormGetAll(request, response);
                break;
            case "login":
                showFormLogin(request, response);
                break;
            case "logout":
                logout(request, response);
                break;
            case "register":
                showFormRegister(request, response);
                break;
            case "edit":
                showFormEdit(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        userService.delete(id);
        response.sendRedirect("/user?action=getAll");
    }

    private void showFormEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        User user = userService.getAll().get(userService.findIndexById(id));
        request.setAttribute("user", user);

        List<Role> roleList = roleService.getAll();
        request.setAttribute("roleList", roleList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/user/editUser.jsp");
        dispatcher.forward(request, response);
    }

    private void showFormGetAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> userList = userService.getAll();
        request.setAttribute("userList", userList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/user/showUser.jsp");
        dispatcher.forward(request, response);
    }

    private void showFormLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/user/login.jsp");
        dispatcher.forward(request, response);
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("/user?action=login");
    }

    private void showFormRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> userList = userService.getAll();
        request.setAttribute("userList", userList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/user/register.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "login":
                login(request, response);
                break;
            case "register":
                register(request, response);
                break;
            case "edit":
                editUser(request, response);
                break;
        }
    }

    private void editUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int userId = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        int roleId = Integer.parseInt(request.getParameter("roleId"));

        Role role = new Role(roleId);
        User user = new User(userId, username, password, role);

        userService.edit(userId, user);

        response.sendRedirect("user?action=getAll");
    }

    private void register(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean check = false;
        for (User user : userService.getAll()) {
            if (user.getUsername().equals(username)) {
                check = true;
                break;
            }
        }
        if (check) {
            String mess = "Tài khoản đã tồn tại";
            request.setAttribute("mess", mess);
            RequestDispatcher dispatcher = request.getRequestDispatcher("view/user/register.jsp");
            dispatcher.forward(request, response);
        } else {
            User user = new User(username, password);
            userService.add(user);

            response.sendRedirect("user?action=login");
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (userService.checkLogin(username, password)) {
            response.sendRedirect("/product?action=getAll");
        } else {
            response.sendRedirect("/user?action=login");
        }
    }
}