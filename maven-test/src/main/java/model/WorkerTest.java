package model;

public class WorkerTest {
	public static void main(String[] args) {
		Worker worker =  new Worker("우영우", 30, "woo@test.com");
		System.out.println("이름: " + worker.getName());
		System.out.println("나이: " + worker.getAge());
		System.out.println("이메일: " + worker.getEmail());
	}
}
