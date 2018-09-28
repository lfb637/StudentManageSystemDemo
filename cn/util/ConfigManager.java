package cn.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/*
 * @ Copyright (c) Create by JASON  Date:2018-02-09  All rights reserved.
 * @ class description�������࣬��������properties�ļ�
 *
 */
public class ConfigManager {
	private Properties properties;
	private static ConfigManager configManager;
	public ConfigManager(){
		String filePath="database.properties";
		InputStream is = ConfigManager.class.getClassLoader().getResourceAsStream(filePath);
		properties = new Properties();
		try {
			properties.load(is);
			is.close();
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	
	//����Ψһһ��ʵ������ʹ���˵���ģʽ
	public static synchronized ConfigManager getInstance(){
		if(configManager == null){
			configManager = new ConfigManager();
		}
		return configManager;
	}
	public String getString(String key){
		return properties.getProperty(key);
	}
}


