global class closedwonOppoWithAcCon implements Database.Batchable<sObject>
{
    Map<String,List<Opportunity>> MapConOPPo = new Map<String,List<Opportunity>>();
    integer count = 0;
	global Database.QueryLocator start (Database.BatchableContext bc)
    {
     return Database.getQueryLocator('SELECT' +'Name, ' +'( SELECT Email FROM Contacts WHERE Primary_Contact__c = TRUE LIMIT 1), ' +
                                     '( SELECT Name, Amount FROM Opportunities WHERE StageName LIKE \'Closed Won\') ' 
                                    +'FROM ' +'Account ' +'WHERE ' +'id ' +'IN ' +'(SELECT AccountId FROM Contact WHERE Primary_Contact__c = TRUE)');
    }
    global void execute(Database.BatchableContext bc, list<account> alist)
    {
        for(Account Ac : alist) 
        {
            if(ac.Contacts[0].email != null) 
            {
                MapConOPPo.put(ac.Contacts[0].email, ac.Opportunities);
                count++; 
            }
            
        }
    }
    global void finish(Database.BatchableContext bc)
    {
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        for (string mailId : MapConOPPo.keyset())
        {
            messaging.SingleEmailMessage mail = new messaging.SingleEmailMessage();
            
        }
    }
    
       
}