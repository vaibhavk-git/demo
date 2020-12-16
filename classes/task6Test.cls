@isTest
private class task6Test {
@isTest
    static void testme(){
        User u=[select id from User where alias='vkhode'];
        Opportunity a=new Opportunity();
        a.name='vkk';
        a.stageName='closed won';
        a.closeDate=System.today()+5;
        try{
            insert a;
        }
        catch(Exception e){
            System.debug(e);
        }
        OpportunityTeamMember atm=[select userId,OpportunityId,OpportunityAccessLevel, TeamMemberRole from OpportunityTeamMember where OpportunityId=:a.id];
        if(a.stageName=='closed won' )
        {
            System.assertEquals(atm.userId,u.id);
            System.assertEquals(atm.OpportunityAccessLevel,'Edit');
            System.assertEquals(atm.TeamMemberRole,'Account Manager');
        }else
        {
            System.assertEquals(atm,null);
        }
    }
}