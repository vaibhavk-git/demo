@isTest
private class task7Test
{
    @isTest
    static void testme()
    {
        Account a=new Account();
        a.name='Test';
        a.Type='Prospect';
        
        try
        {
            insert a;
        }
        catch(Exception e)
        {
            
        }
        Integer count=[select count() from Contact];
        if(a.Type=='Prospect')
        {
            System.assertEquals(count,1);
        }
        else
        {
            System.assertEquals(count,0);
        }
        
    }
    
}