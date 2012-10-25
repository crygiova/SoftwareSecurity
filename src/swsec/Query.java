package swsec;

import java.sql.*;

public class Query {	
	
	public static ResultSet SelectCountry()  throws Exception
	{
		ResultSet rs = null;
		Connection con = ConnectionDB.getConnection();
		PreparedStatement stat = con.prepareStatement("SELECT full_name FROM country");
		rs = stat.executeQuery();		
		return rs;		
	}
	
	public static ResultSet selectSchools(String countryFullName) throws Exception
	{
		Connection con = ConnectionDB.getUserConnection();
		PreparedStatement stat=con.prepareStatement("SELECT * FROM country, school WHERE school.country = country.short_name AND country.full_name = ?");
		stat.setString(1, countryFullName);
		return stat.executeQuery();
	}
	
	public static ResultSet selectReviews(String school_name) throws Exception
	{
		Connection con = ConnectionDB.getUserConnection();
		PreparedStatement  stat = con.prepareStatement("SELECT * FROM user_reviews, school WHERE user_reviews.school_id = school.school_id AND school.full_name = ?");
		stat.setString(1,school_name);
		return stat.executeQuery();
	}
	
	public static boolean countryCheck(String country) throws Exception
	{
		ResultSet rs = null;
		Connection con = ConnectionDB.getUserConnection();
		PreparedStatement  stat = con.prepareStatement("SELECT * FROM country WHERE full_name = ?");
		stat.setString(1,country);
		rs = stat.executeQuery();
		return rs.next();
	}
	
	public static void insertReview(String school_id, String name, String review) throws Exception
	{
		Connection con = ConnectionDB.getConnection();
		PreparedStatement stat = con.prepareStatement("INSERT INTO user_reviews VALUES (?,?,?)");
		stat.setInt(1,Integer.parseInt(school_id));
		stat.setString(2, name);
		stat.setString(3, review);
		stat.executeUpdate();
	}
	
	public static void insertCountry(String shortName, String name) throws Exception
	{
		Connection con = ConnectionDB.getConnection();
		PreparedStatement stat = con.prepareStatement("INSERT INTO country VALUES (?,?)");
		stat.setString(1, shortName);
		stat.setString(2, name);
		stat.executeUpdate();
	}
	
	public static void insertSchool(String schoolFull, String SchoolShort, String city, String zip, String country) throws Exception
	{
		Connection con = ConnectionDB.getConnection();
		PreparedStatement stat = con.prepareStatement("INSERT INTO school (full_name, short_name, place, zip, country) VALUES (?,?,?,?,?)");
		stat.setString(1, schoolFull);
		stat.setString(2, SchoolShort);
		stat.setString(3, city);
		stat.setInt(4, Integer.parseInt(zip));
		stat.setString(5, country);
		stat.executeUpdate();
	}
	
	public static ResultSet selectUsers() throws Exception
	{
		Connection con = ConnectionDB.getUserConnection();
		PreparedStatement  stat = con.prepareStatement("SELECT LOGIN, FLAG FROM NORMAL_USER");
		return stat.executeQuery();
	}
	
	public static void deleteUser(String user) throws Exception
	{
		Connection con = ConnectionDB.getConnection();
		PreparedStatement stat = con.prepareStatement("DELETE FROM NORMAL_USER WHERE LOGIN = ?");
		stat.setString(1, user);
		stat.executeUpdate();
	}
	
	public static void updateUserFlag(String user) throws Exception
    {
        Connection con = ConnectionDB.getConnection();
        PreparedStatement stat = con.prepareStatement("UPDATE NORMAL_USER SET FLAG = '1' WHERE LOGIN = ?");
        stat.setString(1, user);
        stat.executeUpdate();
    }
    
    public static boolean userCheck(String user) throws Exception
    {
        ResultSet rs = null;
        Connection con = ConnectionDB.getUserConnection();
        PreparedStatement  stat = con.prepareStatement("SELECT * FROM NORMAL_USER WHERE LOGIN = ?");
        stat.setString(1,user);
        rs = stat.executeQuery();
        return rs.next();
    }
}
