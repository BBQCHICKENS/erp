package cn.tx.service;

public class NewTest {
    int a ;


    public static void main(String[] args) {
          NewTest newTest =new NewTest();
          newTest.a=7;
          chang(newTest);
          System.out.println(newTest.a);
    }

    private static void chang(NewTest newTest) {
        newTest.a=2;
    }
}
