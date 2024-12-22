# f_learning_path

A new Flutter project.

## Getting Started

### Flutter 语言基础 -- 梦始之地

#### 类的定义和使用

```dart
class Math {
  int start;

  Math(
    this.start,
  );

  void cnsoleStart(value) {
    print(start);
    print(value);
  }

  // 使用get 来设置一个获取 value 的方法
  int get value {
    return start + 1;
  }

  // 使用set 来设置一个修改 start 的方法
  set add(int name) {
    print('name: $name');
    start = name;
  }
}

```
