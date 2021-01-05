global class closedwonOppoWithAcCon implements Database.Batchable<sObject> , Database.Stateful, schedulable
{
    Map<String,List<Opportunity>> MapConOPPo = new Map<String,List<Opportunity>>(); // to store contact mail id and list of oppo
    integer count = 0;
    global void execute(SchedulableContext SC)
    {
        closedwonOppoWithAcCon cw = new closedwonOppoWithAcCon();
        database.executeBatch(cw);
        // in ananymous window to schedule everyday in midnight:-
        //closedwonOppoWithAcCon coa = new closedwonOppoWithAcCon();
        //String sch = 'Seconds Minutes Hours Day_of_month Month Day_of_week Optional_year' ;
        //String sch = '0       0       0     *            *  	 ?         '             ;
        //String jobID = system.schedule('ContactWithClosedWon', sch, coa)
    }
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
            List<String> sendTo = new List<String>();
            sendTo.add(mailId);
            mail.setToAddresses(sendTo);
            mail.setReplyTo('vaibhavk282@gmail.com');
            mail.setSubject('All Closed Won Opportunities');
            String body = '<html><body>Dear Sir/Mam, <br/><br/>';
            body += 'All Closed Won Opportunities are - <br/>';
            Decimal total = 0;
            for( Opportunity opportunityRecord : MapConOPPo.get(mailId) ) 
            {
                body += '&nbsp;&nbsp;&nbsp;&nbsp;' + opportunityRecord.Name + ': ' +
                    opportunityRecord.Amount + '<br/>';
                total += opportunityRecord.Amount; //total = total + opportunityRecord.Amount
            }
            //&nbsp(Non-breaking Space) :- Two words separated by a non-breaking space will stick together (not break into a new line). 
            //This is handy when breaking the words might be disruptive.
            //Ex:-a) § 10
			//	  b) 10 km/h
            body += '<br/>&nbsp;&nbsp;&nbsp;&nbsp; <b>Total: ' + total + '</b></body></html>';
            mail.setHtmlBody(body);
            System.debug(body);
            mails.add(mail);
        }
        Messaging.sendEmail(mails);
    }
    
       
}