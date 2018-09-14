package com.yky.web.test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.util.DigestUtils;

public class UtilUrl {
	public static String loadJSON(String url) {
		StringBuilder json = new StringBuilder();
		try {
			URL oracle = new URL(url);
			URLConnection yc = oracle.openConnection();
			BufferedReader in = new BufferedReader(new InputStreamReader(yc
					.getInputStream(), "utf-8"));// 防止乱码
			String inputLine = null;
			while ((inputLine = in.readLine()) != null) {
				json.append(inputLine);
			}
			in.close();
		} catch (MalformedURLException e) {
		} catch (IOException e) {
		}
		return json.toString();
	}
	public static void main(String[] args) {
		String url = "https://auth.95516.com/authonl/onlineAuth/rest/verify/idCardInfSearch";
		//String json = loadJSON(url);
		//System.out.println(json);
		Map<String, String> map=new HashMap<String, String>();
		map.put("1", "aaa");
		map.put("2", "bbb");
		map.put("3", "ccc");
		System.out.println(map);

		
	}
}
