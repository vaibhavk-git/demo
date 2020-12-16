@isTest
public class task21Test {
	@isTest
    static void testme(){
        User u1=[select id from User where username='vaibhav.khode@proseraa.com'];
    	User u2=[select id from User Where Username='vaibhav.khodeu2@proseraa.com'];
        Account a1=new Account(Name='vaibhav',Industry='Energy',AnnualRevenue=30000);
        Account a2=new Account(Name='kk',Industry='Banking',AnnualRevenue=6000000);
        try{
            insert a1;
        	insert a2;
        }catch(Exception e){
            System.debug(e);
        }
        Account acc1=[select id ,ownerId from Account where id=:a1.Id];
        System.assertEquals(acc1.ownerId,u1.id);
        Account acc2=[select id,ownerId from Account where id=:a2.Id];
        System.assertEquals(acc2.ownerId,u2.id);
    }
}