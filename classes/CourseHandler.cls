public class CourseHandler 
{
    public static void DelChildRec(Map<Id,Course__c> oldMap,Map<Id,Course__c> newMap)
    {
        List<Id> courseIds=new List<Id>();
        for(Id key :oldMap.keySet()){
            Course__C old=oldMap.get(key);
            Course__c newCourse=newMap.get(key);
            if(old.Status__c!='InActive' && newCourse.Status__c=='InActive')
            {
                courseIds.add(key);
            }	
        }	
        List<Student__c> stds=[select id from Student__C where Course__c IN :courseIds];
        delete stds;
    }
}