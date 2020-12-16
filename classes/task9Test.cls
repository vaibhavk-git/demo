@isTest
private class task9Test {
	@isTest
    static void testme(){
        Case c=new Case();
        c.status='New';
        c.Origin='Email';
        c.Priority='High';
        c.subject='vkk';
        try{
            insert c;
        }catch(Exception e){
            
        }
        User u=[select id from User where alias='vkhode'];
        CaseShare cs=[select CaseId,UserOrGroupId,CaseAccessLevel ,RowCause from CaseShare where CaseId=:c.id and userOrGroupId=:u.id]; 
        if(c.origin=='Email' && c.Priority=='High'){
          System.assertEquals(cs.CaseAccessLevel,'Edit');
          System.assertEquals(cs.RowCause,'Manual');
        }else{
            System.assertEquals(cs,null);
        }
    }
}