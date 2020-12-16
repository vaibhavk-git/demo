trigger TriggerCase on Case (before insert, after insert) {
	if(trigger.isbefore)
    {
        if(trigger.isinsert)
        {
            
        }
    }
    if(trigger.isafter)
    {
        if(trigger.isinsert)
        {
           CaseHandler.ShareCaseRec(trigger.new);
        }
    }
}