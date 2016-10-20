package utils;

import java.util.Scanner;

public class Test {

	public static int MAX_RANGE = 40;

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		FractionCalculation fCal = new FractionCalculation();
		Scanner sc = new Scanner(System.in);
		System.out.print("��������ܽ��ܵĲ�����������");
		int n = sc.nextInt();
		System.out.print("�����ܽ��ܵ�����������");
		int s = sc.nextInt();
		int sum = 0, trueSum = 0;
		char flag = 'y';
		while (flag == 'y') {
			sum++;// ��¼��������
			String str = GenerateFormula.getFormula(n, s);
			System.out.print(str + "=");
			String userAnswer = sc.next().trim();
			// �ж��Ƿ�Ϊ����1�������
			if (userAnswer.indexOf("'") > 0) {
				String[] array = userAnswer.split("'");
				// �ж��Ƿ��Ǹ���������
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
			// �����û�����Ľ��
			if (userAnswer.indexOf("/") > 0) {
				if (userAnswer.split("/")[1].equals("1")) {
					userAnswer = userAnswer.split("/")[0];
				}
			}
			// ���������Ľ��������
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
				System.out.println("��");
				trueSum++;
			}
			else {
				System.out.println("��   ��ȷ���ǣ�" + trueAnswer);
			}

			System.out.println();
			System.out.print("�Ƿ����(����y , �˳�n)��");
			flag = sc.next().charAt(0);
		}
		System.out.println("�˳��ɹ���  ���� "+sum+" ���⣬���� "+trueSum+" ���⣬���� "+(sum-trueSum)+" ���⡣");
	}

}
