# 110-2-ALCO-Project-1_1093336
---
## Test Input Dataset and Test Output 

輸入一個整數數字X，X ≦ 99，輸出為帶入遞迴公式計算之結果
#### Test Input Dataset
+ 3
+ 0
+ 80
+ 50
+ 19
+ 99

#### Test Output
+ 11
+ 1
+ 1587
+ 409
+ 3354
+ 3552
---
## 執行結果

```
Input a number:
3
The damage:
11
-- program is finished running (0) --


Reset: reset completed.

Input a number:
0
The damage:
1
-- program is finished running (0) --


Reset: reset completed.

Input a number:
80
The damage:
1587
-- program is finished running (0) --


Reset: reset completed.

Input a number:
50
The damage:
409
-- program is finished running (0) --


Reset: reset completed.

Input a number:
19
The damage:
3354
-- program is finished running (0) --


Reset: reset completed.

Input a number:
99
The damage:
3552
-- program is finished running (0) --

```
---
## 程式說明

輸入的整數X存在**s2(x19)**，**s11(x27)**為F的return值也等同於輸出，計算Function的標籤為**F**，
進入**F**時，接著判斷**s2(x19)**的範圍

* **s2 < 0** 跳至 **N_other**
    * **t2** 加 **-1**
* **s2 = 0** 跳至 **N_0**
    * **t2** 加 **1**
* **s2 = 1** 跳至 **N_1**
    * **t2** 加 **5**
* **1 < s2 ≤ 10** 跳至 **N_1_10:**
    * **s2** 減 **1** 後再次跳至 **F**，**t1** 再減 **1** 後再次跳至 **F**
* **10 < s2 ≤ 20** 跳至 **N_10_20**
    * **t1** 減 **2** 後再次跳至 **F**，**t1** 再減 **1** 後再次跳至 **F**
* **s2 > 20** 跳至 **N_20**
    * **t2** 加 **t2\*2**，**t1** 除 **5** 後再次跳至 **F**   

每個case執行完後將直接跳至**Exit**，將**sp**中的**t1**及**ra**取出後跳至ra儲存的位置，
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
