public with sharing class accountData {
    @AuraEnabled(cacheable=true)
    public static List<account> getAccounts()  {
        return [select id, Name, Industry from Account limit 10];

    }
}