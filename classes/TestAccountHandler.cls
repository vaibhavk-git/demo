@istest
public class TestAccountHandler 
{
	testmethod static void testme(){
        Account acc=new Account();
        acc.Name='vaibhav';
        acc.Industry='Banking';
        try{
          insert acc;
        }catch(Exception e){
            
        }
        Account a=[select id,phone from Account where id=:acc.Id];
        System.assertEquals(a.phone,'888');
    }
}