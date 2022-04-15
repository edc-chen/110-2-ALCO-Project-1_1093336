# 110-2-ALCO-Project-1_1093336
---
## Test Input Dataset and Test Output 

輸入一個整數數字X，X ≦ 99，輸出為帶入遞迴公式計算之結果
#### Test Dataset
+ Case# 1
###### Input
```
Input a number:
3
```
###### Output
```
The damage:
11
```
+ Case# 2
###### Input
```
Input a number:
0
```
###### Output
```
The damage:
1
```
+ Case# 3
###### Input
```
Input a number:
80
```
###### Output
```
The damage:
1587
```
+ Case# 4
###### Input
```
Input a number:
50
```
###### Output
```
The damage:
409
```
+ Case# 5
###### Input
```
Input a number:
19
```
###### Output
```
The damage:
3354
```
+ Case# 6
###### Input
```
Input a number:
99
```
###### Output
```
The damage:
3552
```

---

## 程式說明

重點參數使用介紹
+ **s2(x19)**  : 輸入的整數X   
+ **s3(x20)**  : 僅作為F內部的判斷用數字   
+ **s5(x22)**  : 僅作為開頭判別是否會過小讓程式壞掉    
+ **s11(x27)** : 為F的return值也等同於輸出   

計算Function的標籤為**F**，進入**F**時，接著判斷**s2(x19)**的範圍
* **s2 < 0** 跳至 **N_other**
    * **s11** 加 **-1**
* **s2 = 0** 跳至 **N_0**
    * **s11** 加 **1**
* **s2 = 1** 跳至 **N_1**
    * **s11** 加 **5**
* **1 < s2 ≤ 10** 跳至 **N_1_10:**
    * **s2** 減 **1** 後再次跳至 **F**，**s2** 讀回儲存過的原始數字在減 **2** 後再次跳至 **F**
* **10 < s2 ≤ 20** 跳至 **N_10_20**
    * **s2** 減 **2** 後再次跳至 **F**，**s2** 讀回儲存過的原始數字在減 **3**  再減 **1** 後再次跳至 **F**
* **s2 > 20** 跳至 **N_20**
    *  先利用**t6**設成**5**，**s2** 除 **t6** 後再次跳至 **F** 
    *  利用**t6**儲存**s2**的值，**s11** 加 **t6\*2** 

每個Case一開始都會對**sp**做加上-8，並在結束後將**sp**中的**ra**及**s2**取出後跳至ra儲存的位置，並且對**sp**做加**8**來恢復先前被減掉的部分    
若返回主程式，就輸出程式結果並結束程式

---

## 遞迴函式 By:C++ code
```
int F(int ans){
	if(ans < 0)
		return -1;		
	if(ans == 0)
		return 1;		
	if(ans == 1)
		return 5;		
	if(ans > 1 && ans <= 10)
		return F(ans - 1) + F(ans - 2);
	if(ans > 10 && ans <= 20)
		return F(ans - 2) + F(ans - 3);
	if(ans > 20)
		return 2 * ans + F(ans / 5);
}
```
