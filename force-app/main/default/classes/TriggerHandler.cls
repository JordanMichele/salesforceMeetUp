public virtual class TriggerHandler {
    // the current context of the trigger metaData, overridable in tests
    @TestVisible
    TriggerStatus triggerStatus;
    
    // the current context of the trigger, overridable in tests
    @TestVisible
    private TriggerOperation context;
    
    // the current context of the trigger, overridable in tests
    @TestVisible
    private Boolean isTriggerExecuting;

    public TriggerHandler(String triggerName) {
        this.isTriggerExecuting = Trigger.isExecuting;
        this.context = Trigger.operationType;
        this.triggerStatus = new TriggerStatus(triggerName, new TriggerSettingProvider());
    }
  
    public void run() {
        if(!validateRun()) return;
        
        // dispatch to the correct handler method
        if(this.context == TriggerOperation.BEFORE_INSERT) {
            this.beforeInsert();
        } else if(this.context == TriggerOperation.BEFORE_UPDATE) {
            this.beforeUpdate();
        } else if(this.context == TriggerOperation.BEFORE_DELETE) {
            this.beforeDelete();
        } else if(this.context == TriggerOperation.AFTER_INSERT) {
            this.afterInsert();
        } else if(this.context == TriggerOperation.AFTER_UPDATE) {
            this.afterUpdate();
        } else if(this.context == TriggerOperation.AFTER_DELETE) {
            this.afterDelete();
        } else if(this.context == TriggerOperation.AFTER_UNDELETE) {
            this.afterUndelete();
        }

    }
    
    protected virtual void executeAllMethods() {
   		List<String> classAndMethods = triggerStatus.getClassMethods();
        Type t;
        BaseTriggerHandler handler;
        for (String classAndMethodName : classAndMethods) {
            if (triggerStatus.isActive(classAndMethodName, this.context)) { 
                t = Type.forName(classAndMethodName);
                try {
					handler = (BaseTriggerHandler) t.newInstance();
                } catch(Exception ex) {
                   // Utility.createErrorRecord(ex.getMessage(), ex.getTypeName(), ex.getLineNumber(), ex.getStackTraceString(), true);
                   System.debug(ex);
                    continue;
                }
				handler.execute(Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);
            }
    	}
    }

    // make sure this trigger should continue to run
    @TestVisible
    private Boolean validateRun() {
        if(!this.isTriggerExecuting || this.context == null) {
            throw new TriggerHandlerException('Trigger handler called outside of Trigger execution');
        }
        return true;
    }
       
    // context-specific methods for override
    @TestVisible
    protected virtual void beforeInsert() { executeAllMethods(); }
    @TestVisible
    protected virtual void beforeUpdate() { executeAllMethods(); }
    @TestVisible
    protected virtual void beforeDelete() { executeAllMethods(); }
    @TestVisible
    protected virtual void afterInsert() { executeAllMethods(); }
    @TestVisible
    protected virtual void afterUpdate() { executeAllMethods(); }
    @TestVisible
    protected virtual void afterDelete() { executeAllMethods(); }
    @TestVisible
    protected virtual void afterUndelete() { executeAllMethods(); }
        
    // exception class
    public class TriggerHandlerException extends Exception {}
}