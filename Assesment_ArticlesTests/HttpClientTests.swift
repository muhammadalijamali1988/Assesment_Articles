//
//  HttpClientTests.swift
//  Assesment_ArticlesTests
//
//  Created by Muhammad Ali on 26/08/2021.
//

import XCTest
@testable import Assesment_Articles

class HttpClientTests: XCTestCase {
    var apiDownloader : APIDownloaderService!
    var expectation : XCTestExpectation!
    
    override func setUp() {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession.init(configuration: configuration)
        apiDownloader = APIDownloaderService(urlSession: urlSession)
        expectation = expectation(description: "Expectation")
        
        
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

   

    
    
    func unitTestHttpResponse(){
        let published_date : String = "2021-08-20"
        let title : String = "Make of Popular"
        let  abstract : String = "By Sheri Fink"
        let byLine : String = "By Line"
        let url : String = "https://google.com"
        let section : String = "U.S"
        let apiUrlStr = "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=SaL8qXTYW7xRiwcTQMPG1NYgVHYdxsQe"
        let apiUrl = URL(string: apiUrlStr)!
        
            let json = """
                {
        "results":[{
              "url":"\(url)",
              "published_date":"\(published_date)",
              "section":"\(section)",
              "byline":"\(byLine)",
              "title":"\(title)",
              "abstract":"\(abstract)"}]
}
"""
        let data = json.data(using: .utf8)
        MockURLProtocol.requestHandler = { request in
            guard let url = request.url, url == apiUrl else {
                throw APIResponseError.request
            }
            let response = HTTPURLResponse(url: apiUrl, statusCode: 200, httpVersion: nil, headerFields: nil)!
            
             return (response,data)
            
            }
        apiDownloader.downloadArticles { articles in
            
            for article in articles {
                XCTAssertEqual(article.title, title, "Incorrect Title")
                XCTAssertEqual(article.published_date, published_date, "Incorrect Published Date")
                XCTAssertEqual(article.section, section, "Incorrect Section")
                XCTAssertEqual(article.byLine, section, "Incorrect byLine")
                XCTAssertEqual(article.abstract, section, "Incorrect abstract")
                XCTAssertEqual(article.url, section, "Incorrect url")
                
               
                
         
            }
            self.expectation.fulfill()
        } failure: { error in
            XCTFail("Error was not expected \(error)")
        }
       
        wait(for: [expectation], timeout: 1.0)

        
    }
    
}
        
