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
	
	public List<ArticleVO> selectComments(String parent){
		List<ArticleVO> comments = new ArrayList<>();
		try {
			logger.info("selectArticle...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_COMMENTS);
			psmt.setString(1, parent);
			rs = psmt.executeQuery();
			if(rs.next()) {
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
				comments.add(vo);
			}
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("comments : " + comments);
		return comments;
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
	
	public List<ArticleVO> selectArticleLatest(String cate){
		List<ArticleVO> articles = new ArrayList<>();
		try {
			logger.info("selectArticleLatest...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_ARTICLE_LATEST);
			psmt.setString(1, cate);
			rs = psmt.executeQuery();
			while(rs.next()) {
				ArticleVO vo = new ArticleVO();
				vo.setNo(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				articles.add(vo);
			}
			psmt.close();
			conn.close();
			rs.close();
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("articles : "+articles);
		return articles;
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
	
	public ArticleVO insertComment(ArticleVO vo) {
		int result = 0;
		ArticleVO article = null;
		try {
			logger.info("insertComment...");
			conn = getConnection();
			conn.setAutoCommit(false);
			psmt = conn.prepareStatement(Sql.INSERT_COMMENT);
			psmt.setInt(1, vo.getParent());
			psmt.setString(2, vo.getUid());
			psmt.setString(3, vo.getContent());
			psmt.setString(4, vo.getRegip());
			result = psmt.executeUpdate();
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(Sql.SELECT_COMMENT_RECENT);
			if(rs.next()) {
				article = new ArticleVO();
				article.setNo(rs.getInt(1));
				article.setParent(rs.getInt(2));
				article.setComment(rs.getInt(3));
				article.setCate(rs.getString(4));
				article.setTitle(rs.getString(5));
				article.setContent(rs.getString(6));
				article.setFile(rs.getInt(7));
				article.setHit(rs.getInt(8));
				article.setUid(rs.getString(9));
				article.setRegip(rs.getString(10));
				article.setRdate(rs.getString(11).substring(2,10));
				article.setNick(rs.getString(12));
			}
			conn.commit();
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("result : " + result);
		logger.debug("article : " + article);
		return article;
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
	
	public int updateCommentHit(String parent) {
		int result = 0;
		try {
			logger.info("updateCommentHit...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.UPDATE_COMMENT_HIT);
			psmt.setString(1, parent);
			result = psmt.executeUpdate();
			
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("result : " + result);
		return result;
	}
	
	public void updateArticle(String no, String title, String content) {
		int result = 0;
		try {
			logger.info("updateArticle...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.UPDATE_ARTICLE);
			psmt.setString(1, title);
			psmt.setString(2, content);
			psmt.setString(3, no);
			result = psmt.executeUpdate();
			
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("result : " + result);
	}
	
	public void updateArticleHit(String no) {
		int result = 0;
		try {
			logger.info("updateArticleHit...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.UPDATE_ARTICLE_HIT);
			psmt.setString(1, no);
			result = psmt.executeUpdate();
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("result : " + result);
	}
	public String deleteArticle(String no, String file) {
		int result1 = 0;
		int result2 = 0;
		String newName = null;
		try {
			logger.info("deleteArticle...");
			conn = getConnection();
			conn.setAutoCommit(false);
			psmt = conn.prepareStatement(Sql.DELETE_ARTICLE); // 글, 댓글 삭제
			psmt.setString(1, no);
			psmt.setString(2, no);
			result1 = psmt.executeUpdate();
			
			logger.info("selectfilenewname...");
			psmt = conn.prepareStatement(Sql.SELECT_FILE_NEWNAME_BY_PARENT); //파일 이름 찾기
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			if(rs.next()) newName = rs.getString(1);
 			
			if(file != null) {
				logger.info("deletefile...");
				psmt = conn.prepareStatement(Sql.DELETE_FILE); // 파일삭제
				psmt.setString(1, no);
				result2 = psmt.executeUpdate();
			}
			conn.commit();
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("result1 : " + result1);
		logger.debug("result2 : " + result2);
		logger.debug("newName : " + newName);
		return newName;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}