package dal;

import model.Address;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AddressDBContext extends DBContext<Address> {

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

public static void main(String[] arr) {
    AddressDBContext ad = new AddressDBContext();
    ad.update(13, "123 Main St", "Elm Street", "Ward 1", "District 5", "Ho Chi Minh City");
}

}
