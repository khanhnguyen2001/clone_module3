package controller;

import model.Brand;
import model.Category;
import model.Product;
import service.service.BrandService;
import service.service.CategoryService;
import service.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductController", value = "/product")
public class ProductController extends HttpServlet {
    private ProductService productService = new ProductService();
    private BrandService brandService = new BrandService();
    private CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "getAll":
                showFormGetAll(request, response);
                break;
            case "create":
                showFormCreate(request, response);
                break;
            case "edit":
                showFormEdit(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            case "search":
                showFormSearch(request, response);
                break;
        }
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Brand> brandList = brandService.getAll();
        request.setAttribute("brandList", brandList);

        List<Category> categoryList = categoryService.getAll();
        request.setAttribute("categoryList", categoryList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/product/addProduct.jsp");
        dispatcher.forward(request, response);
    }

    private void showFormSearch(HttpServletRequest request, HttpServletResponse response) {
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        productService.delete(id);
        response.sendRedirect("/product?action=getAll");
    }

    private void showFormEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        Product product = productService.getAll().get(productService.findIndexById(id));
        request.setAttribute("product", product);

        List<Brand> brandList = brandService.getAll();
        request.setAttribute("brandList", brandList);

        List<Category> categoryList = categoryService.getAll();
        request.setAttribute("categoryList", categoryList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/product/editProduct.jsp");
        dispatcher.forward(request, response);
    }

    private void showFormGetAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productService.getAll();
        request.setAttribute("productList", productList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/product/product.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "create":
                createProduct(request, response);
                break;
            case "edit":
                editProduct(request, response);
                break;
            case "search":
                searchProduct(request, response);
                break;
        }
    }

    private void searchProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("search");
        List<Product> productList = productService.findByName(name);

        request.setAttribute("productList", productList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/product/product.jsp");
        dispatcher.forward(request, response);
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int productId = Integer.parseInt(request.getParameter("id"));
        String productName = request.getParameter("productName");
        int brandId = Integer.parseInt(request.getParameter("brandId"));
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        String detail = request.getParameter("detail");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));
        String image = request.getParameter("image");

        Brand brand = new Brand(brandId);
        Category category = new Category(categoryId);
        Product product = new Product(productId, productName, brand, category, detail, quantity, price, image);

        productService.edit(productId, product);

        response.sendRedirect("product?action=getAll");
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String productName = request.getParameter("productName");
        int brandId = Integer.parseInt(request.getParameter("brandId"));
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        String detail = request.getParameter("detail");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));
        String image = request.getParameter("image");

        Brand brand = new Brand(brandId);
        Category category = new Category(categoryId);
        Product product = new Product(productName, brand, category, detail, quantity, price, image);

        productService.add(product);

        response.sendRedirect("product?action=getAll");
    }
}