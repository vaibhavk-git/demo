@istest
private class task3Test {
	@isTest
    static void testme(){
        Lead ld=new Lead();
        ld.lastname='kk';
        ld.company='Capital';
        ld.phone='111';
        ld.email='javasfdc@gmail.com';
        ld.industry='Energy';
        try{
        	insert ld;
        }catch(Exception e){
            
        }
		Lead newLead=[select ownerid from Lead where id=:ld.id];
		System.assertEquals(newLead.OwnerId,'00G2y000000pW4M');        
    }
}