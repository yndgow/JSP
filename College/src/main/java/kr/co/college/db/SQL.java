package kr.co.college.db;

public class SQL {
	// 강좌
	public static final String SELECT_LECTURES = "SELECT * FROM `lecture`";
	public static final String INSERT_LECTURE = "INSERT `lecture` SET "
												+ "`lecNo`=?, "
												+ "`lecName`=?, "
												+ "`lecCredit`=?, "
												+ "`lecTime`=?, "
												+ "`lecClass`=?";
										
	// 수강
	public static final String SELECT_REGISTERS = "SELECT b.stdName, c.lecName, a.* "
												+ "FROM `register` AS a "
												+ "JOIN `student` AS b ON a.regStdNo = b.stdNo "
												+ "JOIN `lecture` AS c ON c.lecNo = a.regLecNo";
	public static final String SELECT_REGISTER_STDNO = "SELECT b.stdName, c.lecName, a.* "
														+ "FROM `register` AS a "
														+ "JOIN `student` AS b ON a.regStdNo = b.stdNo "
														+ "JOIN `lecture` AS c ON c.lecNo = a.regLecNo "
														+ "WHERE a.`regStdNo` = ?";
	public static final String INSERT_REGISTER = "INSERT `register` SET "
												+ "`regStdNo`=?, "
												+ "`regLecNo`=?, "
												+ "`regMidScore`=?, "
												+ "`regFinalScore`=?, "
												+ "`regTotalScore`=?, "
												+ "`regGrade`=?";
	
	// 학생
	public static final String SELECT_STUDENTS= "SELECT * FROM `student`";
	public static final String INSERT_STUDENT= "INSERT `student` SET "
												+ "`stdNo`=?, "
												+ "`stdName`=?, "
												+ "`stdHp`=?, "
												+ "`stdYear`=?, "
												+ "`stdAddress`=?";
}