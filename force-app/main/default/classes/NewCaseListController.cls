public with sharing class NewCaseListController {
    public List<Case> getNewCases() {
        List<Case> results = [SELECT CaseNumber, OwnerId FROM Case WHERE status = 'new'];

    return results;
}

}