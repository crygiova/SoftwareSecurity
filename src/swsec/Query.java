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
	
	public static ResultSet SelectSchools(String countryFullName) throws Exception
	{
		Connection con = ConnectionDB.getConnection();
		PreparedStatement stat=con.prepareStatement("SELECT * FROM country, school WHERE school.country = country.short_name AND country.full_name = ?");
		stat.setString(1, countryFullName);
		return stat.executeQuery();
	}
}
