package swsec;

import java.sql.*;

public class Query {	
	
	public static boolean loginAdminQuery(String usr,String passw) throws Exception
	{
		Integer count=0;
		ResultSet rs = null;
		Connection con = ConnectionDB.getConnection();
		PreparedStatement stat=con.prepareStatement("SELECT * FROM admin_users WHERE  uname = ? AND pw = ?");
		stat.setString(1,usr);
		stat.setString(2, passw);
		rs = stat.executeQuery();//making tha query
		while (rs.next())
		{
			count++;
		}
		if(count==1)
		{
			return true;
		}
		return false;
	}
	
	public static ResultSet SelectCountry()  throws Exception
	{
		ResultSet rs = null;
		Connection con = ConnectionDB.getConnection();
		PreparedStatement stat = con.prepareStatement("SELECT full_name FROM country");
		rs = stat.executeQuery();		
		return rs;		
	}
	
	public static ResultSet SelectSchools(String countryFullName) throws Exception
	{
		Connection con = ConnectionDB.getConnection();
		PreparedStatement stat=con.prepareStatement("SELECT * FROM country, school WHERE school.country = country.short_name AND country.full_name = ?");
		stat.setString(1, countryFullName);
		return stat.executeQuery();
	}
}
