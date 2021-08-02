public class AccountHandler {
    public static void insertAccount(Integer n){
        Integer iterator = 1;
        List<Account> addAccounts = new List <Account>();        
        while(iterator <= n){
            Account acc = new Account();
            acc.Name = 'Acme Inc ' + iterator;
            acc.AccountNumber = 'A000n' + iterator;
            addAccounts.add(acc);
            iterator++;
        }
        insert addAccounts;
    }
}