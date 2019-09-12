package finalProject;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Timestamp;

import checkout.service.orderService;
import checkout.service.impl.orderServiceImpl;

public class TestOrderString {

	public static void main(String[] args) {
		String body = "CustomField1=test&CustomField2=&CustomField3=&CustomField4=&"
				+ "MerchantID=2000132&MerchantTradeNo=20190911212122No36&"
				+ "PaymentDate=2019%2F09%2F11+21%3A22%3A13&PaymentType=Credit_CreditCard&"
				+ "PaymentTypeChargeFee=1&RtnCode=1&RtnMsg=Succeeded&SimulatePaid=0&"
				+ "StoreID=&TradeAmt=500&TradeDate=2019%2F09%2F11+21%3A21%3A29&"
				+ "TradeNo=1909112121291895&CheckMacValue="
				+ "67DAB16C73726978E468116160C1EFB5609622FF903152D572F2962B07CEEE4B";
		String[] bodys = body.split("&");
		String mAccount = "";
		int TradeNoDB = 0;
		Timestamp PaymentDate = new Timestamp(System.currentTimeMillis());
		for (int i = 0; i < bodys.length; i++) {
			if (bodys[i].substring(0, bodys[i].indexOf("=")).equals("MerchantTradeNo")) {
				// get tradeNo
				String MerchantTradeNo = bodys[i].substring(bodys[i].indexOf("=") + 1, bodys[i].length());
				String TradeNoDBStr = MerchantTradeNo.substring(MerchantTradeNo.indexOf("No") + 2,
						MerchantTradeNo.length());
				TradeNoDB = Integer.parseInt(TradeNoDBStr);

			} else if (bodys[i].substring(0, bodys[i].indexOf("=")).equals("PaymentDate")) {
				// get payment date
				String PaymentDateStr = bodys[i].substring(bodys[i].indexOf("=") + 1, bodys[i].length());
				try {
					PaymentDateStr = URLDecoder.decode(PaymentDateStr, "UTF-8");
					PaymentDateStr = PaymentDateStr.replace("/", "-");
					PaymentDate = Timestamp.valueOf(PaymentDateStr);
					System.out.println(PaymentDateStr);
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			} else if (bodys[i].substring(0, bodys[i].indexOf("=")).equals("CustomField1")) {
				// get account
				mAccount = bodys[i].substring(bodys[i].indexOf("=") + 1, bodys[i].length());

			} else if (bodys[i].substring(0, bodys[i].indexOf("=")).equals("RtnCode")) {
				// get return code
				String ReturnCode = bodys[i].substring(bodys[i].indexOf("=") + 1, bodys[i].length());

			}
		}
		orderService service = new orderServiceImpl();
		service.updateOrderAfterCheckout(TradeNoDB, PaymentDate, mAccount);

	}

}
