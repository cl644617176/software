package utils;

import java.util.Scanner;

public class Test {

	public static int MAX_RANGE = 40;

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		FractionCalculation fCal = new FractionCalculation();
		Scanner sc = new Scanner(System.in);
		System.out.print("输入最多能接受的操作符总数：");
		int n = sc.nextInt();
		System.out.print("输入能接受的最大操作数：");
		int s = sc.nextInt();
		int sum = 0, trueSum = 0;
		char flag = 'y';
		while (flag == 'y') {
			sum++;// 记录做题总数
			String str = GenerateFormula.getFormula(n, s);
			System.out.print(str + "=");
			String userAnswer = sc.next().trim();
			// 判断是否为大于1的真分数
			if (userAnswer.indexOf("'") > 0) {
				String[] array = userAnswer.split("'");
				// 判断是否是负数的输入
				if (array[0].indexOf("-") >= 0) {
					Fraction a = new Fraction(Integer.parseInt(array[0]
							.split("-")[1]), 1);
					Fraction b = new Fraction(Integer.parseInt(array[1]
							.split("/")[0]), Integer.parseInt(array[1]
							.split("/")[1]));
					userAnswer = "-" + fCal.fraccalculate(a, '+', b).numerator
							+ "/" + fCal.fraccalculate(a, '+', b).denominator;
				} else {
					Fraction a = new Fraction(Integer.parseInt(array[0]), 1);
					Fraction b = new Fraction(Integer.parseInt(array[1]
							.split("/")[0]), Integer.parseInt(array[1]
							.split("/")[1]));
					userAnswer = fCal.fraccalculate(a, '+', b).numerator + "/"
							+ fCal.fraccalculate(a, '+', b).denominator;
				}
			}
			// 化简用户输入的结果
			if (userAnswer.indexOf("/") > 0) {
				if (userAnswer.split("/")[1].equals("1")) {
					userAnswer = userAnswer.split("/")[0];
				}
			}
			// 计算真正的结果并化简
			Fraction fa = Calculation.cal(str.trim());
			if (fa.numerator * fa.denominator < 0) {
				fa.numerator = fa.numerator > 0 ? -fa.numerator : fa.numerator;
				fa.denominator = fa.denominator > 0 ? fa.denominator
						: -fa.denominator;
			}
			String trueAnswer;
			if (fa.denominator == 1) {
				trueAnswer = fa.numerator + "";
			} else {
				if (fa.numerator == 0) {
					trueAnswer = "0";
				} else {
					trueAnswer = fa.numerator + "/" + fa.denominator;
				}
			}

			if (trueAnswer.equals(userAnswer)) {
				System.out.println("√");
				trueSum++;
			}
			else {
				System.out.println("×   正确答案是：" + trueAnswer);
			}

			System.out.println();
			System.out.print("是否继续(继续y , 退出n)：");
			flag = sc.next().charAt(0);
		}
		System.out.println("退出成功！  共做 "+sum+" 道题，做对 "+trueSum+" 道题，做错 "+(sum-trueSum)+" 道题。");
	}

}
