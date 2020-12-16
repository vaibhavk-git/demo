@isTest
private class prog3Test {
    testmethod static void testme(){
        Opportunity op=new Opportunity();
        op.name='Test';
        op.amount=10000;
        op.closeDate=System.today()+3;
        op.stageName='Qualification';
        op.leadSource='Web';
        try{
            insert op;
        }catch(Exception e){
            System.debug(e);
        }
        User u=[select id from user where alias='vkhode'];
        Opportunity p=[select ownerid,stageName, amount,leadsource from Opportunity where id=:op.id];
        if(p.stageName!='Closed won' && p.amount >50000 &&  p.leadsource=='Web'){
             p.ownerId=u.id;
        System.assertEquals(u.id,p.OwnerId);
        }
    }
}