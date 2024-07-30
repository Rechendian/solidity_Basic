// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Todos {
    struct Todo {
        string text;
        bool completed;
    }

    // 数组结构体
    Todo[] public todos;

    function create(string calldata _text, bool _completed) public {
        // 初始化结构体三种方法
        //像函数一样调用它
        // todos.push(Todo(_text, false));
        // key value
        todos.push(Todo({text: _text, completed: _completed}));
        //初始化一个空结构，然后更新它
        // Todo memory todo;
        // todo.text = _text;
        // todo.completed = _completed;
        // todos.push(todo);
    }

    function get(uint256 _index)
        public
        view
        returns (string memory text, bool completed)
    {
        // return (todos[_index].text, todos[_index].completed);
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

    // update text
    function updateText(uint8 _index,string memory _text) public{
       Todo storage todo = todos[_index];
       todo.text = _text;
    }
    // update completed
    function updateCpmpleted(uint8 _index) public{
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed ;
    }
}
