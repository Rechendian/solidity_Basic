## Solidity 基础

为了优化 Solidity 智能合约的 gas 费用，我会采取以下策略：

1. 减少存储操作，尽量批量操作和最小化状态变量的数量。
2. 使用更小的数据类型，如 uint8 代替 uint256，并紧凑排列结构体中的变量。
3. 避免在循环中执行存储操作，尽量在链下预计算数据。
4. 合理设计函数和逻辑，减少外部调用，并在合适的情况下使用内联汇编。
5. 使用常量和不可变变量，利用 constant 和 immutable 关键字。
6. 对复杂合约进行分解，以减少单个合约的复杂度和 gas 费用。
7. 使用库来重用代码，减少重复代码。
8. 慎用动态数组，尽量避免频繁的动态数组操作。
9. 使用映射来存储和访问数据，特别是对于稀疏数据。

通过这些优化策略，我可以显著减少合约的 gas 费用，提高合约的运行效率和成本效益。

### 在 Solidity 中，`storage`、`memory` 和 `calldata` 是三种不同的数据存储位置，它们在不同场景中有不同的用途和成本。

1. `storage` 变量存到区块链上用具储存，消耗 gas 大
2. `memory` 一般用于函数的参数，可以给他进行修改，消耗 gas 中。字符串(string),数组(array),结构体(struct)等类型的数据只能存储在 memory 中
3. `calldata` 一般用于函数的参数，他是只读的 只能读取不能像`memory`一样进行修改 消耗 gas 小

通过合理选择这三种存储位置，可以优化合约的性能和成本。

### 在 Solidity 中，`view` 和 `pure` 函数修饰符用于指示函数对合约状态的影响：

1. `view` 函数允许读取合约的状态变量，但不允许修改它们。调用 `view` 函数不会改变区块链的状态，因此在外部调用时不会消耗 gas。它们适用于需要读取状态变量的场景。
2. `pure` 函数既不允许读取也不允许修改合约的状态变量。它们仅进行纯计算，不访问任何状态变量或区块链的环境变量。`pure` 函数适用于只依赖输入参数进行计算的场景。

通过使用 `view` 和 `pure` 修饰符，可以明确函数的行为和优化合约的性能。

### Solidity 结构体(Structs)

结构体就是可以自定义类型的一个类型

```solidity
    struct Todo {
        string text;
        bool completed;
    }
```

### require、revert 和 assert 是三种 Error

require 和 revert 主要用于处理可预见的错误，回滚状态并退还剩余的 gas，通常用于验证输入和外部调用。
assert 用于检查不变量，确保代码逻辑正确。如果 assert 失败，意味着代码中存在严重的错误，所有剩余的 gas 会被消耗。

### import 导入本地或者外部合约 new

solidity new 关键字是部署一个新的合约。
合约 1 new 合约 2 。合约 2 部署 , new 出来的是合约的实例 可以访问实例合约里面的内容

### solidity 继承(Inheritance)

is 是继承合约的关键字
`virtual` 和 `override` 是重写关键字, 重写只能重写方法 不能直接重写变量

- 合约 A 是父类 合约 B 是子类，合约 B is 合约 A
- 父类这个函数可以被重写要加上关键字: virtual 例如: `public pure virtual returns `
- 子类重写父类要加上关键字: virtual override 例如: `public pure virtual override returns `

```solidity
contract A {
    function foo() public pure virtual returns (string memory) {
        return "A";
    }
}
contract B is A {
    function foo() public pure virtual override returns (string memory) {
        return "B";
    }
}
```

`super` 调用父级合约也可以直接使用 super 例如: `super.foo()` 就可以调用父级的 foo 函数

```solidity
contract A {
    function foo() public pure returns (string memory) {
        return "A";
    }
}
contract B is A {
    function foo() public pure override returns (string memory) {
        return super.foo();
    }
}
```

### Modifier 函数装饰器

可以在函数执行前后添加逻辑，或者限制某些函数的访问权限。

```solidity
     modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }
```

### 构造函数(Constructor)

相当于 js 的 super 调用父类的构造函数

```solidity
contract E is X {
    constructor()  X("X was called") {}
}
```

### solidity 事件(Events)

事件是合约和区块链交互的一种方式，用于通知外部用户合约状态的变化。事件可以被监听和查询，从而实现合约的透明度和可追溯性。
indexed 是排序

```solidity
event Log(address indexed sender, string message);

function foo() public {
    emit Log(msg.sender, "Hello, world!");
}
```

### solidity 可见度(Visibility)

变量方法可见度

- public：公开的，可以在合约内部和外部访问。
- external：外部的，只能在合约外部调用，不能在合约内部调用。
- internal：内部的，只能在合约内部访问，不能在合约外部访问。
- private：私有的，只能在合约内部访问，不能在合约外部访问。

### solidity 接口(interface)

接口没有任何功能 他只是合约之间通信的标准和桥梁 按照接口的规则两个合约可以进行交互，接口类型必须是 external。
如果想调用其他合约需要提供对方部署的合约地址进行地址转换要不然是不可以使用的

```solidity
//合约1
contract A {
    uint256 public num;

    function get() public view returns (uint256) {
        return num;
    }

    function set() public {
        num = 1;
    }
}
//接口
interface B {
    function get() external view returns (uint256);

    function set() external;
}
//合约2
contract C {
    function getFromB(address bAddress) public view returns (uint256) {
        B bContract = B(bAddress); // 将地址转换为接口类型
        return bContract.get(); // 调用接口方法
    }
}
```
