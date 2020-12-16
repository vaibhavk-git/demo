@isTest
private class task2Test {
	@isTest
    static void testme(){
        Lead ld=new Lead();
        ld.lastname='khode';
        ld.company='proseraa';
        ld.phone='112233';
        ld.email='iamvaibhav@gmail.com';
        ld.industry='Banking';
        try{
        	insert ld;
        }catch(Exception e){
            
        }
		Lead ldq=[select LeadScore__c from Lead where id=:ld.id];
		System.assertEquals(ldq.LeadScore__c,40);        
    }
}