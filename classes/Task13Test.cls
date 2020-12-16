@isTest
private class Task13Test {
	@isTest
    static void task13Testme(){
       account ac = new account();
        ac.Name='vaibhav';
        ac.Phone='1122';
        insert ac;
        contact ct = new contact();
        ct.LastName= 'kk';
        ct.Phone='1234';
        ct.AccountId=ac.id;
      
        try
        {
            insert ct;
        }
        catch(exception e)
        {
            
        }
        account a = [select id, phone from account where id=:ct.AccountId];
        if(ct.Phone!= '1234')
        {
            system.assertEquals(a.phone, ct.Phone);
        }
        else
        {
            system.assertEquals(a, null); 
        }
    }
}