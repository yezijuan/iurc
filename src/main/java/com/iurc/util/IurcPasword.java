package com.iurc.util;

public class IurcPasword {
	public final static String getMD5(String MDpassword){
		return MD5Util.getMD5(MD5Util.getMD5(MDpassword));
	}
}
