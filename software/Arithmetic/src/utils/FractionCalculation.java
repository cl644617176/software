package utils;

import java.util.Scanner;
import java.math.*; 

public class FractionCalculation {
	public char operate(){
		int i;
		char op = ' ';
		i=(int)(Math.random()*100)%4+1;
		switch(i){
		case 1:op='+';break;
		case 2:op='-';break;
		case 3:op='*';break;
		case 4:op='/';
		}
		return op;	
	}
	 
    public int num(){
    	int i;
    	i=(int)(Math.random()*100);
    	return i;
    }
    
    public void intmatch(){//整数出题
    	int a=this.num();
    	int b=this.num();
    	char op=this.operate();
    	//int answer;
    	String myanswer;
    	System.out.print("请做题："+a+op+b+"=");
    	String answer1=this.intcalculate(a, op, b);
    	//System.out.print(answer1);
    	Scanner in= new Scanner(System.in); 
    	myanswer=in.next();
    	if(myanswer.equals(answer1)){
    		System.out.println("恭喜，答案正确。");
    	}
    	else{
    		System.out.println("很抱歉，答案错误。正确答案为："+answer1);
    	}
    }
    
    public String intcalculate(int a,char op,int b){//整数之间的计算方法
    	if(op=='+')
    		return (a+b)+"";
    	else if(op=='-')
    		return (a-b)+"";
    	else if(op=='*')
    		return (a*b)+"";
    	else{
    		int max=this.maxyueshu(a, b);
    		a=a/max;
    		b=b/max;
    		if(b==1){
    			return a+"";
    		}
    		else{
    			Fraction t=new Fraction(a,b);
    			String tt=t.toString();
    			return tt;
    		}
    	}	   	
    }
    

    
    public int maxyueshu( int a, int b ){
		return a%b==0?b:maxyueshu(b,a%b);     
	}
    
    public Fraction simple(Fraction a){
    	int max=this.maxyueshu(a.denominator, a.numerator);
    	a.denominator=a.denominator/max;
    	a.numerator=a.numerator/max;
    	return a;
    }
    
   
    public Fraction fraccalculate(Fraction a,char op,Fraction b){//分数之间的计算
    	int fenzi,fenmu;
    	
    	if(op=='+'){
    		 fenzi=a.denominator*b.numerator+a.numerator*b.denominator;
    		 fenmu=a.denominator*b.denominator;
    	}else if(op=='-'){
    		 fenzi=a.numerator*b.denominator-a.denominator*b.numerator;
    		 fenmu=a.denominator*b.denominator;
    	}else if(op=='*'){
    		 fenzi=a.numerator*b.numerator;
    		 fenmu=a.denominator*b.denominator;
    	}else{
    		 fenzi=a.numerator*b.denominator;
    		 fenmu=a.denominator*b.numerator;
    	}
    	if(fenzi*fenmu==0){
    		return new Fraction(fenzi, fenmu);
    	}else{
    		return this.simple(new Fraction(fenzi,fenmu));
    	}
    	
    }
    
   
    public void frcmatch(){//分数形式b1/a1和b2/a2
    	int a1=0,b1=0,a2=0,b2=0;
    	char op=' ';
    	String myanswer;
    	while(b1>=a1){
    		a1=this.num()+1;
    		b1=this.num();
    	}
    	Fraction t1=this.simple(new Fraction(a1,b1));
    	while(b2>=a2){
    		a2=this.num()+1;
    		b2=this.num();
    	}
    	Fraction t2=this.simple(new Fraction(a2,b2));
    	op=this.operate();
    	if(op=='/'&&t2.numerator==0){//判读第二个分数的分子是否等于0，此时的分数不能执行除法
    		this.frcmatch();
    	}else{
    		System.out.print("请做题：("+t1.toString()+")"+op+"("+t2.toString()+")=");
    	}
    	Fraction answer=new Fraction(1,1);
    	answer=this.fraccalculate(t1, op, t2);
    	Scanner in= new Scanner(System.in); 
    	myanswer=in.next();
    	if(myanswer.equals(answer.toString())){
    		System.out.println("恭喜，答案正确。");
    	}
    	else{
    		System.out.println("很抱歉，答案错误。正确答案为："+answer);
    	}
    }
    
	public static void main(String[] args) {
		FractionCalculation a=new FractionCalculation();
		int num;
		for(num=1;num<=100;num++){
			int i=a.num();
			if(i>50)
				a.intmatch();
			else
				a.frcmatch();
		}
	}

}
