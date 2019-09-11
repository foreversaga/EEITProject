package finalProject;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

public class TestOrderString {

	public static void main(String[] args) {
		String body = "CustomField1=test&CustomField2=&CustomField3=&CustomField4=&"
				+ "MerchantID=2000132&MerchantTradeNo=20190911212122No8&"
				+ "PaymentDate=2019%2F09%2F11+21%3A22%3A13&PaymentType=Credit_CreditCard&"
				+ "PaymentTypeChargeFee=1&RtnCode=1&RtnMsg=Succeeded&SimulatePaid=0&"
				+ "StoreID=&TradeAmt=500&TradeDate=2019%2F09%2F11+21%3A21%3A29&"
				+ "TradeNo=1909112121291895&CheckMacValue="
				+ "67DAB16C73726978E468116160C1EFB5609622FF903152D572F2962B07CEEE4B";
		String[] bodys = body.split("&");
		for (int i = 0; i < bodys.length; i++) {
			if (bodys[i].substring(0, bodys[i].indexOf("=")).equals("MerchantTradeNo")) {
				// get tradeNo
				String MerchantTradeNo = bodys[i].substring(bodys[i].indexOf("=") + 1, bodys[i].length());
				String TradeNoDB = MerchantTradeNo.substring(MerchantTradeNo.indexOf("No") + 2,
						MerchantTradeNo.length());

			} else if (bodys[i].substring(0, bodys[i].indexOf("=")).equals("PaymentDate")) {
				// get payment date
				String PaymentDate = bodys[i].substring(bodys[i].indexOf("=") + 1, bodys[i].length());
				try {
					String url = URLDecoder.decode(PaymentDate, "UTF-8");
					System.out.println(url);
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			} else if (bodys[i].substring(0, bodys[i].indexOf("=")).equals("CustomField1")) {
				// get account
				String mAccount = bodys[i].substring(bodys[i].indexOf("=") + 1, bodys[i].length());
				System.out.println(mAccount);
			} else if (bodys[i].substring(0, bodys[i].indexOf("=")).equals("RtnCode")) {
				// get return code
				String ReturnCode = bodys[i].substring(bodys[i].indexOf("=") + 1, bodys[i].length());
				System.out.println(ReturnCode);
			}
		}
	}

}
