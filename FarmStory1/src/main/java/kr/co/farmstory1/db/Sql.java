package kr.co.farmstory1.db;

public class Sql {
	
	// user
	public static final String INSERT_USER 		 = "INSERT INTO `board_user` SET "
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
	
	public static final String SELECT_USER 		 = "SELECT * FROM `board_user` WHERE `uid` =? and `pass`=SHA2(?, 256)";
	public static final String SELECT_COUNT_UID  = "SELECT COUNT(`uid`) FROM `board_user` WHERE `uid`=?;";
	public static final String SELECT_COUNT_NICK = "SELECT COUNT(`nick`) FROM `board_user` WHERE `nick` = ?;";
	public static final String SELECT_TERMS 	 = "SELECT * FROM `board_terms`";
	
	// board
	public static final String INSERT_ARTICLE = "INSERT INTO `board_article` SET "
//												+ "`parent`=?, `comment`=?, `hit`=?,"
												+ "`cate`=?, "
												+ "`title`=?,"
												+ "`content`=?,"
												+ "`file`=?,"
												+ "`uid`=?,"
												+ "`regip`=?,"
												+ "`rdate`=NOW()";
	// file
	public static final String INSERT_FILE = "INSERT INTO `board_file` SET "
											+ "`parent`=?,"
											+ "`newName`=?,"
											+ "`oriName`=?,"
											+ "`rdate`=NOW()";
	
	public static final String INSERT_COMMENT = "INSERT INTO `board_article` SET "
												+ "`parent` = ?, "
												+ "`content` = ? , "
												+ "`uid` = ? , "
												+ "`regip` = ? , "
												+ "`rdate` = NOW()";
	
	public static final String SELECT_MAX_NO = "SELECT MAX(`no`) FROM `board_article`";
	public static final String SELECT_COUNT_TOTAL = "SELECT COUNT(`no`) FROM `board_article` WHERE `parent` = 0 AND `cate`= ?";
	public static final String SELECT_ARTICLES = "SELECT a.*, b.`nick` FROM `board_article` AS a "
												+ "JOIN `board_user` AS b "
												+ "ON a.`uid` = b.`uid` "
												+ "WHERE `parent` = 0 AND `cate`= ? "
												+ "ORDER BY `no` DESC "
												+ "LIMIT ?, 10";
	
	public static final String SELECT_ARTICLE = "SELECT a.*, b.`fno`, b.`oriName`, b.`download` "
												+ "FROM `board_article` AS a "
												+ "LEFT JOIN `board_file` AS b "
												+ "ON a.`no` = b.`parent` "
												+ "WHERE `no` = ?";
	
	public static final String SELECT_FILE = "SELECT * FROM `board_file` WHERE `fno`= ?";
	public static final String SELECT_FILE_WITH_PARENT = "SELECT * FROM `board_file` WHERE `parent`= ?";
	
	public static final String UPDATE_ARTICLE_HIT = "UPDATE `board_article` "
													+ "SET `hit` = `hit`+1 "
													+ "WHERE `no` = ?"; 
	
	public static final String UPDATE_FILE_DOWNLOAD = "UPDATE `board_file` "
													+ "SET `download` = `download`+1 "
													+ "WHERE `fno` = ?";
	
	
	public static final String SELECT_COMMENTS = "SELECT a.* , b.nick "
												+ "FROM `board_article` AS a "
												+ "JOIN `board_user` AS b USING(`uid`) "
												+ "WHERE `parent` = ? "
												+ "ORDER BY `no` ASC";
	
	public static final String SELECT_COMMENT_LATEST = "SELECT a.*, b.nick "
														+ "FROM `board_article` AS a "
														+ "JOIN `board_user` AS b "
														+ "USING (`uid`) "
														+ "WHERE `parent` != 0 "
														+ "ORDER BY `no` DESC "
														+ "LIMIT 1;";
	public static final String SELECT_LATESTS = "(SELECT `no`, `title`, `rdate` FROM `board_article` WHERE `cate`='grow' ORDER BY `NO` DESC LIMIT 5) "
												+ "UNION "
												+ "(SELECT `no`, `title`, `rdate` FROM `board_article` WHERE `cate`='school' ORDER BY `NO` DESC LIMIT 5) "
												+ "UNION "
												+ "(SELECT `no`, `title`, `rdate` FROM `board_article` WHERE `cate`='story' ORDER BY `NO` DESC LIMIT 5)";
	public static final String SELECT_LATEST  = "SELECT `no`, `title`, `rdate` FROM `board_article` WHERE `cate`=? ORDER BY `NO` DESC LIMIT 3";
			
	public static final String UPDATE_COMMENT = "UPDATE `board_article` SET "
												+ "`content` = ?, "
												+ "`rdate`=NOW() "
												+ "WHERE `no`= ? ";
	
	// 댓글 삭제
	public static final String DELETE_COMMENT = "DELETE FROM `board_article` WHERE `no` = ?";
	
	// 게시글 수정
	public static final String UPDATE_ARTICLE = "UPDATE `board_article` SET `title` = ?, `content` = ?, `rdate` = NOW() WHERE `no` = ?";
	
	
	// 게시글 삭제
	public static final String DELETE_ARTICLE = "DELETE FROM `board_article` WHERE `no` = ? OR `parent` = ?";
	
	// 파일 삭제(DB)
	public static final String DELETE_FILE = "DELETE FROM `board_file` WHERE `parent` = ?";
	
	// 댓글수 증가
	public static final String UPDATE_ARTICLE_COMMENT = "UPDATE `board_article` SET `comment` = `comment`+1 WHERE `no`= ?";
	
}
