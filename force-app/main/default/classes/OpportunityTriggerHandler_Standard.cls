public with sharing class OpportunityTriggerHandler_Standard {

        public class StandardOpportunityAfterInsert extends BaseTriggerHandler {
        public override void execute(List<sObject> newList, List<sObject> oldList, Map<Id, sObject> newMap, Map<Id, sObject> oldMap){
            handleAfterInsert((List<Opportunity>) newList);
        }
    }
        public static void handleAfterInsert(list<Opportunity> newOppList) {
            for(opportunity opp : newOppList){
                Task t             = new Task();
                t.Subject          = 'Apple Watch promo';
                t.Description      = 'Send them one ASAP';
                t.Priority         = 'High';
                t.WhatId           = opp.Id;
                insert t;
            }
    }
}