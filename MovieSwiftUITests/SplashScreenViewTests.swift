//
//  SplashScreenViewTests.swift
//  MovieSwiftUITests
//
//  Created by Cansu Özdizlekli on 6/6/24.
//

//import XCTest
//import SwiftUI
//import ViewInspector
//@testable import MovieSwiftUI
//
//extension SplashScreenView: Inspectable {}
//
//final class SplashScreenViewTests: XCTestCase {
//    
//    func testSplashScreenTransition() throws {
//        // Given
//        let view = SplashScreenView()
//        let expectation = XCTestExpectation(description: "SplashScreen transition to ContentView after delay")
//        
//        // When
//        ViewHosting.host(view: view)
//        
//        // Then
//        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
//            do {
//                let isActive = try view.inspect().find(SplashScreenView.self).actualView().isActive
//                if isActive {
//                    expectation.fulfill()
//                } else {
//                    XCTFail("ContentView did not appear in time.")
//                }
//            } catch {
//                XCTFail("View inspection failed: \(error)")
//            }
//        }
//        
//        wait(for: [expectation], timeout: 6.0)
//    }
//}


/*
 
 // View'ı inspect ediyoruz
 let inspection = try view.inspect()
 
 // SplashScreenView instance'ını buluyoruz
 let splashScreenView = try inspection.find(SplashScreenView.self)
 
 // Gerçek SplashScreenView instance'ını alıyoruz
 let actualView = try splashScreenView.actualView()
 
 // isActive durumunu kontrol ediyoruz
 let isActive = actualView.isActive
 
 // isActive true olmalı
 XCTAssertTrue(isActive)
 
 // Expectation'ı karşılıyoruz
 expectation.fulfill()
 
 */
