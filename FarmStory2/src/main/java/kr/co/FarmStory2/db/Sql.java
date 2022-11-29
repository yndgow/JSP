package kr.co.FarmStory2.db;

public class Sql {
	public static final String SELECT_TERMS = "SELECT * FROM `board_terms`";
	public static final String SELECT_COUNT_BY_UID = "SELECT COUNT(`uid`) FROM `board_user` WHERE `uid`= ?";
	public static final String SELECT_COUNT_BY_NICK = "SELECT COUNT(`uid`) FROM `board_user` WHERE `nick`= ?";
}
