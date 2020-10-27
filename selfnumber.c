#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int Selfnum(int); // 함수 선언

int n[2];
int arr[10000];
int num=0,x=0,x1=0,x2=0,x3=0,y,y2=0,sum=0,z=0;
 

int main(){

for(int i=1;i<10000;i++){
   
    arr[Selfnum(i)] = 1;
    if(arr[i] != 1){
        printf("%d\n",i);
    }
}


return 0;
}

int Selfnum(int z){

int *numptr = n; // 포인터에 배열 할당
    
        if(sum != 9993){
            num = *numptr + z;
            
            x = num/1000; //1000
            y = num%1000;
            x1 = y/100; // 100
            y2 = y%100; 
            x2 = y2/10; // 10
            x3 = num%10; // 1
            sum = num + x + x1 + x2 + x3;

        }

return sum;
}
