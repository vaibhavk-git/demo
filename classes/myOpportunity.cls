public with sharing class myOpportunity {
    @AuraEnabled(cacheable=true)
    public static list<Opportunity> gettOppo(string acId, Decimal amt) {
            return [select id, amount, Name from Opportunity where AccountId = :acId and amount <:amt];
    }
}