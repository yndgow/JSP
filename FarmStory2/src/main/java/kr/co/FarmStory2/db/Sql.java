package kr.co.FarmStory2.db;

public class Sql {
	public static final String SELECT_TERMS = "SELECT * FROM `board_terms`";
	public static final String SELECT_COUNT_BY_UID = "SELECT COUNT(`uid`) FROM `board_user` WHERE `uid`= ?";
	public static final String SELECT_COUNT_BY_NICK = "SELECT COUNT(`uid`) FROM `board_user` WHERE `nick`= ?";
	public static final String SELECT_USER      = "SELECT * FROM `board_user` WHERE `uid`=? AND `pass`=SHA2(?, 256)";
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
}
