trigger triggerCourse on Course__c (before insert, after insert) 
{
	CourseHandler.DelChildRec(Trigger.oldMap,Trigger.newMap);
}