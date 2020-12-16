public class AccountHandler 
{
    public static void updatePhone(list<account> alist)
    {
        for(Account a: alist)
        {
            if(a.industry=='Banking')
            {
                a.phone='888';
            }
        }
        
    }
    public static void updateHomePhone(Map<Id,Account> oldMap,Map<Id,Account> newMap)
    {
        List<Id> accIds=new List<Id>();
        
        for(Id key:oldMap.keySet())
        {
            Account old=oldMap.get(key);
            Account newAcc=newMap.get(key);
            if(old.phone!=newAcc.Phone)
            {
                accIds.add(key);
            }
        }
        List<Contact> cons=[select id,accountId,homephone,otherphone from Contact where accountId in:accIds];
        for(Contact c:cons)
        {
            Account a=newMap.get(c.accountId);
            Account b=oldMap.get(c.accountId);
            c.otherPhone=b.phone;
            c.homephone=a.phone;  
        }
        update cons;
    }
    public static void updateOwner(list<account> alist)
    {
        User u1=[select id from User where username='vaibhav.khode@proseraa.com'];
        User u2=[select id from User Where Username='vaibhav.khodeu2@proseraa.com'];
        for(Account a: alist){
            if(a.industry=='Banking' && a.annualRevenue>5000000)
            {
                a.ownerId=u2.id;
            }
            else
            {
                a.ownerId=u1.Id;
            }
        }
    }
  
    public static void insertCon(list<account> alist)
    {
        List<Contact> contacts=new List<Contact>();
        for(Account a: alist)
        {
            if(a.type=='Prospect')
            {
                Contact c=new Contact();
                c.lastname=a.name;
                c.phone=a.phone;
                c.accountId=a.id;
                contacts.add(c);
            }
        }
        insert contacts;
    }
    
    public static void insertOpp(list<account> alist)
    {
        List<Opportunity> optyList=new List<Opportunity>();
        for(Account a: alist)
        {
            if(a.industry=='Energy' && a.AnnualRevenue >5000000)
            {
                Opportunity op=new Opportunity();
                op.name=a.name;
                op.stageName='Prospecting';
                op.CloseDate=System.today()+30;
                op.accountId=a.id;
                optyList.add(op);
            }
        }
        insert optyList;
    }
    public static void accountTeamInsert(list<account> alist)
    {
        List<AccountTeamMember> teams=new List<AccountTeamMember>();
        User u=[select id from User where alias='vkhode'];
        for(Account a:alist)
        {
            if(a.Industry=='Education' && a.AnnualRevenue >1000000)
            {
                AccountTeamMember atm=new AccountTeamMember();
                atm.accountId=a.id;
                atm.userId=u.id;
                atm.TeamMemberRole='Account Manager';
                atm.AccountAccessLevel='Edit';
                teams.add(atm);
            }
        }
        insert teams;
    }
    public static void OwnerUPIndustry(list<account> alist)
    {
        User u=[select id from User where alias = 'vkhode'];
        for(Account a:alist)
        {
            if(a.industry=='Banking' && a.Type=='Prospect')
            {
                a.ownerId=u.id;
            }
        }
    }
    Public static void TeamInsertBanking(list<account> alist)
    {
        List<AccountTeamMember> team=new List<AccountTeamMember>();
        User u=[select id from user where alias = 'vkhode'];
        for(Account a:alist)
        {
            if(a.industry=='Banking')
            {
                AccountTeamMember atm=new AccountTeamMember();
                atm.accountId=a.id;
                atm.userId=u.id;
                atm.teamMemberRole='Account Manager';
                atm.AccountAccessLevel='Read';
                team.add(atm); 
            }
        }
        insert team;
    }
    public static void UpdateAnnualRev(list<account> alist)
    {
        for(Account a: alist){
            if(a.industry=='Banking'){
                a.AnnualRevenue=100000;
            }else{
                if(a.industry == 'Energy'){
                    a.AnnualRevenue=50000;
                }
            }
        }
    }
    public static void DeleteError(list<account> alist)
    {
        List<Account> accList = new List<Account>();  
        Set<id> accIdSet = new Set<id>();  
        for(Account acc : alist)  
        {  
            accIdSet.add(acc.id);  
        }  
        
        Map<Id, Account> accts = new Map<Id, Account>([Select Id, (Select Id from contacts) from Account where id in :accIdSet]);
        
        for(Account acc : alist)
        {
            if(accts.get(acc.id).contacts.size()>0)
            {
                acc.adderror('Account cannot be deleted');
            }
        }  
    }
}
    
    /* When ever new Account is inserted  with Industry as 'Banking ' then set the phone 
as '888'
*/