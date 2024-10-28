package dal;

import model.Address;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Customer_User;

public class AddressDBContext extends DBContext<Address> {

    public Address getAddressByOrderID(int orderID) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Address address = null;

        try {
            String sql = "SELECT a.a_id, a.street, a.ward, a.district, a.city, a.a_phone\n"
                    + "FROM [Order] o\n"
                    + "JOIN [Address] a ON o.addressID = a.a_id\n"
                    + "WHERE o.order_id = ?;";

            stm = connect.prepareStatement(sql);
            stm.setInt(1, orderID);

            rs = stm.executeQuery();

            if (rs.next()) {
                address = new Address();
                address.setA_id(rs.getInt("a_id"));
                address.setStreet(rs.getString("street"));
                address.setWard(rs.getString("ward"));
                address.setDistrict(rs.getString("district"));
                address.setCity(rs.getString("city"));
                address.setA_phone(rs.getString("a_phone"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
                if (connect != null) {
                    connect.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return address;
    }

    // Lấy danh sách địa chỉ của khách hàng theo ID
    public ArrayList<Address> getAddressByCustomerId(int cus_id) {
        ArrayList<Address> addresses = new ArrayList<>();
        String sql = "SELECT a_id, city, a_phone, district, ward, street, detail FROM Address WHERE cus_id = ?";

        try (PreparedStatement stm = connect.prepareStatement(sql)) {
            stm.setInt(1, cus_id);

            try (ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    Address address = new Address();
                    address.setA_id(rs.getInt("a_id"));
                    address.setA_phone(rs.getString("a_phone"));
                    address.setCity(rs.getString("city"));
                    address.setDistrict(rs.getString("district"));
                    address.setWard(rs.getString("ward"));
                    address.setStreet(rs.getString("street"));
                    address.setDetail(rs.getString("detail"));
                    addresses.add(address);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(AddressDBContext.class.getName()).log(Level.SEVERE, "Lỗi khi lấy danh sách địa chỉ của khách hàng", ex);
        }
        return addresses;
    }

    // Cập nhật địa chỉ
    public void updateAddress(Address address) {
        String sql = "UPDATE Address SET a_phone = ?, city = ?, district = ?, ward = ?, street = ?, detail = ? WHERE a_id = ?";

        try (PreparedStatement stm = connect.prepareStatement(sql)) {
            stm.setString(1, address.getA_phone());
            stm.setString(2, address.getCity());
            stm.setString(3, address.getDistrict());
            stm.setString(4, address.getWard());
            stm.setString(5, address.getStreet());
            stm.setString(6, address.getDetail());
            stm.setInt(7, address.getA_id());

            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AddressDBContext.class.getName()).log(Level.SEVERE, "Lỗi khi cập nhật địa chỉ", ex);
        }
    }

    public void update(int aid, String detail, String street, String ward, String district, String city) {
        PreparedStatement stm = null;

        String sql = "UPDATE [dbo].[Address]\n"
                + "   SET\n"
                + "      [city] = ?,\n"
                + "      [district] = ?,\n"
                + "      [ward] = ?,\n"
                + "      [street] = ?,\n"
                + "      [detail] = ?\n"
                + " WHERE [a_id] = ?"; // Using a_id to identify the address to update

        try {
            stm = connect.prepareStatement(sql);
            stm.setString(1, city);
            stm.setString(2, district);
            stm.setString(3, ward);
            stm.setString(4, street);
            stm.setString(5, detail);
            stm.setInt(6, aid); // Correctly binding the address ID (a_id)
            stm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace(); // Print the exception for debugging purposes
        } finally {
            if (stm != null) {
                try {
                    stm.close(); // Always close the PreparedStatement to free resources
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public ArrayList<Address> getAddressByCusID(int cusID) {
        PreparedStatement stm = null;
        ArrayList<Address> addresss = new ArrayList<>();
        try {
            String sql = "SELECT c.cus_id, a.a_id, a.a_phone, a.city, a.district, a.ward, a.street, a.detail\n"
                    + "FROM dbo.[Customer] c\n"
                    + "JOIN dbo.[Address] a ON c.cus_id = a.cus_id\n"
                    + "WHERE c.cus_id = ?;";

            stm = connect.prepareStatement(sql);
            stm.setInt(1, cusID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Address a = new Address();
                a.setA_id(rs.getInt("a_id"));
                a.setA_phone(rs.getString("a_phone"));
                a.setCity(rs.getString("city"));
                a.setDistrict(rs.getString("district"));
                a.setWard(rs.getString("ward"));
                a.setStreet(rs.getString("street"));
                a.setDetail(rs.getString("detail"));
                Customer_User c = new Customer_User();
                c.setCus_id(rs.getInt("cus_id"));
                a.setCustomer(c);

                addresss.add(a);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AddressDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return addresss;
    }

    public void insertAddressByCustomerID(Address address, int cusID) {
        PreparedStatement stm = null;
        String sql = "INSERT INTO [dbo].[Address] "
                + "([a_phone], [city], [district], [ward], [street], [detail], [cus_id]) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {
            stm = connect.prepareStatement(sql);
            stm.setString(1, address.getA_phone());
            stm.setString(2, address.getCity());
            stm.setString(3, address.getDistrict());
            stm.setString(4, address.getWard());
            stm.setString(5, address.getStreet());
            if(address.getDetail() != null && address.getDetail().length() != 0){
               stm.setString(6, address.getDetail()); 
            }else{
                stm.setNull(6, java.sql.Types.NVARCHAR);
            }
            
            stm.setInt(7, cusID);

            stm.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    public static void main(String[] arr) {
        AddressDBContext addressDB = new AddressDBContext();

//        
//        int orderID = 44;  // Thay đổi thành một orderID thực tế trong cơ sở dữ liệu của bạn
//
//        // Gọi phương thức getAddressByOrderID và lấy thông tin địa chỉ
//        Address address = addressDB.getAddressByOrderID(orderID);
//
//        // Kiểm tra và in ra thông tin địa chỉ nếu có
//        if (address != null) {
//            System.out.println("Order ID: " + orderID);
//            System.out.println("Street: " + address.getStreet());
//            System.out.println("Ward: " + address.getWard());
//            System.out.println("District: " + address.getDistrict());
//            System.out.println("City: " + address.getCity());
//            System.out.println("Phone: " + address.getA_phone());
//        } else {
//            System.out.println("No address found for Order ID: " + orderID);
//        }
        
        
        int cus = 1;
        ArrayList<Address> addresses = addressDB.getAddressByCusID(cus);
        System.out.println(addresses.size());
    }

}
