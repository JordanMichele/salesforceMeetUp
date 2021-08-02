public class Algorithms {
    public integer binarySearch(List<integer> arr, integer elem){
    integer start = 0;
    integer mid;
    integer endd = arr.size() - 1;
    double middle = Math.floor((start + endd) / 2);
    mid = middle.intValue();
    System.debug('start ' + start);
    System.debug('endd ' + endd);
    System.debug('middle ' + middle);
        while(arr[mid] != elem && start <= endd) {
            if(elem < arr[mid]){
                endd = mid - 1;
            } else {
                start = mid + 1;
            }
            middle = Math.floor((start + endd) / 2);
            mid = middle.intValue();
         } 
        if(arr[mid] == elem){
            system.debug('Answer ' + arr[mid]);
             return mid;
        } else {
            system.debug('NO ANSWER -1');
             return -1;
        }
       
     }
    
    public List<integer> bubbleSort(List<integer> arr){
        for(integer i = 0; i < arr.size(); i++){
            system.debug('OUTTEER ' + arr[i]);
            for(integer j = 0; j < arr.size() - 1; j++){
                system.debug('arr 1 ' + arr);
                system.debug('arr[j] 2 ' + arr[j]);
                system.debug('arr[j + 1] 3 ' + arr[j + 1]);
                if(arr[j] > arr[j + 1]){
                    // SWAP
                    integer temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                }
            }
        }
        return arr;   
    }
    
    public static integer fiboEvenSum(integer n) {
        List<integer> Fibs = new List<integer>();
        List<integer> evenFibs = new List<integer>();
        integer evenFib = 0;
 
        for(integer i = 1; i <= n; i++){
                Fibs.add(i);
        }
        for(integer i = 0; i < Fibs.size(); i++){
            if(i < 3){
              evenFibs.add(Fibs[i]);
            }
            if(i >= 3){
                integer back1 = evenFibs[i - 1];
                integer back2 = evenFibs[i - 2];
                integer newFib = back1 + back2;
                evenFibs.add(newFib);         
            }   
       }
       for (Integer fib : evenFibs) {
           boolean isEven = math.mod(fib, 2) == 0 ? true : false;
           if(isEven && fib <= n){
                   evenFib += fib;
           }
		}
        system.debug(evenFib);
           return evenFib; 
    }
    
    

    public static integer sumAll(list<integer> arr) {
        integer firstNum;
        integer lastNum;
        for(integer i : arr){
            system.debug(arr[i]);
        }
        
  		return 1;
	}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}