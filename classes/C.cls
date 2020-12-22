public class C implements Queueable {
public void execute(QueueableContext context) {
// Chain this job to next job by submitting the next job
System.debug('Queable here from c class');    
}
}