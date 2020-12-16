@isTest
public class task16Test {
	testmethod static void testme(){
        Lead my=new Lead();
        my.lastname='kk';
        my.firstName='vaibhav';
        my.Company='proseraa';
        my.annualRevenue=9000;
        my.phone='1234';
        insert my;
        Lead testlead=[select id ,LeadScore__c from Lead where id=:my.Id];
        if(my.firstName!=null&&my.FirstName!='' &&my.AnnualRevenue!=null && my.Phone!=''&&my.phone!=null){
            System.assertEquals(testlead.leadScore__c,40);
        }
    }
}