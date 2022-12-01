package kr.co.FarmStory2.dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.FarmStory2.db.DBHelper;
import kr.co.FarmStory2.db.Sql;
import kr.co.FarmStory2.vo.ArticleVO;
import kr.co.FarmStory2.vo.FileVO;
import kr.co.FarmStory2.vo.TermsVO;

public class ArticleDAO extends DBHelper{
	
	private static ArticleDAO INSTANCE = new ArticleDAO();
	public static ArticleDAO getInstance() {
		return INSTANCE;
	}
	private ArticleDAO() {};
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public TermsVO selectTerms() {
		TermsVO vo = null;
		try {
			logger.info("selectTerms...");
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(Sql.SELECT_TERMS);
			if(rs.next()) {
				vo = new TermsVO();
				vo.setTerms(rs.getString(1));
				vo.setPrivacy(rs.getString(2));
			}
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("vo : "+vo);
		return vo;
	}
	
	public List<ArticleVO> selectArticles(String cate, int start){
		List<ArticleVO> articles = new ArrayList<>();
		try {
			logger.info("selectArticles...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_ARTICLES);
			psmt.setString(1, cate);
			psmt.setInt(2, start);
			rs = psmt.executeQuery();
			while(rs.next()) {
				ArticleVO vo = new ArticleVO();
				vo.setNo(rs.getInt(1));
				vo.setParent(rs.getInt(2));
				vo.setComment(rs.getInt(3));
				vo.setCate(rs.getString(4));
				vo.setTitle(rs.getString(5));
				vo.setContent(rs.getString(6));
				vo.setFile(rs.getInt(7));
				vo.setHit(rs.getInt(8));
				vo.setUid(rs.getString(9));
				vo.setRegip(rs.getString(10));
				vo.setRdate(rs.getString(11).substring(2,10));
				vo.setNick(rs.getString(12));
				articles.add(vo);
			}
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("articles : "+articles);
		return articles;
	}
	
	public ArticleVO selectArticle(String no){
		ArticleVO vo= null;
		try {
			logger.info("selectArticle...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_ARTICLE);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			if(rs.next()) {
				vo = new ArticleVO();
				vo.setNo(rs.getInt(1));
				vo.setParent(rs.getInt(2));
				vo.setComment(rs.getInt(3));
				vo.setCate(rs.getString(4));
				vo.setTitle(rs.getString(5));
				vo.setContent(rs.getString(6));
				vo.setFile(rs.getInt(7));
				vo.setHit(rs.getInt(8));
				vo.setUid(rs.getString(9));
				vo.setRegip(rs.getString(10));
				vo.setRdate(rs.getString(11).substring(2,10));
				vo.setFno(rs.getInt(12));
				vo.setOriName(rs.getString(13));
				vo.setDownload(rs.getInt(14));
			}
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("vo : " + vo);
		return vo;
	}
	public int selectCountTotal(String cate) {
		int result = 0;
		try {
			logger.info("selectCountTotal...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_COUNT_TOTAL);
			psmt.setString(1, cate);
			rs = psmt.executeQuery();
			if(rs.next()) result = rs.getInt(1);
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("result : " + result);
		return result;
	}
	
	public int selectCountTotalKeyword(String keyword) {
		int result = 0;
		
		return result;
	}
	
	public FileVO selectFile(String fno) {
		FileVO vo = null;
		try {
			logger.info("selectFile...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_FILE);
			psmt.setString(1, fno);
			rs = psmt.executeQuery();
			if(rs.next()) {
				vo = new FileVO();
				vo.setParent(rs.getInt(2));
				vo.setNewName(rs.getString(3));
				vo.setOriName(rs.getString(4));
			}
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("vo: " + vo);
		return vo;
	}
	
	
	public int insertArticle(ArticleVO vo) {
		int result = 0;
		int parent = 0;
		try {
			logger.info("insertArticle...");
			conn = getConnection();
			conn.setAutoCommit(false);
			psmt = conn.prepareStatement(Sql.INSERT_ARTICLE);
			psmt.setString(1, vo.getCate());
			psmt.setString(2, vo.getTitle());
			psmt.setString(3, vo.getContent());
			psmt.setInt(4, vo.getFile());
			psmt.setString(5, vo.getUid());
			psmt.setString(6, vo.getRegip());
			result = psmt.executeUpdate();
			
			stmt = conn.createStatement();
			rs =stmt.executeQuery(Sql.SELECT_MAX_NO);
			conn.commit();
			
			if(rs.next()) parent = rs.getInt(1);
			
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("result : " + result);
		logger.debug("parent : " + parent);
		return parent;
	}
	
	public void insertFile(int parent, String newName, String oriName) {
		int result = 0;
		try {
			logger.info("insertFile...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.INSERT_FILE);
			psmt.setInt(1, parent);
			psmt.setString(2, newName);
			psmt.setString(3, oriName);
			result = psmt.executeUpdate();
			
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("result : " + result);
	}
	
	public void updateFileDownload(String fno) {
		int result = 0;
		try {
			logger.info("updateFileDownload...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.UPDATE_FILE_DOWNLOAD);
			psmt.setString(1, fno);
			result = psmt.executeUpdate();
			
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("result : " + result);
	}
	
	
	public void deleteArticle(String no) {
		int result = 0;
		try {
			logger.info("deleteArticle...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.DELETE_ARTICLE); // 글 삭제
			psmt.setString(1, no);
			result = psmt.executeUpdate();
			
			// 댓글삭제
			
			// 파일삭제
			
			
			
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("result : " + result);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}