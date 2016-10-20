package utils;

public class MidToPosT {

	// 定义符号的优先级
	public static int Precedence(char sign) {
		switch (sign) {
		// +、-都为1
		case '+':
		case '-':
			return 1;
			// *、/为2
		case '*':
		case '/':
			return 2;
		case '(':
		case ')':
		default:
			return 0;
		}
	}

	/**************** 中缀表达式转换成后缀表达式 ********************/
	public static String[] Change(String str) {
		String[] s2 = new String[Test.MAX_RANGE];
		// #为结束符
		String s1 = str + "#";
		// 定义大小为20的String类型的栈
		Stack<Character> T = new Stack<Character>(Test.MAX_RANGE);
		int i = 0, j = 0;
		char ch;
		String temp = " ";
		String number="";
		T.push('&');
		ch = s1.charAt(i);
		while (ch != '#') {
			// 遇到'('就进栈
			if (ch == '(') {
				T.push(ch);
				ch = s1.charAt(++i);
			} else if (ch == ')') {
				// 遇到')'就把栈中'('后的符号全部出栈
				while (T.getTop() != '(')
					s2[j++] = String.valueOf(T.pop());
				T.pop();
				ch = s1.charAt(++i);
			} else if (ch == '+' || ch == '-' || ch == '*' || ch == '/') {
				char w = T.getTop();
				while (Precedence(w) >= Precedence(ch)) {
					s2[j++] = String.valueOf(w);
					T.pop();
					w = T.getTop();
				}
				T.push(ch);
				ch = s1.charAt(++i);
			} else {
				if ((ch >= '0' && ch <= '9') || ch == '.') {
					for(;s1.charAt(i)=='@'||(s1.charAt(i) >= '0' && s1.charAt(i) <= '9');i++){
						number=number+s1.charAt(i);
					}
					s2[j++] = number;
					number="";
					ch=s1.charAt(i);
				}
			}
		}
		ch = T.pop();
		while (ch != '&') {
			s2[j++] = String.valueOf(ch);
			ch = T.pop();
		}
		s2[j++] = "#";
		return s2;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String[] postfix = Change("(25)+3*(6@2*2@5)");
		String[] infix=PostToMid.getInfixByPostfix(postfix);
		for (int i = 0; !postfix[i].equals("#"); i++) {
			System.out.println(postfix[i]);
		}
		for (int i = 0; !infix[i].equals("#"); i++) {
			System.out.print(infix[i]);
		}
	}

}
