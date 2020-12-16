trigger TriggerOpp on Opportunity (before insert, after insert) {
	if(trigger.isbefore)
    {
        if(trigger.isinsert)
        {
            opportunityHandler.updateAmount(trigger.new);
            opportunityHandler.OwnerUpdate(trigger.new);
            for(Opportunity opp:Trigger.new)
            {
			if(opp.accountId==null)
            {
				opp.addError('Opportuity Can not created with out AccountId');
			}
		}
        }
        if(trigger.isUpdate)
        {
            opportunityHandler.StageUpError(Trigger.oldMap, Trigger.newMap);
        }
        
    }
    if(trigger.isafter)
    {
        if(trigger.isinsert)
        {
            opportunityHandler.OptTeamMemberIn(trigger.new);
            opportunityHandler.ShareRecU2(trigger.new);
            opportunityHandler.OptTeamInsertWeb(trigger.new);
         //   opportunityHandler.CalTotalOpportunity(trigger.new);
        }
    }
}