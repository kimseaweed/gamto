package com.ex.gamto.store.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.jsp.jstl.sql.Result;

public class DBConnection {
	public static Connection getConnection() throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		Result rs = null;

		try {
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "C##dbexam";
			String password = "m1234";
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("드라이버 등록 성공");
			System.out.println("접속 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("데이터베이스 연결이 실패하였습니다.");
			e.printStackTrace();
			System.out.println("==============");
			System.out.println(e.getMessage());
		}
		return conn;
	}

}
