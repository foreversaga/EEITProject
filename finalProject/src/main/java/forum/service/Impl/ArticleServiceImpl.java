package forum.service.Impl;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import forum.model.ArticleBean;
import forum.service.ArticleService;

@Service
@Transactional
public class ArticleServiceImpl implements ArticleService {

	public void a() {
	ArticleBean fb=new ArticleBean();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd HH:mm:ss");
	String s=sdf.format(new Timestamp(System.currentTimeMillis()));
	try {
		fb.setaAddTime(new Timestamp(sdf.parse(s).getTime()));
	} catch (ParseException e) {
		e.printStackTrace();
	}
	}
}
