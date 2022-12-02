package kr.co.FarmStory2.db;

public class Sql {
	
	
	public static final String SELECT_ARTICLES = "SELECT a.*, b.nick "
												+ "FROM `board_article` AS a "
												+ "JOIN `board_user` AS b "
												+ "USING(`uid`) "
												+ "WHERE `parent`=0 "
												+ "AND `cate`= ? "
												+ "ORDER BY a.`no` DESC "
												+ "LIMIT ?, 10;";
	public static final String SELECT_ARTICLE = "SELECT a.*, b.fno, b.oriName, b.download "
												+ "FROM `board_article` AS a "
												+ "LEFT JOIN `board_file` AS b "
												+ "ON a.`no` = b.`parent` "
												+ "WHERE `no` = ?";
	public static final String SELECT_COMMENTS = "SELECT a.*, b.nick "
												+ "FROM `board_article` AS a "
												+ "JOIN `board_user` AS b "
												+ "USING(`uid`) "
												+ "WHERE `parent` = ?";
	public static final String SELECT_COUNT_TOTAL = "SELECT COUNT(`no`) FROM `board_article` WHERE `parent` = 0 AND `cate` = ?";
	public static final String SELECT_TERMS = "SELECT * FROM `board_terms`";
	public static final String SELECT_COUNT_BY_UID = "SELECT COUNT(`uid`) FROM `board_user` WHERE `uid`= ?";
	public static final String SELECT_COUNT_BY_NICK = "SELECT COUNT(`uid`) FROM `board_user` WHERE `nick`= ?";
	public static final String SELECT_USER      = "SELECT * FROM `board_user` WHERE `uid`=? AND `pass`=SHA2(?, 256)";
	public static final String SELECT_MAX_NO 	= "SELECT MAX(`no`) FROM `board_article`";
	public static final String SELECT_FILE 		= "SELECT * FROM `board_file` WHERE `fno` =?";
	public static final String SELECT_COMMENT_RECENT = "SELECT a.*, b.nick "
													+ "FROM `board_article` AS a "
													+ "JOIN `board_user` AS b "
													+ "USING(`uid`) "
													+ "WHERE `no`=(SELECT MAX(`no`) FROM `board_article`)";
	public static final String SELECT_FILE_NEWNAME_BY_PARENT = "SELECT `newName` FROM `board_file` WHERE `parent` = ?";
	public static final String 	SELECT_ARTICLE_LATEST = "SELECT `no`,`title` FROM `board_article` WHERE `cate`= ? ORDER BY `no` DESC LIMIT 3";
	public static final String INSERT_USER      = "INSERT INTO `board_user` SET "
													+ "`uid`=?,"
													+ "`pass`=SHA2(?, 256),"
													+ "`name`=?,"
													+ "`nick`=?,"
													+ "`email`=?,"
													+ "`hp`=?,"
													+ "`zip`=?,"
													+ "`addr1`=?,"
													+ "`addr2`=?,"
													+ "`regip`=?,"
													+ "`rdate`=NOW()";
	public static final String INSERT_ARTICLE = "INSERT `board_article` SET `cate` = ?, `title` = ?, `content` = ?, `file` = ?, `uid` = ?, `regip` = ?, `rdate` = NOW()";
	public static final String INSERT_FILE = "INSERT `board_file` SET `parent` = ?, `newName` = ? , `oriName` = ?, rdate = NOW()";
	public static final String INSERT_COMMENT = "INSERT INTO `board_article` SET `parent` =?, `uid` = ?, `content`=?, `regip` = ?, `rdate`=NOW()";
	public static final String UPDATE_FILE_DOWNLOAD = "UPDATE `board_file` SET `download`= `download`+1 WHERE `fno` = ?";
	public static final String UPDATE_COMMENT_HIT = "UPDATE `board_article` SET `comment` = `comment`+1 WHERE `no` = ?";
	public static final String UPDATE_ARTICLE = "UPDATE `board_article` SET `title` = ?, `content` = ? WHERE `no` = ?";
	public static final String UPDATE_ARTICLE_HIT = "UPDATE `board_article` SET `hit`=`hit`+1 WHERE `no` = ?";
	public static final String DELETE_ARTICLE = "DELETE FROM `board_article` WHERE `no` = ? OR `parent` = ?";
	public static final String DELETE_FILE = "DELETE FROM `board_file` WHERE `parent` = ?";
}
