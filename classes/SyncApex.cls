public class SyncApex {
    public static void method1()
    {
        for(integer i=0;i<50;i++)
        {
            System.enqueueJob(new C());
        }
  /*    System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());
        System.enqueueJob(new C());  */ //51th queable class error System.LimitException: Too many queueable jobs added to the queue: 51

    }
}