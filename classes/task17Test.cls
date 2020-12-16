@isTest
public class task17Test 
{
	@isTest
    static void testme()
    {
        Opportunity op=new Opportunity();
        op.stageName='closed won';
        op.closeDate=system.today();
        op.name='Test';
        try
        {
            insert op;
        }
        catch(Exception e)
        {
            
        }
        user u=[select id from user where alias='vkhode'];
        OpportunityShare share=[select OpportunityAccessLevel,OpportunityId,RowCause,UserOrGroupId FROM OpportunityShare where OpportunityId=:op.id and UserOrGroupId=:u.id];
        if(op.stageName=='Closed Won')
        {
            System.assertEquals(share.OpportunityAccessLevel,'Read');
            System.assertEquals(share.RowCause,'Manual');
        }else
        {
            System.assertEquals(share,null);
        }
    }
}