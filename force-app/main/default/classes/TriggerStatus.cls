public virtual class TriggerStatus {
    private Map<String, TriggerDetail> settingsMap;
    private List<String> triggerClassMethods;
    @TestVisible 
    private Boolean isRunningInBatch {
        get { return isRunningInBatch == null ? System.isBatch() : isRunningInBatch; }
        set; //DO NOT SET THIS IS FOR TESTING ONLY
    }
    
    public TriggerStatus() {
    	throw new TriggerStatusException('This is a non-implemented method.');
    }     
    
    public TriggerStatus(String triggerName, TriggerSettingProvider triggerSettingsProvider) {
    	settingsMap = new Map<String, TriggerDetail>();
        triggerClassMethods = new List<String>(); 
        populateSettings(triggerName, triggerSettingsProvider);
    }
    
    public Boolean isActive(String classAndMethodName, TriggerOperation context) {
    	Boolean isActive = false;
        
        TriggerDetail detail = settingsMap.get(classAndMethodName);
		
        if (detail == null) { isActive = true; }
		if (detail != null && detail.isActive && isRunningInBatch == false && detail.activeContexts.contains(String.valueOf(context))) { isActive = true; } 
        if (detail != null && detail.isActive && (isRunningInBatch && detail.runInBatch) && detail.activeContexts.contains(String.valueOf(context))) { isActive = true; } 
        return isActive;
    }
    
    public List<String> getClassMethods() {
        return triggerClassMethods;
    }
    
    private void populateSettings(String triggerName, TriggerSettingProvider triggerSettingsProvider) {
        for (Trigger_Setting__mdt setting : triggerSettingsProvider.retreiveMetadata(triggerName)) {                               
        	settingsMap.put(formatKey(setting.Class_Name__c, setting.Method_Name__c), new TriggerDetail(setting));
            triggerClassMethods.add(formatKey(setting.Class_Name__c, setting.Method_Name__c));
        }         
    }
    
    @TestVisible
    private class TriggerDetail {
        private Boolean runInBatch {get; set;}
        private Boolean isActive {get; set;}
        private List<String> activeContexts {get; set;} 
        
        private TriggerDetail(Trigger_Setting__mdt triggerSetting) {
        	this.runInBatch = triggerSetting.Run_In_Batch__c;
            this.isActive = triggerSetting.Active__c;
            this.activeContexts = new List<String>();
            if (triggerSetting.afterInsert__c == true) { activeContexts.add(String.valueOf(TriggerOperation.AFTER_INSERT)); }
            if (triggerSetting.beforeInsert__c == true) { activeContexts.add(String.valueOf(TriggerOperation.BEFORE_INSERT)); }
            if (triggerSetting.afterUpdate__c == true) { activeContexts.add(String.valueOf(TriggerOperation.AFTER_UPDATE)); }
            if (triggerSetting.beforeUpdate__c == true) { activeContexts.add(String.valueOf(TriggerOperation.BEFORE_UPDATE)); }
            if (triggerSetting.afterDelete__c == true) { activeContexts.add(String.valueOf(TriggerOperation.AFTER_DELETE)); }
            if (triggerSetting.beforeDelete__c == true) { activeContexts.add(String.valueOf(TriggerOperation.BEFORE_DELETE)); }
            if (triggerSetting.afterUndelete__c == true) { activeContexts.add(String.valueOf(TriggerOperation.AFTER_UNDELETE)); }
        }
        
    }
    
    private String formatKey(String className, String methodName) {
     	return className + '.' + methodName;   
    }
       
    public class TriggerStatusException extends Exception { } 
        
}