@isTest
private class Tas10Test {
    
    testmethod static void test10Method(){
        customer__c cc = new customer__c();
        cc.Status__c='Accepted';
        
        try{
            insert cc;
        }
        catch(exception e){
            
        }
        user u = [select id from user where username = 'vaibhav.khodeu2@proseraa.com'];
        customer__share cs = [select parentid, accesslevel, rowcause, userorgroupid from customer__share where parentid =: cc.Id and userorgroupid =: u.id];
        if(cc.Status__c=='Accepted')
        {
            system.assertEquals(cs.rowcause, schema.customer__share.rowcause.manual);
            system.assertEquals(cs.AccessLevel, 'Read');
        }
        else
        {
            system.assertEquals(cs, null);
        }
    }
}