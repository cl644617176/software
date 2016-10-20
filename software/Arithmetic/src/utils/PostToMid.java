package utils;

public class PostToMid {

	/**
	 * 后缀转中缀，中缀已“#”符结束，用于去除生成的多余的括号
	 * 
	 * @param op
	 * @return
	 */
	public static boolean isOp(char op) {
		return op == '-' || op == '+' || op == '*' || op == '/';
	}

	public static String[] getInfixByPostfix(String[] postfix) {
		// stack<char>sptr; 操作符栈
		// stack<char>A; 操作数栈
		int post = 0, in = 0;// 指向后缀表达式
		Stack<Character> sptr = new Stack<Character>(Test.MAX_RANGE);
		Stack<String> A = new Stack<String>(Test.MAX_RANGE);
		String[] infix = new String[Test.MAX_RANGE];
		int len = 0; // 后缀表达式的个数
		for (; !postfix[len].equals("#"); len++)
			;
		post = len - 1;
		boolean isLeft = false;
		for (int i = 0; i < len; i++, post--) {
			if (isOp(postfix[post].charAt(0))) {
				if (isLeft) {
					if (!A.isEmpty()
							&& (A.getTop().charAt(0) == '*' || A.getTop()
									.charAt(0) == '/')
							&& (postfix[post].charAt(0) == '+' || postfix[post]
									.charAt(0) == '-')) {
						A.push(")");
						sptr.push('(');
					}
					isLeft = false;
				} else if (!sptr.isEmpty()) {
					if (sptr.getTop() == '-'
							&& postfix[post].charAt(0) != '*'
							&& postfix[post].charAt(0) != '/'
							|| sptr.getTop() == '/'
							|| sptr.getTop() == '*'
							&& (postfix[post].charAt(0) == '+' || postfix[post]
									.charAt(0) == '-')) {
						A.push(")");
						sptr.push('(');
					}
				}
				sptr.push(postfix[post].charAt(0));
			} else {
				A.push(postfix[post]);
				while (!sptr.isEmpty() && sptr.getTop() == '(') {
					A.push(String.valueOf(sptr.getTop()));
					sptr.pop();
				}
				if (!sptr.isEmpty()) {
					A.push(String.valueOf(sptr.getTop()));
					sptr.pop();
					isLeft = true;
				}
			}
		}

		while (!A.isEmpty()) {
			infix[in++] = A.getTop();
			A.pop();
		}
		infix[in++] = "#";
		return infix;
	}
}
