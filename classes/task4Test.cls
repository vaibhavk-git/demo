@isTest
private class task4Test {
    @isTest
    static void testme(){
        Account a1=new Account();
        a1.name='vaibhav';
        a1.Industry='Energy';
        a1.AnnualRevenue=7000000;
        try{
            insert a1;
        }catch(Exception e){
            
        }
       // Integer count=[select count() from Opportunity];
       Opportunity oc = [select id, name, stageName, CloseDate, accountId from Opportunity where accountId =: a1.Id ];
        if(oc != Null)
        {
            System.assertEquals(oc.stageName,'Prospecting');
        }
        
                
    }
}