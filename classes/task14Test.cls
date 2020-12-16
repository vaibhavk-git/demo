@isTest
public class task14Test {
	@isTest
   		 static void testme(){
        			Lead my=new Lead();
        			my.LastName='kk';
        			my.company='proseraa';
        			my.AnnualRevenue=8000;
        			my.LeadSource='Web';
        			insert my;
        			User u=[select id from User where username='vaibhav.khode@proseraa.com'];
        			Lead l=[select ownerId from Lead where id=:my.Id];
        			if(my.leadSource=='Web'){
        				System.assertEquals(l.ownerId,u.Id);
        			}
    		}
}