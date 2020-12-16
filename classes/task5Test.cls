@isTest
private class task5Test {
	@isTest
    static void testme(){
        User u=[select id from User where alias='vkhod'];
        Account a=new Account();
        a.Industry='Education';
        a.name='vkk';
        a.AnnualRevenue=1100000;
        try{
            insert a;
        }catch(Exception e){
            System.debug(e);
        }
        AccountTeamMember atm=[select userId,AccountId,AccountAccessLevel,TeamMemberRole from AccountTeamMember where AccountId=:a.id];
        if(a.Industry=='Education' && a.AnnualRevenue>1000000){
            System.assertEquals(atm.userId,u.id);
            System.assertEquals(atm.AccountAccessLevel,'Edit');
            System.assertEquals(atm.TeamMemberRole,'Account Manager');
        }else{
            System.assertEquals(atm,null);
        }
    }
}