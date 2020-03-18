//
//  main.swift
//  TestSwift
//
//  Created by 钟爱东 on 2020/2/23.
//  Copyright © 2020 钟爱东. All rights reserved.
//

import Foundation

enum TestEnum {
    case test1(Int, Int, Int)
    case test2(Int, Int)
    case test3(Int)
    case test4(Bool)
    case test5
}

var e = TestEnum.test1(10, 20, 30)
print(Mems.ptr(ofVal: &e))
switch e {
case let .test1(v1, v2, v3):
    print("test1", v1, v2, v3)
    
case let .test2(v1, v2):
    print("test2", v1, v2)
    
case let .test3(v1):
    print("test3", v1)
    
case let .test4(v1):
    print("test4", v1)
    
case .test5:
    print("test5")
}   

print("-----")
