package database.dao.Impl;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.sql.Blob;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletContext;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cart.model.orderBean;
import cart.model.orderItemBean;
import config.SystemUtils;
import database.dao.DatabaseDao;
import product.model.productBean;
import register.model.MemberBean;
import review.model.reviewBean;

@Repository
public class DatabaseDaoImpl implements DatabaseDao {
	@Autowired
	SessionFactory factory;
	@Autowired
	ServletContext context;

	@Override
	public void addProductDB() {
		Session session = factory.getCurrentSession();
		String line = "";
		String UTF8_BOM = "\uFEFF";
		String datPath = context.getRealPath("/WEB-INF/resource/data/product.dat");
		File file = new File(datPath);
		try (FileInputStream fis = new FileInputStream(file);
				InputStreamReader isr = new InputStreamReader(fis, "UTF8");
				BufferedReader br = new BufferedReader(isr);) {
			while ((line = br.readLine()) != null) {
				System.out.println("line=" + line);
				// 去除 UTF8_BOM: \uFEFF
				if (line.startsWith(UTF8_BOM)) {
					line = line.substring(1);
				}
				String[] token = line.split("\\|");
				productBean pb = new productBean();
				pb.setpArea(token[0].trim());
				pb.setpAvgRating(Double.parseDouble(token[1].trim()));
				pb.setpContent(token[2]);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date dateRange = sdf.parse(token[3]);
				java.sql.Date sqldate = new java.sql.Date(dateRange.getTime());
				pb.setpDateRange(sqldate);
				String realPath = context.getRealPath(token[4].trim());
				Blob blob = SystemUtils.fileToBlob(realPath);
				pb.setpPicture(blob);
				pb.setpFileName(SystemUtils.extractFileName(token[4].trim()));
				pb.setpInstock(Integer.parseInt(token[5]));
				pb.setpName(token[6]);
				pb.setpPopular(Integer.parseInt(token[7]));
				pb.setpPrice(Integer.parseInt(token[8]));
				pb.setpRating(Integer.parseInt(token[9]));
				pb.setpType(token[10]);
				pb.setpLat(token[11]);
				pb.setpLng(token[12]);
				session.save(pb);
				System.out.println("新增一筆商品");
			}
			// 印出資料新增成功的訊息
			System.out.println("商品資料新增成功");
		} catch (Exception e) {
			System.err.println("新建表格時發生例外: " + e.getMessage());
			e.printStackTrace();
		}
	}

	@Override
	public void addReviewDB() {
		Session session = factory.getCurrentSession();
		String line = "";
		String UTF8_BOM = "\uFEFF";
		String datPath = context.getRealPath("/WEB-INF/resource/data/review.dat");
		File file = new File(datPath);
		try (FileInputStream fis = new FileInputStream(file);
				InputStreamReader isr = new InputStreamReader(fis, "UTF8");
				BufferedReader br = new BufferedReader(isr);) {
			while ((line = br.readLine()) != null) {
				System.out.println("line=" + line);
				// 去除 UTF8_BOM: \uFEFF
				if (line.startsWith(UTF8_BOM)) {
					line = line.substring(1);
				}
				String[] token = line.split("\\|");
				reviewBean rb = new reviewBean();
				rb.setmAccount(token[0].trim());
				rb.setmName(token[1].trim());
				rb.setpId(Integer.parseInt(token[2]));
				rb.setrRating(Integer.parseInt(token[3]));
				rb.setrReview(token[4]);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				Date dateRange = sdf.parse(token[5]);
				java.sql.Timestamp date = new java.sql.Timestamp(dateRange.getTime());
				rb.setrTimestamp(date);
				rb.setrTitle(token[6]);
				session.save(rb);
				System.out.println("新增一筆評價");
			}
			// 印出資料新增成功的訊息
			System.out.println("評價資料新增成功");
		} catch (Exception e) {
			System.err.println("新建表格時發生例外: " + e.getMessage());
			e.printStackTrace();
		}
	}

	@Override
	public void addMemberDB() {
		Session session = factory.getCurrentSession();
		String line = "";
		String UTF8_BOM = "\uFEFF";
		String datPath = context.getRealPath("/WEB-INF/resource/data/member.dat");
		File file = new File(datPath);
		try (FileInputStream fis = new FileInputStream(file);
				InputStreamReader isr = new InputStreamReader(fis, "UTF8");
				BufferedReader br = new BufferedReader(isr);) {
			while ((line = br.readLine()) != null) {
				System.out.println("line=" + line);
				// 去除 UTF8_BOM: \uFEFF
				if (line.startsWith(UTF8_BOM)) {
					line = line.substring(1);
				}
				String[] token = line.split("\\|");
				MemberBean mb = new MemberBean();
				mb.setmAccount(token[0].trim());
				mb.setmAddress(token[1].trim());
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date dateRange = sdf.parse(token[2]);
				java.sql.Date sqldate = new java.sql.Date(dateRange.getTime());
				mb.setmDate(sqldate);
				mb.setmEmail(token[3].trim());
				mb.setmGender(token[4].trim());
				mb.setmName(token[5].trim());
				mb.setmPassword(token[6].trim());
				mb.setmPhone(token[7].trim());
				String realPath = context.getRealPath(token[8].trim());
				Blob blob = SystemUtils.fileToBlob(realPath);
				mb.setmPicture(blob);
				mb.setmFileName(SystemUtils.extractFileName(token[8].trim()));
				session.save(mb);
				System.out.println("新增一筆會員資料");
			}
			// 印出資料新增成功的訊息
			System.out.println("會員資料新增成功");
		} catch (Exception e) {
			System.err.println("新建表格時發生例外: " + e.getMessage());
			e.printStackTrace();
		}
	}

	@Override
	public void addOrderDB() {
		Session session = factory.getCurrentSession();
		String line = "";
		String UTF8_BOM = "\uFEFF";
		String datPath = context.getRealPath("/WEB-INF/resource/data/order.dat");
		File file = new File(datPath);
		try (FileInputStream fis = new FileInputStream(file);
				InputStreamReader isr = new InputStreamReader(fis, "UTF8");
				BufferedReader br = new BufferedReader(isr);) {
			while ((line = br.readLine()) != null) {
				System.out.println("line=" + line);
				// 去除 UTF8_BOM: \uFEFF
				if (line.startsWith(UTF8_BOM)) {
					line = line.substring(1);
				}
				String[] token = line.split("\\|");
				orderBean ob = new orderBean();
				orderItemBean oib = new orderItemBean();
				Set<orderItemBean> items = new HashSet<orderItemBean>();
				ob.setmAccount(token[0].trim());
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				Date dateRange = sdf.parse(token[1]);
				java.sql.Timestamp date = new java.sql.Timestamp(dateRange.getTime());
				ob.setoTimestamp(date);
				ob.setoTotalAmount(Integer.parseInt(token[2].trim()));
				ob.setoAddress(token[3]);
				ob.setoNote(token[4]);
				// add orderitem
				oib.setiQty(Integer.parseInt(token[5].trim()));
				oib.setpId(Integer.parseInt(token[6].trim()));
				oib.setUnitPrice(Integer.parseInt(token[7].trim()));
				Integer subtotal = (oib.getiQty() * oib.getUnitPrice());
				String iDes = token[8] + " 共 " + oib.getiQty().toString() + "個，金額小計:" + subtotal.toString();
				oib.setiDes(iDes);
				ob.setoReceiveName(token[9]);
				ob.setoReceivePhone("0912345678");
				Date paydate = sdf.parse(token[10]);
				java.sql.Timestamp paymentdate = new java.sql.Timestamp(paydate.getTime());
				ob.setoPaymentDate(paymentdate);
				ob.setoPaymentStatus("已付款");
				ob.setmName(token[11]);
				oib.setOrderBean(ob);
				items.add(oib);
				ob.setItemSet(items);
				session.save(ob);
				System.out.println("新增一筆訂單");
			}
			// 印出資料新增成功的訊息
			System.out.println("評價資料新增成功");
		} catch (Exception e) {
			System.err.println("新建表格時發生例外: " + e.getMessage());
			e.printStackTrace();
		}
	}
}
