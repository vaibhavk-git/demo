trigger TriggerCustomer on Customer__c (before insert,after insert) {
	if(trigger.isbefore)
    {
        
    }
    if(trigger.isafter)
    {
        if(trigger.isinsert)
        {
            customerHandler.CustShareRead(trigger.new);
        }
    }
}