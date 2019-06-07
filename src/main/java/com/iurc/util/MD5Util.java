package com.iurc.util;

import java.security.MessageDigest;
/**
 *  对密码进行加密和验证的类  
 */
public abstract class MD5Util {
    /**  对字符串进行MD5加密     */  
    public final static String getMD5(String originString){
    	MessageDigest md5 = null;
        if (originString != null){   
            try{
                //1.获取一个MD5对象 
                md5 = MessageDigest.getInstance("MD5");                     
            } catch(Exception ex){
                ex.printStackTrace();
            }
          //2.将字符串对象中的每一个字符转换为一个字符数组
            char[] charArray = originString.toCharArray();   
            //3.定义一个长度和字符数组一样的字节数组  
            byte[] byteArray = new byte[charArray.length];
            //4.遍历字符数组，拿到每一个字符
            for(int i = 0;i<charArray.length;i++){
            	byteArray[i] = (byte)charArray[i];
            }
            //5.将MD5这个对象对字节数组进行摘要，得到一个摘要字节数组
            byte[] md5Bytes = md5.digest(byteArray);
            //6.把摘要数组的每一个字节转换成16进制，并且拼在一起得到了MD5值
            StringBuffer hexValue = new StringBuffer();
            for(int i = 0;i<md5Bytes.length;i++){
            	//7.把摘要字节数组中的每一个字节转换成16进制
            	int val = ((int)md5Bytes[i]) & 0xff;
            	if(val<16){//如果生成的数字未满32位，需要在前面补零
            		hexValue.append("0");
            	}
            	hexValue.append(Integer.toHexString(val));
            }
            
            return hexValue.toString();
        }//if    
        return null;
    }      
}