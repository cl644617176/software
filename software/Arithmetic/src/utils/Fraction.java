package utils;

public class Fraction {
	  public int numerator;
	  public int denominator;
	  public Fraction(int numerator, int denominator){
	    this.numerator=numerator;
	    this.denominator=denominator;
	  }
	  public double getRet(){
	    return (double)numerator/denominator;
	  }
	  public String toString(){
	    return numerator+"/"+denominator;
	  }
	  public int getint(){
		  return numerator;
	  }
}
