public class opportunityHandler 
{
    public static void OptTeamMemberIn(list<Opportunity> olist)
    {
        List<OpportunityTeamMember> teams=new List<OpportunityTeamMember>();
        User u=[select id from User where alias='vkhode'];
        for(Opportunity op:olist)
        {
            if(op.stageName=='closed Won')
            {
                OpportunityTeamMember otm=new OpportunityTeamMember();
                otm.OpportunityId=op.id;
                otm.UserId=u.id;
                otm.TeamMemberRole='Account Manager';
                otm.OpportunityAccessLevel='Edit';
                teams.add(otm);
            }
        }
        insert teams;
    }
    public static void updateAmount(List<Opportunity> optyList)
    {
        set<id> setid = new set<id>();
        map<id,Account> mapacc = new map<id,account>();
        list<account> lstaccount = new list<account>();
        for(Opportunity op:OptyList)
        {
            if(op.Accountid != null)
            {
                setid.add(op.Accountid);
            }
        }
        if(setid.size() > 0)
        {
            for(Account acc : [select id,Total_Amount__c,Won_Amount__c,Lost_Amount__c,PipeLine_Amount__c from Account where Id in:setid])
            {
                mapacc.put(acc.id,acc);
            }
            for(Opportunity p:optyList)
            {
                Account a = mapacc.get(p.accountid);
                if(p.Amount!=null)
                {
                    a.Total_Amount__c=a.Total_Amount__c+p.amount;
                    if(p.stageName=='Closed Won')
                    {
                        a.Won_Amount__c=a.Won_Amount__c+p.amount;
                    }else if(p.stageName=='Closed Lost')
                    {
                        a.Lost_Amount__c=a.Lost_Amount__c+p.amount;
                    }else
                    {
                        a.pipeLine_Amount__c=a.pipeLine_Amount__c+p.amount;
                    }
                    lstaccount.add(a);
                }
            }
        }
        
        
        if(lstaccount.size() > 0)
        {
            update lstaccount;
        }
    }
    public static void ShareRecU2(list<Opportunity> olist)
    {
        List<OpportunityShare> share=new List<OpportunityShare>();
        User u=[select id from User where alias='vkhode'];
        for(Opportunity op:olist){
            if(op.stageName=='Closed Won'){
                OpportunityShare os=new OpportunityShare();
                os.OpportunityId=op.id;
                os.UserOrGroupId=u.id;
                os.OpportunityAccessLevel='read';
                os.RowCause='Manual';
                share.add(os);
            }
        }
        insert share;
    }
    public static void StageUpError(Map<Id,Opportunity> oldMap,Map<Id,Opportunity> newMap)
    {
        for(Id a:oldMap.keySet())
        {
            Opportunity newOpt=newMap.get(a);
            Opportunity oldOpt=oldMap.get(a);
            if(oldOpt.stageName=='Closed Won' && newOpt.stageName!='Closed Won')
            {
                newOpt.addError('Stage Name cannot be updated');
            }
        }
    }
    public static void CalTotalOpportunity(list<Opportunity> olist)
    { 
        Set<Id> accId=new Set<Id>();
        for(Opportunity op:olist)
        {
            accId.add(op.accountId);
        }
        List<Account> accounts=[select Total_Opportunities__c,Total_Opportunity_Amount__c, (select id,Amount from Opportunities) from Account where Id in:accId];
        for(Account a:accounts)
        {
            a.Total_Opportunities__c=a.opportunities.size();
            Decimal sum=0;
            for(Opportunity p:a.opportunities)
            {
                sum=sum+p.amount;
            }
            a.Total_Opportunity_Amount__c=sum;
        }
        update accounts;
    }
    public static void OptTeamInsertWeb(list<Opportunity> olist){
        User u=[select id from User where alias='vkhode'];
        List<OpportunityTeamMember> teams=new List<OpportunityTeamMember>();
        for(Opportunity op:olist){
            if(op.amount> 1000000 && op.LeadSource=='Web'){
                OpportunityTeamMember ot=new OpportunityTeamMember();
                ot.OpportunityId=op.id;
                ot.OpportunityAccessLevel='Edit';
                ot.userId=u.id;
                ot.TeamMemberRole='Sales Manager';
                teams.add(ot);
            }
        }
        insert teams;
    }
    public static void OwnerUpdate(List<Opportunity> olist)
    {
        User u=[select id from user where alias='vkhode'];
        List<Opportunity> ops=[select leadsource,Amount,StageName from Opportunity where id in:olist];
        for(Opportunity p:ops)
        {
            if(p.stageName!='Closed won' && p.amount >50000 &&  p.leadsource=='Web'){
                p.ownerId=u.id;
            }
        }
        update ops;
    }
}
/*

When ever new opportuntiy is created  with StageName as 'closed Won ' then

add karthic as OpportunityTeamMember
*/