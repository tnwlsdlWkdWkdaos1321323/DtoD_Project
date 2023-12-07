package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.zerock.domain.PaymementVO;
import org.zerock.service.PaymentService;

@RestController
@RequestMapping("/pays") // 클래스 레벨에서 URI 매핑 prefix 설정
public class PaysController {

    @Autowired
    private PaymentService paymentService;

    // paymentProcess.do에 대한 매핑 추가
    @RequestMapping(value = "/paymentProcess.do")
    public void paymentProcess(@RequestBody PaymementVO vo) {
        paymentService.insertPaymentSuccess(vo);
    }

    @RequestMapping(value = "/paymentDone.do")
    public ModelAndView fwdPaymentSuccessPage() {
        return new ModelAndView("/pays/paymentSuccess");
    }

    @RequestMapping(value = {"/payment.do"})
    public ModelAndView fwdPaymentPage() {
        return new ModelAndView("/pays/payment");
    }
}

