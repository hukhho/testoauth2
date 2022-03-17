package dao;

import com.fptuni.prj301.demo.utils.DBUtils;
import com.fptuni.prj301.demo.utils.Something;
import com.sun.org.apache.bcel.internal.generic.AALOAD;
import entiry.Admin;
import entiry.Brand;
import entiry.Color;
import entiry.OrderFullInfo;
import entiry.OrderItemList;
import entiry.OrderProduct;
import entiry.Payment;
import entiry.Product;
import entiry.ProductFullInfo;
import entiry.Ship;
import entiry.User;
import entiry.UserCart;
import entiry.UserCartFull;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author DUNGHUYNH
 */
public class Dao {

    public List<Product> getAllProduct() {
        ArrayList<Product> list;
        list = new ArrayList<Product>();

        String sql = "select pid, name, product.brandid, price, review, image_link, brandname from product join brand ON product.BRANDID=brand.BRANDID";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Product(rs.getString("pid"), rs.getString("name"), rs.getInt("brandid"), rs.getInt("price"), rs.getString("review"), rs.getString("image_link"), rs.getString("brandname")));
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }
        return list;
    }

    public List<ProductFullInfo> getAllProductFullInfo() {
        ArrayList<ProductFullInfo> list;
        list = new ArrayList<ProductFullInfo>();

        String sql = "select proin.PIID, pro.pid, pro.name, BRANDNAME, pro.price, pro.review, pro.IMAGE_LINK, color.COLORNAME, proin.SIZE, proin.AMOUNT from product pro join PRODUCTINVENTORY proin on pro.PID=proin.PID  join COLOR on color.COLORID=proin.COLORID join brand ON  pro.BRANDID=brand.BRANDID";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new ProductFullInfo(rs.getInt("piid"), rs.getString("pid"), rs.getString("name"), rs.getString("brandname"), rs.getInt("price"), rs.getString("review"), rs.getString("image_link"), rs.getString("colorname"), rs.getInt("size"), rs.getInt("amount")));
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }
        return list;
    }

    public List<ProductFullInfo> getProductFullInfoByPid(String pid) {
        ArrayList<ProductFullInfo> list;
        list = new ArrayList<ProductFullInfo>();

        String sql = "select proin.PIID, pro.pid, pro.name, BRANDNAME, pro.price, pro.review, pro.IMAGE_LINK, color.COLORNAME, proin.SIZE, proin.AMOUNT from product pro join PRODUCTINVENTORY proin on pro.PID=proin.PID  join COLOR on color.COLORID=proin.COLORID join brand ON  pro.BRANDID=brand.BRANDID where pro.pid like ?";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, pid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new ProductFullInfo(rs.getInt("piid"), rs.getString("pid"), rs.getString("name"), rs.getString("brandname"), rs.getInt("price"), rs.getString("review"), rs.getString("image_link"), rs.getString("colorname"), rs.getInt("size"), rs.getInt("amount")));

            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }
        return list;
    }

    public List<Color> getColorListByPid(String pid) {
        ArrayList<Color> list;
        list = new ArrayList<Color>();
        String sql = "select DISTINCT color.colorid, colorname from PRODUCTINVENTORY proin join color on proin.colorid=color.colorid where pid = ?  and amount>=1";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, pid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Color(rs.getInt("colorid"), rs.getString("colorname")));
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }
        return list;
    }

    public List<Integer> getSizeByColor(String pid, String color) {
        List<Integer> list = new ArrayList<Integer>();
        String sql = "SELECT size FROM PRODUCTINVENTORY proin join color on color.COLORID=proin.COLORID WHERE PID=? and color.COLORNAME=?";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, pid);
            ps.setString(2, color);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(rs.getInt("size"));
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }
        return list;
    }

//    public List<UserCartFull> getUserCartByUsername(String username) {
//        ArrayList<ProductFullInfo> list;
//        list = new ArrayList<ProductFullInfo>();
//
//        String sql = "select proin.PIID, pro.pid, pro.name, BRANDNAME, pro.price, pro.review, pro.IMAGE_LINK, color.COLORNAME, proin.SIZE, proin.AMOUNT from product pro join PRODUCTINVENTORY proin on pro.PID=proin.PID  join COLOR on color.COLORID=proin.COLORID join brand ON  pro.BRANDID=brand.BRANDID where pro.pid like ?";
//
//        try {
//
//            Connection conn = DBUtils.getConnection();
//
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setString(1, pid);
//            ResultSet rs = ps.executeQuery();
//
//            while (rs.next()) {
//                list.add(new ProductFullInfo(rs.getInt("piid"), rs.getString("pid"), rs.getString("name"), rs.getString("brandname"), rs.getInt("price"), rs.getString("review"), rs.getString("image_link"), rs.getString("colorname"), rs.getInt("size"), rs.getInt("amount")));
//
//            }
//
//        } catch (Exception ex) {
//
//            ex.printStackTrace();
//
//        }
//        return list;
//    }
    public List<Brand> getAllBrand() {
        ArrayList<Brand> list;
        list = new ArrayList<Brand>();
        String sql = "select brandid, brandname from brand";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                list.add(new Brand(rs.getInt("brandid"), rs.getString("brandname")));
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }
        return list;
    }

    public List<Color> getAllColor() {
        ArrayList<Color> list;
        list = new ArrayList<Color>();
        String sql = "select colorid, colorname from color";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                list.add(new Color(rs.getInt("colorid"), rs.getString("colorname")));
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }
        return list;
    }

    public List<UserCart> getUserCart(String username) {
        ArrayList<UserCart> list;
        list = new ArrayList<UserCart>();
        String sql = "select cartnumber, piid, quantity, cart.cartid from USERCARTPRODUCT join cart on USERCARTPRODUCT.CARTID=cart.CARTID join CUSTOMER on customer.ID=cart.USERID where username = ?";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new UserCart(rs.getInt("cartnumber"), rs.getInt("piid"), rs.getInt("quantity"), rs.getInt("cartid")));
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }
        return list;
    }

    public int checkAmountProduct(String colorname, int size, String pid) {
        String sql = "select amount from PRODUCTINVENTORY proin join PRODUCT pro on proin.PID=pro.PID join color on color.COLORID=proin.COLORID where colorname=? and size=? and pro.pid=?";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, colorname);
            ps.setInt(2, size);
            ps.setString(3, pid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return rs.getInt("amount");
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }
        return -1;
    }

    public List<OrderProduct> getOrder(int userid) {
        ArrayList<OrderProduct> list;
        list = new ArrayList<OrderProduct>();
        String sql = "select orderid, userid, orderdate from orderproduct where userid = ?";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new OrderProduct(rs.getInt("orderid"), rs.getInt("userid"), rs.getString("orderdate")));
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }
        return list;
    }

    public List<OrderItemList> getOrderListItem(int orderid, int userid) {
        ArrayList<OrderItemList> list;
        list = new ArrayList<OrderItemList>();
        String sql = "select itemlistnumber, itempiid, itemquantity, priceitem, itemlist.orderid, userid from itemlist join orderproduct on itemlist.orderid=orderproduct.orderid where itemlist.orderid = ? and userid = ?";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, orderid);
            ps.setInt(2, userid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new OrderItemList(rs.getInt("itemlistnumber"), rs.getInt("itempiid"), rs.getInt("itemquantity"), rs.getInt("priceitem"), rs.getInt("orderid")));
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }
        return list;
    }

    public int getTotalOrder(int orderid, int userid) {
        String sql = "select SUM(itemquantity*priceitem) as total from itemlist join orderproduct on itemlist.orderid=orderproduct.orderid where itemlist.orderid = ? and userid = ? GROUP BY itemlist.orderid";

        try {
            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, orderid);
            ps.setInt(2, userid);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return rs.getInt("total");
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }
        return -1;
    }

    public User login(String username, String password) {

        String sql = "select id, username, password, name, sex, email, phone, address, regtime, cash from customer where username = ? and password = ?";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"), rs.getString("name"), rs.getString("sex"), rs.getString("email"), rs.getString("phone"), rs.getString("address"), rs.getString("regtime"), rs.getInt("cash"));
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }
        return null;
    }

    public Admin loginAdmin(String adminname, String adminpass) {

        String sql = "SELECT adminid, adminname, adminpass from AdminManager where adminname = ? and AdminPass = ?";

        try {
            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, adminname);
            ps.setString(2, adminpass);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return new Admin(rs.getInt("adminid"), rs.getString("adminname"), rs.getString("adminpass"));
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }
        return null;
    }

    public User getUserInfo(int userid) {

        String sql = "select id, username, password, name, sex, email, phone, address, regtime, cash from customer where id = ?";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userid);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"), rs.getString("name"), rs.getString("sex"), rs.getString("email"), rs.getString("phone"), rs.getString("address"), rs.getString("regtime"), rs.getInt("cash"));
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }
        return null;
    }

    public List<User> getUserInfoByAdmin(String orderBy) {
        ArrayList<User> list;
        list = new ArrayList<User>();
        String sql = "select id, username, password, name, sex, email, phone, address, regtime, cash from customer";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User n = new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"), rs.getString("name"), rs.getString("sex"), rs.getString("email"), rs.getString("phone"), rs.getString("address"), rs.getString("regtime"), rs.getInt("cash"));
                list.add(n);
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }
        return list;
    }
//   private int id;
//    private String username;
//    private String password;
//    private String name;
//    private String sex;
//    private String email;
//    private String phone;
//    private String address;
//    private String regtime;

    public boolean updateInfo(int userid, String name, String email, String phone, String address) {

        String sql = "UPDATE CUSTOMER SET NAME = ?, EMAIL=?, Phone=?, Address=? WHERE ID=?";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, address);
            ps.setInt(5, userid);

            return ps.executeUpdate() > 0;

        } catch (Exception ex) {

            ex.printStackTrace();

        }
        return false;
    }

    public UserCart insertToCart(int userid, String colorname, int size, int quantity, String pid) {

        String sql = "exec INSERTINTOCART ?,?,?,?,?";

        try {
            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userid);
            ps.setString(2, colorname);
            ps.setInt(3, size);
            ps.setInt(4, quantity);
            ps.setString(5, pid);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return new UserCart(rs.getInt("cartnumber"), rs.getInt("piid"), rs.getInt("quantity"), rs.getInt("cartid"));
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public int addToOrder(int userid, String address, String phone, String name) {
        int orderid = -1;
        String sql = "EXEC CREATEORDER ?, ?, ?, ?";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userid);
            ps.setString(2, address);
            ps.setString(3, phone);
            ps.setString(4, name);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return rs.getInt("orderid");
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }
        return orderid;
    }

    public int getTotalAmountProductByPid(String pid) {
        int totalAmount = -1;
        String sql = "select SUM(amount) as totalAmount from PRODUCTINVENTORY where PID = ? ";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, pid);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return rs.getInt("totalAmount");
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }
        return totalAmount;
    }

    public Payment getPayment(int orderid, int userid) {

        String sql = "select paymentid, paymentmethod,totalamount,payment.ORDERID,paymentstatus,paymentdate from payment join orderproduct on orderproduct.orderid=payment.ORDERID where userid = ? and payment.orderid = ?";

        try {
            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userid);
            ps.setInt(2, orderid);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return new Payment(rs.getInt("paymentid"), rs.getString("paymentmethod"), rs.getInt("totalamount"), rs.getInt("ORDERID"), rs.getString("paymentstatus"), rs.getString("paymentdate"));
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public Ship getShip(int orderid, int userid) {

        String sql = "select shipid,deliverystartdate,ship.orderid,shipstatus, shipaddress, shipphone, shipname from ship join orderproduct on orderproduct.orderid=ship.orderid where userid = ? and ship.orderid = ?";

        try {
            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userid);
            ps.setInt(2, orderid);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                if (rs.getString("deliverystartdate") == null) {
                    return new Ship(rs.getInt("shipid"), "NULL", rs.getInt("orderid"), rs.getString("shipstatus"), rs.getString("shipaddress"), rs.getString("shipphone"), rs.getString("shipname"));
                } else {
                    return new Ship(rs.getInt("shipid"), rs.getString("deliverystartdate"), rs.getInt("orderid"), rs.getString("shipstatus"), rs.getString("shipaddress"), rs.getString("shipphone"), rs.getString("shipname"));
                }

            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public List<OrderProduct> getOrderByAdmin(String orderBy) {
        ArrayList<OrderProduct> list;
        list = new ArrayList<OrderProduct>();
        String sql = "select orderid, userid, orderdate from orderproduct";

        try {
            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            if (orderBy.equals("orderid") || orderBy.equals("orderid") || orderBy.equals("orderid")) {
                sql += "ORDER BY ? " + "ASC";
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new OrderProduct(rs.getInt("orderid"), rs.getInt("userid"), rs.getString("orderdate")));
            }

        } catch (Exception ex) {
            ex.printStackTrace();

        }
        return list;
    }

    public List<OrderFullInfo> getFullInfoOrderByAdmin(String orderBy) {
        ArrayList<OrderFullInfo> list;
        list = new ArrayList<OrderFullInfo>();

        String sql = "select op.orderid,userid,orderdate,id,username,name,shipid,deliverystartdate,shipstatus,paymentid,paymentmethod,totalamount,paymentstatus from ORDERPRODUCT op join CUSTOMER cus on op.USERID=cus.ID join payment pay on pay.ORDERID=op.ORDERID join ship on op.ORDERID=ship.ORDERID";
        try {
            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            if (orderBy.equals("orderid") || orderBy.equals("orderid") || orderBy.equals("orderid")) {
                sql += "ORDER BY ? " + "ASC";
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new OrderFullInfo(rs.getInt("orderid"), rs.getInt("userid"), rs.getString("orderdate"), rs.getInt("id"), rs.getString("username"), rs.getString("name"), rs.getInt("shipid"), rs.getString("deliverystartdate"), rs.getString("shipstatus"), rs.getInt("paymentid"), rs.getString("paymentmethod"), rs.getInt("totalamount"), rs.getString("paymentstatus")));
            }

        } catch (Exception ex) {
            ex.printStackTrace();

        }
        return list;
    }

    public int deleteCart(int userid, int cartnumber) {
        ArrayList<OrderFullInfo> list;
        list = new ArrayList<OrderFullInfo>();

        String sql = "Delete usc from USERCARTPRODUCT usc join CART on usc.CARTID=CART.CARTID Where cartnumber = ? and userid = ? SELECT @@ROWCOUNT as deleted";
        try {
            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, cartnumber);
            ps.setInt(2, userid);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return rs.getInt("deleted");
            }

        } catch (Exception ex) {
            ex.printStackTrace();

        }
        return 0;
    }

    public String deleteProduct(String pid, int adminid) {      
        String sql = "EXEC deleteproduct ?,?";
        try {
            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, pid);
            ps.setInt(2, adminid);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return rs.getString("status");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public boolean addReduceQuantityCart(int userid, int cartnumber, String addReduce) {

        String sql = "UPDATE USERCARTPRODUCT SET QUANTITY=QUANTITY+1 from USERCARTPRODUCT usc join CART on usc.CARTID=CART.CARTID WHERE USERID = ? and CARTNUMBER = ? ";
        String sql1 = "UPDATE USERCARTPRODUCT SET QUANTITY=QUANTITY-1 from USERCARTPRODUCT usc join CART on usc.CARTID=CART.CARTID WHERE USERID = ? and CARTNUMBER = ? ";
        try {
            Connection conn = DBUtils.getConnection();

            if (addReduce.equals("add")) {
                PreparedStatement ps = conn.prepareStatement(sql);

                ps.setInt(1, userid);
                ps.setInt(2, cartnumber);

                return ps.executeUpdate() > 0;

            } else if (addReduce.equals("reduce")) {
                PreparedStatement ps1 = conn.prepareStatement(sql1);

                ps1.setInt(1, userid);
                ps1.setInt(2, cartnumber);

                return ps1.executeUpdate() > 0;

            } else {
                return false;
            }

        } catch (Exception ex) {
            ex.printStackTrace();

        }
        return false;
    }

    public boolean editBrand(int brandid, String brandname) {

        String sql = "UPDATE BRAND SET Brandname = ? where BRANDID = ?";
        try {
            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, brandname);
            ps.setInt(2, brandid);

            return ps.executeUpdate() > 0;

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean insertBrand(String brandname) {

        String sql = "insert into BRAND values (?) ";
        try {
            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, brandname);

            return ps.executeUpdate() > 0;

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean deleteBrand(int brandid, int adminid) {
        String sql = "exec deletebrand ? , ?";
        try {
            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, brandid);
            ps.setInt(2, adminid);

            return ps.executeUpdate() > 0;

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean editColor(int colorid, String colorname) {

        String sql = "UPDATE COLOR SET Colorname = ? where colorid = ?";
        try {
            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, colorname);
            ps.setInt(2, colorid);

            return ps.executeUpdate() > 0;

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean insertColor(String colorname) {

        String sql = "insert into Color values (?) ";
        try {
            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, colorname);

            return ps.executeUpdate() > 0;

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean deleteColor(int colorid, int adminid) {
        String sql = "exec deletecolor ? , ?";
        try {
            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, colorid);
            ps.setInt(2, adminid);

            return ps.executeUpdate() > 0;

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public String shipToCustomer(int orderid, int adminid) {
        String sql = "exec shiptocustomer ? , ?";
        try {
            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, orderid);
            ps.setInt(2, adminid);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return rs.getString("status");
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public String doneShip(int orderid, int adminid) {
        String sql = "exec doneship ? , ?";
        try {
            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, orderid);
            ps.setInt(2, adminid);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return rs.getString("status");
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public String editUser(int adminid, int userid, String name, String pass, String sex, String email, String phone, String address, int cash) {
        String sql = "Exec edituser ?,?,?,?,?,?,?,?,?";
        try {
            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, adminid);
            ps.setInt(2, userid);
            ps.setString(3, name);
            ps.setString(4, pass);
            ps.setString(5, sex);
            ps.setString(6, email);
            ps.setString(7, phone);
            ps.setString(8, address);
            ps.setInt(9, cash);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return rs.getString("status");
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public boolean addNewProduct(String pid, String name, int brandid, int price, String review, String image_link) {

        String sql = "insert into PRODUCT(pid,name,brandid,price,review,image_link) values (?,?,?,?,?,?) ";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, pid);
            ps.setString(2, name);
            ps.setInt(3, brandid);
            ps.setInt(4, price);
            ps.setString(5, review);
            ps.setString(6, image_link);

            return ps.executeUpdate() > 0;

        } catch (Exception ex) {

            ex.printStackTrace();

        }
        return false;
    }

    public boolean editProduct(String pid, String name, int brandid, int price, String review, String image_link) {

        String sql = "update PRODUCT set NAME=?,BRANDID=?,PRICE=?,REVIEW=?,IMAGE_LINK=? where PID=?";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, name);
            ps.setInt(2, brandid);
            ps.setInt(3, price);
            ps.setString(4, review);
            ps.setString(5, image_link);
            ps.setString(6, pid);

            return ps.executeUpdate() > 0;

        } catch (Exception ex) {

            ex.printStackTrace();

        }
        return false;
    }

    public boolean addInventory(String pid, int size, int colorid, int amount) {

        String sql = "EXEC insertInventory ?,?,?,?";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, pid);;
            ps.setInt(2, size);
            ps.setInt(3, colorid);
            ps.setInt(4, amount);

            return ps.executeUpdate() > 0;

        } catch (Exception ex) {

            ex.printStackTrace();

        }
        return false;
    }

    public boolean updateAmount(int piid, int amount) {

        String sql = "UPDATE PRODUCTINVENTORY SET AMOUNT = ? where piid = ? ";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, amount);
            ps.setInt(2, piid);

            return ps.executeUpdate() > 0;

        } catch (Exception ex) {

            ex.printStackTrace();

        }
        return false;
    }

    public static void main(String[] args) {
        Dao login = new Dao();
        User a = login.login("hung", "hunghung123");

        System.out.println("ID: " + a.getId());

        Dao dao = new Dao();

        List<ProductFullInfo> listfull = dao.getAllProductFullInfo();

//        List<ProductFullInfo> listfullbypid = dao.getProductFullInfoByPid("T123");
//        for (ProductFullInfo productFullInfo : listfullbypid) {
//            System.out.println(listfullbypid);
//
//        }
//
//        Dao orderitem = new Dao();
//         List<Color> color = dao.getColorListByPid("T123");
//         for (Color color1 : color) {
//             System.out.println(color1);
//            }
//        
//        List<OrderItemList> hi = orderitem.getOrderListItem(14);
//        for (OrderItemList x : hi) {
//            System.out.println(x);
//        }
//        int check=orderitem.checkAmountProduct("red", 39, "t123");
//        System.out.println(check);
//        int check1=orderitem.checkAmountProduct("blue", 39, "t123");
//        System.out.println(check1);
//        int check3 = orderitem.addToOrder(1, "xuan hung", "0387788988", "hung");
//        System.out.println(check3);
//        
//        Ship pm =  orderitem.getShip(36, 1);
//        System.out.println(pm);
//        UserCart test = orderitem.insertToCart(1, "blue", 39, 1, "t456");
//        System.out.println(test);
//       Something ne = new Something();
//       System.out.println(ne.checkPhone("0387788999"));
//       
//       System.out.println(ne.checkPhone("01877889989"));
//       
//       System.out.println(dao.updateInfo(1, " HUNG HUNG 2", "hukhho@gmail.com", "0387788999", "122 Le Van Viet"));
//        List<OrderFullInfo> hi = dao.getFullInfoOrderByAdmin("orderid");
//
//        List<OrderFullInfo> d = dao.getFullInfoOrderByAdmin("orderid");
//        for (OrderFullInfo x : d) {
//            System.out.println(x);
//        }
//        List<User> u = dao.getUserInfoByAdmin("userid");
//        for (User x : u) {
//            System.out.println(x);
//        }
//    List<Color> list = dao.getAllColor();
//        for (Color x : list) {
//            System.out.println(x);
//        }
//    }
//    
        
        
        System.out.println(dao.deleteProduct("t999", 1));
    }

}
