public class AccountUtils {
    public static List<Account> accountsByState(String abbr){
 	      List<Account> acct = [SELECT ID, Name FROM Account WHERE BillingState = :abbr];
         return acct;
    }
}