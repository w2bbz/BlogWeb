package com.wen.business.util;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

/**
 * okhttp3封装
 * @author admin
 *
 */
public class OkHttpClientUitl {

	/**
	 * okhttp3封装返回json
	 * @param url
	 * @return
	 */
	public static JSONObject getOkhttpJSON(String url) throws Exception{
		
		JSONObject object=new JSONObject();
		
		OkHttpClient okHttpClient = new OkHttpClient();
		
		Request request = new Request.Builder().url(url).build(); // 创建一个请求
        
		Response response = okHttpClient.newCall(request).execute(); // 返回实体
	        
		if(response.isSuccessful()){
			//只可以调一次response.body().string()
			object=JSON.parseObject(response.body().string());
			
			//object.put("ok", "true");
			
			return object;
			
		}
		
		return object;
	}
	
	//POST方法未实现 FIXME
	
}
