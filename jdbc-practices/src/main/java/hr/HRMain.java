package hr;

import java.util.List;
import java.util.Scanner;

public class HRMain {

	// 3. 실습문제 - 1 (HRMain, EmployeeVo, EmployeeDao)
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);

		System.out.print("이름>");
		String name = scanner.nextLine();

		EmployeeDao dao = new EmployeeDao();
		List<EmployeeVo> list = dao.findByName(name);
		for (EmployeeVo vo : list) {
			System.out.println(vo);
		}

		scanner.close();
	}

}