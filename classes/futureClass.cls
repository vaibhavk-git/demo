public class futureClass {
	@future
    public static void futureMethod()
    {
        system.debug('Hello am in future method');
    }
}
/*
 public class A implements Queueable {
public void execute(QueueableContext context) {
// Chain this job to next job by submitting the next job
System.enqueueJob(new B());    
}
}public class B implements Queueable {
public void execute(QueueableContext context) {
// Chain this job to next job by submitting the next job
System.enqueueJob(new C());    
}
}public class C implements Queueable {
public void execute(QueueableContext context) {
// Chain this job to next job by submitting the next job
System.enqueueJob(new D());    
}
}
 */