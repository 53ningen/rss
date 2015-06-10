//
//  EntryConverterTest.swift
//  rss
//
//  Copyright (c) 2015年 gomi_ningen. All rights reserved.
//

import rss
import Quick
import Nimble

public class EntryConverterTest: QuickSpec {
    
    public override func spec() {
        describe("EntryConverter") {
            it("convert NSData to Entries") {
                let path = NSBundle.mainBundle().pathForResource("entries", ofType: "xml")!
                let handle = NSFileHandle(forReadingAtPath: path)
                let data = handle?.readDataToEndOfFile()
                let entries: [Entry] = EntryConverter.parseData(data!)!
                let expected: [Entry] = [
                    Entry(id: "id", published: "published", updated: "updated", url: NSURL(string: "http://gochiusa.com"), title: "title", author: "author"),
                    Entry(id: "id2", published: "published2", updated: "updated2", url: NSURL(string: "http://gochiusa.com"), title: "title2", author: "author2")
                ]
                expect(entries).to(equal(expected))
            }
        }
    }

}
