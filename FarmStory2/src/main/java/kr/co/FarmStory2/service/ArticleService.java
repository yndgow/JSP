package kr.co.FarmStory2.service;

import kr.co.FarmStory2.dao.ArticleDAO;
import kr.co.FarmStory2.vo.TermsVO;

public enum ArticleService {
	INSTANCE;
	
	private ArticleDAO dao = ArticleDAO.getInstance();
	
	public TermsVO selectTerms() {
		return dao.selectTerms();
	}
}
