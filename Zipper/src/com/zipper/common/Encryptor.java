package com.zipper.common;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public class Encryptor {
	public static String getSHA512(String pwd) {
		
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			byte[] bytes = pwd.getBytes(Charset.forName("UTF-8"));
			md.update(bytes);
			 
			return Base64.getEncoder().encodeToString(md.digest());

		} catch (NoSuchAlgorithmException e) {
	         
			System.out.println("암호화 에러 발생!");
			e.printStackTrace();
			
			return null;
		}
	}
}
