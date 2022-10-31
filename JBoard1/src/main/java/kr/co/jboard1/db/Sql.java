package kr.co.jboard1.db;

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
//												+ "`parent`=?,"
//												+ "`comment`=?,"
//												+ "`cate`=?,"
												+ "`title`=?,"
												+ "`content`=?,"
												+ "`file`=?,"
//												+ "`hit`=?,"
												+ "`uid`=?,"
												+ "`regip`=?,"
												+ "`rdate`=NOW()";
	// file
	public static final String INSERT_FILE = "INSERT INTO `board_file` SET "
											+ "`parent`=?,"
											+ "`newName`=?,"
											+ "`oriName`=?,"
											+ "`rdate`=NOW()";
	
	public static final String SELECT_MAX_NO = "SELECT MAX(`no`) FROM `board_article`";
	public static final String SELECT_COUNT_TOTAL = "SELECT COUNT(`no`) FROM `board_article`";
	public static final String SELECT_ARTICLES = "SELECT a.*, b.`nick` FROM `board_article` AS a "
												+ "JOIN `board_user` AS b "
												+ "ON a.`uid` = b.`uid` "
												+ "ORDER BY `no` DESC "
												+ "LIMIT ?, 10";
	
	public static final String SELECT_ARTICLE = "SELECT a.*, b.`fno`, b.`oriName`, b.`download` "
												+ "FROM `board_article` AS a "
												+ "LEFT JOIN `board_file` AS b "
												+ "ON a.`no` = b.`parent` "
												+ "WHERE `no` = ?";
	
	public static final String SELECT_FILE = "SELECT * FROM `board_file` WHERE `fno`= ?";
	
	public static final String UPDATE_ARTICLE_HIT = "UPDATE `board_article` "
													+ "SET `hit` = `hit`+1 "
													+ "WHERE `no` = ?"; 
	
	public static final String UPDATE_FILE_DOWNLOAD = "UPDATE `board_file` "
													+ "SET `download` = `download`+1 "
													+ "WHERE `fno` = ?";
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
