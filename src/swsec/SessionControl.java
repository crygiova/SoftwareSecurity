package swsec;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.servlet.http.*;

public class SessionControl {
	
	private final static int sessionshort = 5;
	private final static int sessionormal = 120;//2 minutes
	private final static int sessionlong = 300;//5 minutes
	
	/**TRUE if the session is expired
	 * FALSE if is not expired*/
	public static boolean isExpiredAdmin(HttpSession session)
	{
		if((session.getAttribute("user")==null || session.getAttribute("user")=="") && session.getAttribute("admin")!="yes")
		{	
			return true;
		}	
		return false;
	}
	
	public static boolean isExpired(HttpSession session)
	{
		if((session.getAttribute("login")==null || session.getAttribute("login")==""))
		{	
			return true;
		}	
		return false;
	}
	
	/*timeout of 5 seconds*/
	public static int getSessShort()
	{
		return sessionshort;
	}
	/* timeout of30 second*/
	public static int getSessNormal()
	{
		return sessionormal;
	}
	/*timeout of 60 second*/
	public static int getSessLong()
	{
		return sessionlong;
	}
	
	public static boolean verifyEmailAddress(String regEmail) 
	{
	    boolean result = true;
	   try {
	        InternetAddress emailAddr = new InternetAddress(regEmail);
	        emailAddr.validate();
	    } catch (AddressException ex) {
	        result = false;
	    }
	    return result;
	}
}
