package utils;

public class GenerateFormula {

	// e := n | e1 + e2 | e1 − e2 | e1 × e2 | e1 ÷ e2 | (e) , 其中e,
	// e1和e2为表达式，n为自然数或真分数
	public static int n = 0;
	// nmax为最多的操作符
	public static int nMax = 3;
	// s为最大数
	public static int s = 10;

	public static int maxyueshu(int a, int b) {
		return a % b == 0 ? b : maxyueshu(b, a % b);
	}

	public static String getTrueFraction() {
		int i, j;// i分子，j分母，分母要大于分子，要约粉
		while (true) {
			i = (int) (Math.random() * 100) % s + 1;
			j = (int) (Math.random() * 100) % s + 1;
			if ((j > i) && (j != 1)) {
				int max = maxyueshu(j, i);
				i /= max;
				j /= max;
				return i + "@" + j;
			}
		}
	}

	public static String fourRan(int pre) {
		// pre代表上一步的运算符，1+ 2- 3* 4/ 5（） 6数

		int i = (int) (Math.random() * 100) % 6 + 1;

		String str = "";
		if (n < nMax)
			;
		else
			i = 6;
		switch (i) {
		case 1:
			n++;
			str = fourRan(1) + "+" + fourRan(1);
			break;
		case 2:
			n++;
			str = fourRan(2) + "-" + fourRan(2);
			break;
		case 3:
			n++;
			str = fourRan(3) + "*" + fourRan(3);
			break;
		case 4:
			n++;
			str = fourRan(4) + "/" + fourRan(4);
			break;
		case 5:
			str = "(" + fourRan(5) + ")";
			break;
		case 6:
			int temp = (int) (Math.random() * 100) % 2 + 1;
			if (temp == 1) {
				// 生成数字返回
				if (pre == 4) {
					return (int) (Math.random() * s) + 1 + "";
				} else {
					return (int) (Math.random() * s) + "";
				}

			} else {
				if (pre == 5) {
					return getTrueFraction();
				} else
					return getTrueFraction();

			}
		}

		return str;
	}

	public static String fourRanPPPP(int pre) {
		// pre代表上一步的运算符，1+ 2- 3* 4/ 5（） 6数
		// n++;
		int i = (int) (Math.random() * 100) % 6 + 1;

		String str = "";
		if (n < nMax)
			;
		else
			i = 6;
		switch (i) {
		case 1:
			n++;
			str = fourRanPPPP(1) + "+" + fourRanPPPP(1);
			break;
		case 2:
			n++;
			str = fourRanPPPP(2) + "-" + fourRanPPPP(2);
			break;
		case 3:
			n++;
			str = fourRanPPPP(3) + "*" + fourRanPPPP(3);
			break;
		case 4:
			n++;
			str = fourRanPPPP(4) + "/" + fourRanPPPP(4);
			break;
		case 5:
			str = "(" + fourRanPPPP(5) + ")";
			break;
		case 6:
			// 生成数字返回
			if (pre == 4) {
				return (int) (Math.random() * s) + 1 + "";
			} else {
				return (int) (Math.random() * s) + "";
			}

		}

		return str;
	}

	public static String fourRanMMMM(int pre) {
		// pre代表上一步的运算符，1+ 2- 3* 4/ 5（） 6数
		int i = (int) (Math.random() * 100) % 6 + 1;

		String str = "";
		if (n < nMax)
			;
		else
			i = 6;
		switch (i) {
		case 1:
			n++;
			str = fourRanMMMM(1) + "+" + fourRanMMMM(1);
			break;
		case 2:
			n++;
			str = fourRanMMMM(2) + "-" + fourRanMMMM(2);
			break;
		case 3:
			n++;
			str = fourRanMMMM(3) + "*" + fourRanMMMM(3);
			break;
		case 4:
			n++;
			str = fourRanMMMM(4) + "/" + fourRanMMMM(4);
			break;
		case 5:
			str = "(" + fourRanMMMM(5) + ")";
			break;
		case 6:
			return getTrueFraction();
		}

		return str;
	}

	public static String generatePrimaryFormula() {
		n = 0;
		String str = "", result = "";
		int i;
		i = (int) (Math.random() * 100) % 4 + 1;
		switch (i) {
		case 1:
			n++;
			str = fourRanPPPP(1) + "+" + fourRanPPPP(1);
			break;
		case 2:
			n++;
			str = fourRanPPPP(2) + "-" + fourRanPPPP(2);
			break;
		case 3:
			n++;
			str = fourRanPPPP(3) + "*" + fourRanPPPP(3);
			break;
		case 4:
			n++;
			str = fourRanPPPP(4) + "/" + fourRanPPPP(4);
			break;

		}
		// 对生成的式子进行去除多余括号处理
		String[] postfix = MidToPosT.Change(str);
		String[] infix = PostToMid.getInfixByPostfix(postfix);
		for (int in = 0; !infix[in].equals("#"); in++) {
			result = result + infix[in];
		}
		return result;
		// return str;
	}

	public static String generateMediumFormula() {
		n = 0;
		String str = "", result = "";
		int i;
		i = (int) (Math.random() * 100) % 4 + 1;
		switch (i) {
		case 1:
			n++;
			str = fourRanMMMM(1) + "+" + fourRanMMMM(1);
			break;
		case 2:
			n++;
			str = fourRanMMMM(2) + "-" + fourRanMMMM(2);
			break;
		case 3:
			n++;
			str = fourRanMMMM(3) + "*" + fourRanMMMM(3);
			break;
		case 4:
			n++;
			str = fourRanMMMM(4) + "/" + fourRanMMMM(4);
			break;

		}

		// 对生成的式子进行去除多余括号处理
		String[] postfix = MidToPosT.Change(str);
		String[] infix = PostToMid.getInfixByPostfix(postfix);
		for (int in = 0; !infix[in].equals("#"); in++) {
			result = result + infix[in];
		}
		return result;
	}

	// 只产生加法的
	public static String generateAddFormula() {
		nMax=(int) (Math.random() * 100) % 4 + 1;
		n = 0;
		String str = "";
		str = fourRanAdd(1) + "+" + fourRanAdd(1);
		nMax=3;
		return str;
	}

	public static String fourRanAdd(int pre) {
		// pre代表上一步的运算符，1+ 2- 3* 4/ 5（） 6数

		int i = (int) (Math.random() * 100) % 2 + 1;

		String str = "";
		if (n < nMax)
			;
		else
			i = 2;
		switch (i) {
		case 1:
			n++;
			str = fourRanAdd(1) + "+" + fourRanAdd(1);
			break;

		case 2:
			// 生成数字返回
			return (int) (Math.random() * s) + "";
		}

		return str;
	}

	// 只产生减法的
	public static String generateSubductionFormula() {
		nMax=(int) (Math.random() * 100) % 4 + 1;
		n = 0;
		String str = "";
		str = fourRanSub(2) + "-" + fourRanSub(2);
		nMax=3;
		return str;
	}

	public static String fourRanSub(int pre) {
		// pre代表上一步的运算符，1+ 2- 3* 4/ 5（） 6数

		int i = (int) (Math.random() * 100) % 2 + 1;

		String str = "";
		if (n < nMax)
			;
		else
			i = 2;
		switch (i) {
		case 1:
			n++;
			str = fourRanSub(2) + "-" + fourRanSub(2);
			break;

		case 2:
			// 生成数字返回
			return (int) (Math.random() * s) + "";
		}

		return str;
	}

	// 只产生乘法的
	public static String generateMultiplicationFormula() {
		nMax=(int) (Math.random() * 100) % 4 + 1;
		n = 0;
		String str = "";
		str = fourRanMul(3) + "*" + fourRanMul(3);
		nMax=3;
		return str;
	}

	public static String fourRanMul(int pre) {
		// pre代表上一步的运算符，1+ 2- 3* 4/ 5（） 6数

		int i = (int) (Math.random() * 100) % 2 + 1;

		String str = "";
		if (n < nMax)
			;
		else
			i = 2;
		switch (i) {
		case 1:
			n++;
			str = fourRanMul(3) + "*" + fourRanMul(3);
			break;

		case 2:
			// 生成数字返回
			return (int) (Math.random() * s) + "";
		}

		return str;
	}

	// 只产生除法的
	public static String generateDivisionFormula() {
		nMax=(int) (Math.random() * 100) % 4 + 1;
		n = 0;
		String str = "";
		str = fourRanDiv(4) + "/" + fourRanDiv(4);
		nMax=3;
		return str;
	}

	public static String fourRanDiv(int pre) {
		// pre代表上一步的运算符，1+ 2- 3* 4/ 5（） 6数

		int i = (int) (Math.random() * 100) % 2 + 1;

		String str = "";
		if (n < nMax)
			;
		else
			i = 2;
		switch (i) {
		case 1:
			n++;
			str = fourRanDiv(4) + "/" + fourRanDiv(4);
			break;

		case 2:
			// 生成数字返回
			if (pre == 4) {
				return (int) (Math.random() * s) + 1 + "";
			} else {
				return (int) (Math.random() * s) + "";
			}
		}

		return str;
	}

	public static String generateHigherFormula() {
		n = 0;
		String str = "", result = "";
		int i;
		i = (int) (Math.random() * 100) % 4 + 1;
		switch (i) {
		case 1:
			n++;
			str = fourRan(1) + "+" + fourRan(1);
			break;
		case 2:
			n++;
			str = fourRan(2) + "-" + fourRan(2);
			break;
		case 3:
			n++;
			str = fourRan(3) + "*" + fourRan(3);
			break;
		case 4:
			n++;
			str = fourRan(4) + "/" + fourRan(4);
			break;

		}
		// 对生成的式子进行去除多余括号处理
		String[] postfix = MidToPosT.Change(str);
		String[] infix = PostToMid.getInfixByPostfix(postfix);
		for (int in = 0; !infix[in].equals("#"); in++) {
			result = result + infix[in];
		}
		return result;
	}

	public static String getFormula(int ni, int si) {
		n = 0;
		nMax = ni;
		s = si;
		String str = "", result = "";
		int i;
		i = (int) (Math.random() * 100) % 4 + 1;
		switch (i) {
		case 1:
			str = fourRan(1) + "+" + fourRan(1);
			break;
		case 2:
			str = fourRan(2) + "-" + fourRan(2);
			break;
		case 3:
			str = fourRan(3) + "*" + fourRan(3);
			break;
		case 4:
			str = fourRan(4) + "/" + fourRan(4);
			break;

		}
		/*
		 * // 对生成的式子进行去除多余括号处理 String[] postfix = MidToPosT.Change(str);
		 * String[] infix = PostToMid.getInfixByPostfix(postfix); for (int in =
		 * 0; !infix[in].equals("#"); in++) { result = result + infix[in]; }
		 * return result;
		 */
		return str;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// nMax = 2;
		String str = "";
		int i;
		for (int j = 0; j < 20; j++) {
			str = generateAddFormula();
			System.out.println(str);
		}
	}

}
