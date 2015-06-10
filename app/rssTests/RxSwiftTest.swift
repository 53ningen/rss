//
//  RxSwiftTest.swift
//  rss
//
//  Copyright (c) 2015年 gomi_ningen. All rights reserved.
//

import Quick
import Nimble
import RxSwift

class RxSwiftTest: QuickSpec {
    
    override func spec() {
        describe("RxSwift") {
            it("filter/map") {
                let a = Variable(1)
                a   >- filter { $0 > 11 }
                    >- map { "number: \($0)" }
                    >- subscribeNext { println($0) }
                a.next(12)
                a.next(19)
                a.next(10)
            }
            it("http client sample") {
                let url = NSURL(string: "http://gochiusa.com")!
                self.get(NSURLRequest(URL: url)) >- subscribeNext {
                    println(NSString(data: $0, encoding: NSUTF8StringEncoding))
                }
            }
        }
    }
    
    func get(request: NSURLRequest) -> Observable<NSData> {
        var data = Variable(NSData())
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {
            (_, d, e) in data.next(d)
        })
        return data
    }

}
