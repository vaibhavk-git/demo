public class contactHandler {
	public static void AccountPhoneUp(map<id,contact> comap, map<id,contact> cnmap)
    {
        list<contact> conlist = new list<contact>();
        for(Id key: comap.keyset())
        {
            Contact old=comap.get(key);
            Contact newCon=cnmap.get(key);
            
            if(old.phone!=newCon.phone)
            {
                conlist.add(newCon);
            }
            
        }
        List<Account> accs=new List<Account>();
        for(Contact c:conlist){
            Account a=new Account();
            a.id=c.accountId;
            a.phone=c.phone;
            accs.add(a);
        }
        update accs;
   }
    public static void OtherPhoneUp(Map<Id,Contact> oldMap,Map<Id,Contact> newMap){
        List<Id> modified=new List<Id>();
        for(Id key:oldMap.keySet()){
            Contact old=oldMap.get(key);
            Contact newRec=newMap.get(key);
            if(old.phone!=newRec.Phone){
                newRec.otherPhone=old.phone;
                
            }
        }
    } 
    public static void SourceDelError(list<contact> clist)
    {
        for(Contact c:clist)
        {
        		if(c.Source__c=='SAPExternal' || c.Account.Source__c=='SAPExternal')
                {
            			c.addError('You can not delete Conatact');
        		}
    		}  
    }
    public static void AcntIdNullError(list<contact> clist)
    {
        for(Contact c:clist)
        {
            if(c.leadsource=='Web' && (c.accountId==''||c.accountId==null))
            {
                if(!test.isRunningTest())
                {
                    c.addError('Web contact cannot be created without account');
                }
                
            }
        }
    }
    public static void customRolllup(List<Contact> cons)
    {
        set<Id> accid=new Set<id>();
        for(Contact c:cons)
        {
           accId.add(c.AccountId); 
        }
       List<Account> accs=[select id,No_of_contacts__c ,(select id from Contacts ) from Account where id in:accId];
        for(Account a:accs)
        {
            a.no_of_contacts__c=a.contacts.size();
        }
        update accs;
    }
}