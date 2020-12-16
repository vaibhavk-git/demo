@isTest
private class LeadScoreTest {
	@isTest
    static void testme(){
        Lead ld=new Lead();
        ld.lastname='vaibhav';
        ld.company='kk';
        ld.phone='12345';
        ld.email='ak@gmail.com';
        ld.industry='Banking';
        try{
        	insert ld;
        }catch(Exception e){
            
        }
		Lead newLead=[select LeadScore__c from Lead where id=:ld.id];
		System.assertEquals(newLead.LeadScore__c,40);        
    }
}