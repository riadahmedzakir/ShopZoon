package entity;

import java.io.*;
import java.util.*;
import java.text.*;
 

public class Config{
	public static final String root="G:/Tomcat/webapps/ROOT/";
	public static final String home="http://localhost:8080/";
 
	public static String timeUnic()
	{
		Date dNow = new Date( );
		SimpleDateFormat ft =new SimpleDateFormat ("yyyy_MM_dd_HH_mm_ss");
		String str =ft.format(dNow);
		return str;
	}

	public static String isImg(String str)
	{
		File f = new File(root+"img/"+str);
		if(f.exists() && f.isFile()) {  
			return home+"img/"+str;
		}
		else
		{
			return home+"img/profile.png";
		}
	} 

	public static int StrToInt( String x ){
		int i = 0;
		int num = 0;
		boolean isNeg = false; 
		if (x.charAt(0) == '-') 
		{
			isNeg = true;
			i = 1;
		}

		while( i < x.length()) 
		{
			num *= 10;
			num += x.charAt(i++) - '0'; 
		}

		if (isNeg) { num = -num;}
		return num;
	}
        
        public static String xx(int x){if(x==0){return "No";}else{return "Yes";}}
	 
}