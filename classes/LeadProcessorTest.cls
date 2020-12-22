@istest
public class LeadProcessorTest 
{
	testmethod static void methodleadRecords()
    {
        list<lead> ldlist = new list<lead>();
        for(integer i=0;i<200;i++)
        {
            ldlist.add(new lead(lastname='kk', company='proseraa', leadsource='Dreamforce'));
        }
        insert ldlist;
        
        test.startTest();
        
        Leadprocessor lp = new Leadprocessor();
        Id batchId = Database.executeBatch(lp);
        Test.stopTest();
        
    }
    
}