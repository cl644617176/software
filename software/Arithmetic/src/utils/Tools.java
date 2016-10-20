package utils;

public class Tools {
	public static String FormatAnswer(String userAnswer) {
		FractionCalculation fCal = new FractionCalculation();
		if(userAnswer==null||userAnswer.trim().equals("")){
			return "-";
		}
		// 判断是否为大于1的真分数
		if (userAnswer.indexOf("'") > 0) {
			String[] array = userAnswer.split("'");
			// 判断是否是负数的输入
			if (array[0].indexOf("-") >= 0) {
				Fraction a = new Fraction(
						Integer.parseInt(array[0].split("-")[1]), 1);
				Fraction b = new Fraction(
						Integer.parseInt(array[1].split("/")[0]),
						Integer.parseInt(array[1].split("/")[1]));
				userAnswer = "-" + fCal.fraccalculate(a, '+', b).numerator
						+ "/" + fCal.fraccalculate(a, '+', b).denominator;
			} else {
				Fraction a = new Fraction(Integer.parseInt(array[0]), 1);
				Fraction b = new Fraction(
						Integer.parseInt(array[1].split("/")[0]),
						Integer.parseInt(array[1].split("/")[1]));
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
		return userAnswer;
	}

}
