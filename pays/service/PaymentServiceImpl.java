package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.zerock.dao.PaymentDAO;
import org.zerock.domain.PaymementVO;

@Service("paymentService")
public class PaymentServiceImpl implements PaymentService{
	
	@Autowired(required = true)
	@Qualifier("paymentDAO")
	private PaymentDAO dao;
	
	@Override
	public void insertPaymentSuccess(PaymementVO vo) {
		dao.insertPaymentSuccess(vo);
	}

}
