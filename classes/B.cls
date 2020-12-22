public class B implements Queueable {
public void execute(QueueableContext context) {
// Chain this job to next job by submitting the next job
system.debug('calling c from b');
System.enqueueJob(new C());    
}
}