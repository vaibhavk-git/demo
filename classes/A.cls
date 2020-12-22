public class A implements Queueable {
public void execute(QueueableContext context) {
// Chain this job to next job by submitting the next job
system.debug('calling b from a');
System.enqueueJob(new B());    
// System.enqueueJob(new c());   
}
}