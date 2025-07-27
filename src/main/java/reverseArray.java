import java.util.Iterator;
import java.util.Scanner;

public class reverseArray {

	public static void main() {
		
		 int a[]= new int[5];
		 Scanner sc= new Scanner(System.in);
		 System.out.println("Enter the number");
		 for (int i = 0; i < a.length; i++) {
			a[i]=sc.nextInt();
			
			
		}
	      System.out.println("array elements");
	      for (int i = 0; i < a.length; i++) {
	    	  System.out.println(a[i]);
	    	  
				
				
			}


	      System.out.println("array revese elements");
	      for (int i = 0; i < a.length; i++) {
	    	  System.out.println(a[i]);
	}
	
}}
