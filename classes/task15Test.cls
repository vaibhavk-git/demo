@istest
public class task15Test {
		@isTest
    static	void testme()
    {
        Account acc=new Account();
        acc.Name='vaibhav';
        acc.Industry='Banking';
        acc.Type='Prospect';
        insert acc;
        User u=[select id from User where alias = 'vkhode'];
        Account a=[select id,ownerId from Account where id=:acc.id];
        if(acc.Industry=='Banking' && acc.Type=='Prospect')
            System.assertEquals(a.ownerId,u.id);
    }
}