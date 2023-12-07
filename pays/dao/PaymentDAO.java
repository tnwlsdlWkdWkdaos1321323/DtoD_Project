package org.zerock.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Repository;
import org.zerock.domain.PaymementVO;

@Repository // DB와 연계되는 파일이라는 것을 알려줌
public class PaymentDAO {
	
	// sqlMapper : 오라클 DB와 연계하는 애
	private static SqlSessionFactory sqlMapper;
	
	// SqlSessionFactory이 mybatis-config.xml얘를 물고 데이터베이스를 처리한다. 
	private static SqlSessionFactory getInstance() {
		if(sqlMapper == null) {
			String resource = "mybatis-config.xml";
			
			Reader reader;
			try {
				reader = Resources.getResourceAsReader(resource);
				sqlMapper = new SqlSessionFactoryBuilder().build(reader);
				reader.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return sqlMapper;
	}
	
	public void insertPaymentSuccess(PaymementVO vo) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		session.insert("payment.insertPaymentSuccess", vo);
		session.commit();
	}

}
