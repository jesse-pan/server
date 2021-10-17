## GO语言

### 基础数据类型



~~~go
package main
import fmt
func main() {
    fmt.Println("Hello, World!")
}
~~~

 

#### 1.1 数组

##### 1 定长数组

~~~go
// C语言中的定义：int nums[10] = {1, 2, 3, 4}
// go语言中的定义：
// nums := [10]int{1,2,3,4}
// var nums = [10]int{1,2,3,4}
// var nums [10]int = [10]int{1,2,3,4}
nums := [10]int{1,2,3,4}
// 遍历：C风格的遍历
for i := 0; i < len(nums); i++ {
    fmt.Println("i: ", i, ", value: ", nums[i])
}
// 遍历： for range
for index, value := range nums {
    fmt.Println("index: ", index, ", value:", value)
}
~~~

#### 2 变长数组

变长数组也叫切片（slice），动态数组与C++中的vector类似，是一个自动动态调整容量的数组。

~~~
// 动长数组的声明
nums := []int{1,2,3}
~~~

####  3. 高效的GC垃圾回收

三色标记，混合写屏障



简单易学：

1. 25个关键字
2. C语言简洁基因，内嵌C语法支持；
3. 面向对象特征；
4. 跨平台

### GO插件的安装

> 命令：go get github.com/plugin
>
> 例如安装protoc-gen-go
>
> ```shell
> go get github.com/golang/protobuf
> ```

安装失败时，可以配置代理

> ```
> go env -w GO111MODULE=on  //打开模块
> go env -w GOPROXY=https://goproxy.cn,direct //启用代理
> ```



### GRPC的学习

#### 安装

[官网](https://www.grpc.io/)

支持go、C++等语言。

> GO

1. 安装go
2. 安装protocol buffer
3. 安装go插件

