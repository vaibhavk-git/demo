@istest
public class TestContactHandler 
{
    testmethod static void SourceDelErrorTest()
    {
        contact ct = new contact();
        ct.LastName = 'khode';
        ct.Source__c = 'SAPExternal';
        insert ct;
        try
        {
            delete ct;
        }
        catch(Exception e){
            
        }
    }
    testmethod static void TestAcntIdNullError()
    {
        contact ct = new contact();
        ct.LastName='vaibhav';
        ct.LeadSource='web';
      //  ct.AccountId=null;
        
         insert ct;
        
        list<contact> clist = new list<contact>();
        clist.add(ct);
       contactHandler.AcntIdNullError(clist);
       contactHandler.customRolllup(clist);
    }
}