public abstract class BaseTriggerHandler {

   public abstract void execute(List<sObject> newList, List<sObject> oldList, Map<Id, sObject> newMap, Map<Id, sObject> oldMap);
    
}