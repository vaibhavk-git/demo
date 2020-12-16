public class LeadHandler 
{
    public static void leadOwnerQUp(list<lead> ldlist)
    {
        for(lead ld : ldlist)
        {
            if(ld.industry == 'banking')
            {
                 ld.OwnerId = system.label.banking;
            }
            if(ld.industry == 'Energy')
            {
                ld.OwnerId = system.label.energy;
            }
            
        }
        
    }
    public static void leadscoreCal(list<lead> leadList)
    {
        for(Lead Ld : leadList)
        {
            system.debug('-----'+Ld.LeadScore__c);
            integer count = 0;
            if(Ld.Email !='' && Ld.Email !=null  )
            {
                count = count+10;
            }
            if(Ld.Phone !='' && Ld.Phone != null )
            {
                count = count+10;
            }            
            if(Ld.Industry !='' && Ld.Industry != null)
            {
                count = count+20;
            }
            Ld.LeadScore__c = count;
            system.debug('-----'+Ld.LeadScore__c);
        }        
    }
    public static void ChangeOwner(list<lead> ldlist)
    {
        User u=[select id from user where username='vaibhav.khodeu2@proseraa.com'];
   		 for(Lead my:ldlist)
         {
        			if(my.leadsource=='Web')
                    {
            				my.ownerId=u.Id;
        			}
    		}
    }
    public static void insertContact(list<lead> ldlist)
    {
        Integer total;
        List<Contact> contacts=new List<Contact>();
        for(Lead l:ldlist){
            total=0;
            if(l.firstName!=null && l.firstname!='')
            {
                total=total+10;
            }
            if(l.phone!=null && l.phone!='')
            {
                total=total+10;
            }
            if(l.email!=null && l.email!='')
            {
                total=total+10;
            }
            if(total>=20)
            {
                Contact c=new Contact();
                c.lastname=l.lastname;
                c.firstName=l.firstName;
                c.phone=l.phone;
                c.Email=l.email;
          //      c.ownerId=l.ownerId;
                contacts.add(c);
            }
        }
        insert contacts;
    }
}

/*   Group bqueue = [select id from group where type='queue' and name='Banking Queue'];

Group equeue = [select id from group where type='queue' and name='Energy Queue'];   

for(lead ld : ldlist)
{
if(ld.industry == 'banking')
{
ld.OwnerId = bqueue.id;
}
if(ld.industry == 'Energy')
{
ld.OwnerId = equeue.id;
}
} */