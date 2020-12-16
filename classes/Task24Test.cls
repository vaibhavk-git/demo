@isTest
private class Task24Test {
    testmethod static void testmeTask24(){
        User u=[select id from user where alias = 'vkhode']; 
        account ac = new account();
        ac.Name='vaibhav';
        ac.Industry='Banking';
        insert ac;
        AccountTeamMember atm=new AccountTeamMember();
        atm.accountId=ac.id;
        atm.userId=u.id;
        atm.teamMemberRole='Account Manager';
        
        try{
            insert atm;
        }
        catch(exception e)
        {
            
        }
        
        AccountTeamMember atmt=[select accountid,userid,teammemberrole from AccountTeamMember where accountid =:ac.Id and userid=:u.id];
        if(ac.Industry=='Banking'){
            system.assertEquals(atmt.TeamMemberRole, 'Account Manager');
            
        }
        
        
    }
}