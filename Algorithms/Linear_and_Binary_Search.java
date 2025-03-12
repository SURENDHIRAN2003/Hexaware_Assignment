import java.util.*;
public class Linear_and_Binary_Search {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter the size of array: ");
        int n=sc.nextInt();
        int[] array=new int[n];
        System.out.print("Enter the elements of the array: ");
        for(int i=0;i<n;i++){
            array[i]=sc.nextInt();
        }
        System.out.print("Enter the element to find in array: ");
        int find=sc.nextInt();
        System.out.println("The output of Linear Search is "+linearSearch(find,array));
        System.out.print("The output of Binary Search is "+binarySearch(find,array));
    }
    public static int linearSearch(int find, int[] arr){
        for(int i=0;i<arr.length;i++){
            if(arr[i]==find) return i;
        }
        return -1;
    }

    public static int binarySearch(int find,int[] arr){
        int first=0,last=arr.length-1;
        while(first<=last){
            int mid=(first+last)/2;
            if(arr[mid]==find) return mid;
            else if(arr[mid]<find) last=mid-1;
            else first=mid+1;
        }
        return -1;
    }
}

