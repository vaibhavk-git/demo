global class LeadProcessor implements Database.Batchable<sobject> 
{
	global Database.QueryLocator start (Database.BatchableContext bc)
    {
        return Database.getQueryLocator('SELECT ID, FirstName, LastName, Leadsource, company FROM lead');
    }
    global void execute(Database.BatchableContext bc, list<lead> ldlist)
    {
     	list<lead> ldlistnew = new list<lead> ();
        for(lead ld : ldlist)
        {
            ld.LeadSource = 'Dreamforce';
            ldlistnew.add(ld);
        }
        update ldlistnew;
        futureClass.futureMethod();
    }
    global void finish(Database.BatchableContext bc)
    {
       
    }
}