@isTest
private class TestProg1 {
    @isTest
    static void testme(){
        Account a1=new Account(name='vkk',Industry='Banking');
        Account a2=new Account(name='akk',Industry='Energy');
        try{
            insert a1;
            insert a2;
        }catch(Exception e){
            System.debug(e);
        }
        Account acc1=[select id,AnnualRevenue from Account where id=:a1.id];
        System.assertEquals(acc1.AnnualRevenue,100000);
        Account acc2=[select id ,AnnualRevenue from Account where id=:a2.id];
        System.assertEquals(acc2.AnnualRevenue,50000);
    }
}