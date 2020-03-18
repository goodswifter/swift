//
//  test.swift
//  TestSwift
//
//  Created by 钟爱东 on 2020/2/26.
//  Copyright © 2020 钟爱东. All rights reserved.
//

import Foundation

// MARK: - 查看枚举变量的内存布局
/*
 总结:
 1. 1个字节存储成员值
 2. N个字节存储关联值（N取占用内存最大的关联值），任何一个case的关联值都共用这N个字节
    - 共用体
 3. 如果成员只有一个, 不需要分配真实的内存空间
 */

func testEnum() {
    /*
     MemoryLayout<TestEnum1>.size : 1
     MemoryLayout<TestEnum1>.stride : 1
     MemoryLayout<TestEnum1>.alignment : 1
     */
    enum TestEnum1 {
        case test1, test2, test3
    }
    var t1 = TestEnum1.test1
    print(Mems.ptr(ofVal: &t1))
    t1 = .test2
    t1 = .test3
    
    /*
     MemoryLayout<TestEnum2>.size : 1
     MemoryLayout<TestEnum2>.stride : 1
     MemoryLayout<TestEnum2>.alignment : 1
     */
    enum TestEnum2 : Int {
        case test1 = 1, test2 = 2, test3 = 3
    }
    var t2 = TestEnum2.test1
    print(Mems.ptr(ofVal: &t2))
    t2 = .test2
    t2 = .test3
    
    /*
     MemoryLayout<TestEnum3>.size : 25
     MemoryLayout<TestEnum3>.stride : 32
     MemoryLayout<TestEnum3>.alignment : 8
     */
    enum TestEnum3 {
        case test1(Int, Int, Int)
        case test2(Int, Int)
        case test3(Int)
        case test4(Bool)
        case test5
    }
    
    /*
     // 前24个字节用来存储关联值
     01 00 00 00 00 00 00 00
     02 00 00 00 00 00 00 00
     03 00 00 00 00 00 00 00
     00 // 用来存储成员值的1个字节
     00 00 00 00 00 00 00 // 补充字节
     */
    var t3 = TestEnum3.test1(1, 2, 3)
    // Mems.ptr: 打印变量的地址
    print(Mems.ptr(ofVal: &t3))
    
    /*
     04 00 00 00 00 00 00 00
     05 00 00 00 00 00 00 00
     00 00 00 00 00 00 00 00
     01 // 成员值
     00 00 00 00 00 00 00
     */
    t3 = .test2(4, 5)
    
    /*
     06 00 00 00 00 00 00 00
     00 00 00 00 00 00 00 00
     00 00 00 00 00 00 00 00
     02
     00 00 00 00 00 00 00
     */
    t3 = .test3(6)
    
    /*
     01 00 00 00 00 00 00 00
     00 00 00 00 00 00 00 00
     00 00 00 00 00 00 00 00
     03
     00 00 00 00 00 00 00
     */
    t3 = .test4(true)
    
    /*
     00 00 00 00 00 00 00 00
     00 00 00 00 00 00 00 00
     00 00 00 00 00 00 00 00
     04
     00 00 00 00 00 00 00
     */
    t3 = .test5
    
    /*
     MemoryLayout<TestEnum4>.size : 0
     MemoryLayout<TestEnum4>.stride : 1
     MemoryLayout<TestEnum4>.alignment : 1
     */
    enum TestEnum4 {
        case test
    }
    var t4 = TestEnum4.test
    print(Mems.ptr(ofVal: &t4))
    
    /*
     MemoryLayout<TestEnum5>.size : 8
     MemoryLayout<TestEnum5>.stride : 8
     MemoryLayout<TestEnum5>.alignment : 8
     */
    enum TestEnum5 {
        case test(Int)
    }
    var t5 = TestEnum5.test(10)
    print(Mems.ptr(ofVal: &t5))
    
    /*
    MemoryLayout<TestEnum6>.size : 25
    MemoryLayout<TestEnum6>.stride : 32
    MemoryLayout<TestEnum6>.alignment : 8
    */
    enum TestEnum6 {
        case test0
        case test1
        case test2
        case test4(Int)
        case test5(Int, Int)
        case test6(Int, Int, Int, Bool)
    }

    /*
     0x0000000000000000
     0x0000000000000000
     0x0000000000000000
     0x00000000000000c0
     */
    var t6 = TestEnum6.test0
    print(Mems.memStr(ofVal: &t6))

    t6 = .test1
    t6 = .test2
    t6 = .test4(1)
    t6 = .test5(2, 3)
    t6 = .test6(4, 5, 6, true)


    enum TestEnum7 {
        case test0
        case test1
        case test2
        case test4(Int)
        case test5(Int, Int)
        case test6(Int, Int, Bool, Int)
    }

    enum TestEnum8 {
        case test0
        case test1
        case test2
        case test4(Int)
        case test5(Int, Int)
        case test6(Int, Bool, Int)
    }
    
    print(MemoryLayout<TestEnum5>.size) // 实际用到的内存空间
    print(MemoryLayout<TestEnum5>.stride) // 分配的内存空间
    print(MemoryLayout<TestEnum5>.alignment) // 内存的对齐参数
}
