docs: Verilog HDL을 이용한 Timer/Counter 
 

• Logic diagram
--------
   
<img width="971" alt="logic diagram" src="https://user-images.githubusercontent.com/59474775/97949318-90887180-1dd6-11eb-9e39-36f255b4cee3.png">



• TestBench 와 Source 연결
--------


<img width="1023" alt="스크린샷 2020-11-03 오후 1 17 06" src="https://user-images.githubusercontent.com/59474775/97949471-12789a80-1dd7-11eb-9162-2e8cfb7c1c71.png">
  
  7-Segment에 시분을 표시하는 verilog 소스코드를 이용하여 시뮬레이션을 관측하기 위해 테스트 벤치를 
  생성, 시뮬레이션으로 카운트되는 파형을 관측하기 위해 메인 source에서 count를 낮춰 빠르게 설정함

• Pin 연결
--------

<img width="534" alt="스크린샷 2020-11-03 오후 1 25 27" src="https://user-images.githubusercontent.com/59474775/97949796-1eb12780-1dd8-11eb-8837-43acf60fbcfb.png">
{: width="100" height="100"}

<img width="505" alt="스크린샷 2020-11-03 오후 1 25 33" src="https://user-images.githubusercontent.com/59474775/97949877-59b35b00-1dd8-11eb-8c57-4ae9442c8a00.png">
{: width="100" height="100"}

 pin R8포트 -> Signalout[0]번 
           .
           .
           .
 Pin N8포트 -> Signalout[7]번 입력
 
 Pin M9포트 -> Digit[0]번 
           .
           .
           .
 Pin M11포트 -> Digit[0]번 설정            
