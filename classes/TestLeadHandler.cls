@istest
public class TestLeadHandler 
{
	testmethod static void testHandler()
    {
        lead ld = new lead();
        ld.FirstName='vaibhav';
        ld.LastName='khode';
        ld.Company='proseraa';
        ld.Industry='banking';
        ld.Email='ak@gmail.com';
        ld.Phone='99889988';
        try
        {
            insert ld;
        }
        catch(exception e)
        {
            
        }
        list<lead> ldlist = new list<lead>();
        ldlist.add(ld);
        
        leadHandler.ChangeOwner(ldlist);
        leadHandler.insertContact(ldlist);
        
    }
}