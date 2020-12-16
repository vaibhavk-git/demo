@istest
public class AccountHandlerTest 
{
    testmethod static void TestUpdatePhone()
    {
        Account acc=new Account();
        acc.Name='vaibhav';
        acc.Industry='Banking';
        try
        {
            insert acc;
        }
        catch(Exception e){
            
        }
        Account a=[select id,phone from Account where id=:acc.Id];
        System.assertEquals(a.phone,'888');
    }
    testmethod static void TestAccountTeamInsert()
    {
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
            //   System.assertEquals(atm.userId,u.id);
            System.assertEquals(atm.AccountAccessLevel,'Edit');
            System.assertEquals(atm.TeamMemberRole,'Account Manager');
        }else{
            System.assertEquals(atm,null);
        }
    }
    testmethod static void TestUpdateHomePhone()
    {
        String oldPhone='111';
        Account a1=new Account();
        a1.name='vaibhav';
        a1.phone=oldPhone;
        insert a1;
        Contact c1=new Contact();
        c1.accountId=a1.id;
        c1.lastname='kk';
        insert c1;
        String newPhone='7474';
        try{
            a1.phone=newPhone;
            update a1;
        }catch(Exception e){
            
        }
        Contact c2=[select id,otherphone,Homephone from Contact where id=:c1.id];
        if(oldPhone!=newPhone){
            System.assertEquals(c2.homePhone,newPhone);
            System.assertEquals(c2.otherphone,oldphone);
        }else{
            System.assertEquals(c2.homephone,c1.homephone);
            System.assertEquals(c2.otherphone,c1.otherPhone);
        }
    }
    testmethod static void TestDeleteError()
    {
        account ac = new account();
        ac.Name = 'kk';
        insert ac;
        contact ct = new contact();
        ct.LastName = 'vaibhav';
        ct.AccountId=ac.Id;
        insert ct;
        try{
            delete ac;
        }
        catch(exception e){
        }
    }
    testmethod static void TestTeamInsertBanking()
    {
        Account a1=new Account();
        a1.name='Test';
        a1.Industry='Banking';
        a1.Type='Prospect';
        a1.AnnualRevenue=5000001;
        try{
            insert a1;
        }catch(Exception e){
            
        }
        list<account> alist = new list<account>();
        alist.add(a1);
        AccountHandler.TeamInsertBanking(alist);  
        AccountHandler.OwnerUPIndustry(alist);
        AccountHandler.updateOwner(alist);
    }
    testmethod static void TestinsertOpp()
    {
        Account a1=new Account();
        a1.name='Test';
        a1.Industry='Energy';
        a1.AnnualRevenue=6000000;
        try{
            insert a1;
        }catch(Exception e){
            
        }
        list<account> alist = new list<account>();
        alist.add(a1);
        AccountHandler.insertOpp(alist);  
                        /* Integer count=[select count() from Opportunity ];
                if(a1.Industry=='Energy' && a1.AnnualRevenue>5000000)
                {
                System.assertEquals(count,65);
                }
                else
                {
                System.assertEquals(count,0); 
                } */
    }
    testmethod static void TestInsertcon()
    {
        Account a=new Account();
        a.name='Test';
        a.Type='Prospect';
        
        try{
            insert a;
        }
        catch(Exception e){
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