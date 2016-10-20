package utils;

public class Stack<T> {
	private int top;
	private T[] stackArray;
	private int maxSize;

	//
	public Stack(int maxSize) {
		this.maxSize = maxSize;
		this.top = -1;
		stackArray = (T[])new Object[this.maxSize];
	}

	//进栈
	public void push(T push) {
		stackArray[++top] =push;
	}

	// 出栈
	public T pop() {
		return stackArray[top--];
	}

	// 得到栈顶元素
	public T getTop() {
		return stackArray[top];
	}

	// peek the character at index n
	public T peekN(int index) {
		return stackArray[index];
	}

	//判断是否为空
	public boolean isEmpty() {
		return (top == -1);
	}

	// return stack size
	public int size() {
		return top + 1;
	}

}
