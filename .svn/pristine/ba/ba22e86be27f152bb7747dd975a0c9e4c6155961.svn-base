package eshop_manager.util;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MySqlSessionFactory {
	private static MySqlSessionFactory instance=new MySqlSessionFactory();
	private MySqlSessionFactory(){};
	public static MySqlSessionFactory getInstance(){
		return instance;
	}
	
	
	//具备一个属性
	private SqlSessionFactory factory=new SqlSessionFactoryBuilder().build(MySqlSessionFactory.class.getResourceAsStream("/SQLMapConfig.xml"));
	public SqlSessionFactory getFactory(){
		return factory;
	}
}
