public class TriggerSettingProvider {
	public List<Trigger_Setting__mdt> retreiveMetadata(String triggerName) {
        return [SELECT Class_Name__c, 	Method_Name__c, Active__c, 	Run_In_Batch__c, 
                afterInsert__c, beforeInsert__c, afterUpdate__c, beforeUpdate__c, 
                afterDelete__c, beforeDelete__c, afterUndelete__c
                FROM Trigger_Setting__mdt WHERE Trigger_Name__c =: triggerName];
    }
}